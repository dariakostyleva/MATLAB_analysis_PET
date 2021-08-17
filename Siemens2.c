int Siemens2(int, char **);

   #include "mex.h"
    #include "matrix.h"
   void mexFunction(int nlhs, mxArray *plhs[], int nrhs,
     const mxArray *prhs[])
    {
    int argc = 0;
    char **argv;
    int i, result;

    argc = nrhs;
    argv = (char **) mxCalloc(argc, sizeof(char *));

    for(i=0; i<=2; i++) // originally set to 0 and 1 which don't work
    {
    if( !mxIsChar(prhs[i])){
    mexErrMsgTxt("Input must be of type char.");
    return;
    }
    argv[i] = mxArrayToString(prhs[i]);
    }

    result = Siemens2(argc, argv);

    for(i=argc-1; i<=0; i--)
    mxFree( argv[i] );
    mxFree( argv );

//     plhs[0] = result;
//     if(result)
//      mexErrMsgTxt("main function causes an error");
    }
/* lmtime_align.c */

/* utility that processes coincidence data with time difference information and computes time offset corrections */

static char* version_id="lmtime_align.c V1.06 30-Jan-2014 L. Byars";

static char *usage="\n\
  -i <lmfile> :        specifies list mode file to process\n\
  -o <toff_file> :     specifies output time offset file \n\
  -h <cthist_file> :   specifies output crystal timing histogram file \n\
  -b bufsize :         size of event buffer [800000]\n\
  -e <terr_file> :     specifies input time correction file\n\
  -B TDBits :          number of bits in time correction [6]\n\
  -M mp :              specifies specific module pair to process [5] or -1 for full scanner\n\
  -A <call_file> :     specifies output file for all coin histograms (big)\n\
  -r :                 don't perform randoms subtraction\n\
  -C <cr_file>:        store countrate information here\n\
  -v :                 set verbosity +1\n\
\n";

static char *options="i:o:h:vb:e:B:M:A:rC:";

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <getopt.h>

#define crash(...) {fprintf(stderr,__VA_ARGS__); mexErrMsgIdAndTxt("Testinputs:ErrorIdOut", __VA_ARGS__);}

int verbose=0;
char *lmfile=NULL; 
char *toff_file=NULL;
char *cthist_file="cthist.dat"; // defines the output timing histogram file 
char *tcor_file=NULL;
char *allc_file=NULL;
char *cr_file=NULL;
int mpsel=5;
int report_crate=0;

long delta_msec( struct timeval *stod, struct timeval *etod)
{
  int del_sec, del_usec;
  del_sec = etod->tv_sec - stod->tv_sec;
  del_usec = etod->tv_usec - stod->tv_usec;
  return 1000*del_sec+del_usec/1000;
} // retreive processing time 

int Siemens2( int argc, char **argv)
{
	int bufsize=8*100000; // needs to be multiple of 8
	char *cbufr=NULL;
	char *bptr; // used to point to the current event word (8 bytes long)
	int c;
	FILE *fptr, *fptr1, *fptr2,  *coin, *CoinPanelA, *CoinPanelB; // I created the *coin to point to the output file which holds the coincidence data
  FILE *cr_fptr=NULL;
	int nbytes;
	int i;
	int sync_lo, sync_hi; // for synchronizing the two word pair for each event 
	int mpair;
	int tagcnt=0;
	int ax, ay, bx, by, tdiff, ca, cb, cax, cay, cbx, cby;
    int event_time, Beam_tag; // =0;
	int fov=9;
	int nheads=2; // for bench system only 2 "heads" are supported...mp=5 (heads 0 and 6);
	int nxy=52;
	int *chists=NULL;
	int *ccnts=NULL;
	int syncerr=0;
	int mperr=0;
	int event_cntr=0;
	int p_cntr=0;
	int d_cntr=0;
	int nh=64; // number of histogram channels
	int mp, incr;
	unsigned long *iptr;
	int *tcor=NULL;
	int tdbits=6;
	int *mplkup=NULL;
  short int *allc=NULL;
  int ncry,ba,bb,x,y;
	int rinc=-1;
	int last_pctr=0;
	int last_dctr=0;
  struct timeval t0,t1;
//FILE *ffff = fopen("tjo.txt", "wb");
  
  int coinc_data[10]; // Created by me to hold four variables required for reconstruction i.e 2 for x and y address, time difference, prompt or not
  int PanelA [52][52] = {};
  int PanelB [52][52] = {};
  if (argc < 2) {
		printf("%s compiled %s %s\n", version_id, __DATE__, __TIME__);
		crash("%s", usage);
	} // If the parameters for the execution is not provided, then the If statement is returned and no further processing
	gettimeofday( &t0, 0);
	while ((c=getopt(argc, argv, options)) != -1)
		switch(c) {
			case 'i':	lmfile=optarg; break;
			case 'o':	toff_file=optarg; break;
			case 'h':	cthist_file=optarg; break;
			case 'b':	bufsize=atoi(optarg); break;
			case 'e': tcor_file=optarg; break;
			case 'v': verbose++; break;
			case 'B': tdbits=atoi(optarg); break;
			case 'M': mpsel=atoi(optarg); break;
		  case 'r': rinc=0; break;
      case 'A': allc_file=optarg; break;
			case 'C':	cr_file=optarg; break;
		}
//fprintf(ffff, " 0\n"); fflush(ffff);
	if (verbose) printf("%s compiled %s %s\n", version_id, __DATE__, __TIME__);
//fprintf(ffff, " 1\n"); fflush(ffff);
	if (!lmfile) crash("Please specify input listmode file with -i <filename>\n");
//fprintf(ffff, " 2\n"); fflush(ffff);
	fptr=fopen( lmfile, "rb"); // to read the data in the listmode file 
//fprintf(ffff, " 3\n"); fflush(ffff);
	if (!fptr) crash("Unable to open lmfile '%s'\n", lmfile);
//fprintf(ffff, " 4\n"); fflush(ffff);
	cbufr=(char*)malloc(bufsize); // allocate a buffer memory which holds the bytes from the input file 
//fprintf(ffff, " 5\n"); fflush(ffff);
	if (!cbufr) crash("malloc for %d bytes failes\n", bufsize);
//fprintf(ffff, " 6\n"); fflush(ffff);
	nh=1<<tdbits; printf("tdbits=%d nh=%d\n", tdbits,nh);
//fprintf(ffff, " 7\n"); fflush(ffff);
	chists=(int*) calloc( nxy*nxy*nheads*nh, sizeof(int)); // size of the chist >> cthist.dat file; time histogram on each detector crystal
//fprintf(ffff, " 8\n"); fflush(ffff);
	if (!chists) crash("calloc failed for chists\n");
//fprintf(ffff, " 9\n"); fflush(ffff);
	ccnts=(int*) calloc( nxy*nxy*nheads, sizeof(int));
//fprintf(ffff, " 10\n"); fflush(ffff);
	if (!ccnts) crash("calloc failed for ccnts\n");
//fprintf(ffff, " 11\n"); fflush(ffff);
	tcor=(int*) calloc( nxy*nxy*nheads, sizeof(int));
//fprintf(ffff, " 12\n"); fflush(ffff);
	if (!tcor) crash("calloc failed for tcor\n");
//fprintf(ffff, " 13\n"); fflush(ffff);
	if (tcor_file) {
		fptr1=fopen(tcor_file, "rb"); // read from the time correction file 
		if (!fptr1) crash("unable to open tcor_file '%s'\n", tcor_file);
		nbytes=fread(tcor, sizeof(int), nxy*nxy*nheads, fptr1);
		if (nbytes != nxy*nxy*nheads) crash("not enough data in tcor_file\n"); // the number of bytes in the tcor file must match the total number of detectors 
		fclose(fptr1);
		printf("tcor read from '%s'\n", tcor_file);
	}
//fprintf(ffff, " 14\n"); fflush(ffff);
	fptr2=fopen( cthist_file, "wb"); // file pointer for writing the timing histogram 
	if (!fptr2) crash("Can't create output file '%s'\n", cthist_file);
  if (cr_file) cr_fptr=fopen( cr_file, "w"); // this is a text file 
  ncry=nxy*nxy;
	if (allc_file) allc=(short int*)calloc(nh*ncry*ncry,sizeof(short int));
	 coin = fopen("coin.dat", "wb"); // file pointer for writing the coincidence information
	while (!feof(fptr)) {
		nbytes=fread( cbufr, 1, bufsize, fptr);
		i=0; // start at the beginning
		while (i < nbytes) {
			bptr=cbufr+i; // point to the event word;
			// first check for sync error
			sync_lo=bptr[3]&0x80; // bit 7, bit masking operation to retrieve bit 31
			sync_hi=bptr[7]&0x80; //  bit masking operation to retrieve bit 31
			if ((sync_lo != 0) || (sync_hi != 0x80)) {
				syncerr++;
				if (verbose) printf("Sync Error %d\n", syncerr);
				i++; // advance by 1 byte to try to resync
				if (syncerr > 100) crash("too many sync errors...make sure this is properly formatted data!\n");
				continue; // bits should be equal to 0 and 1
			}
			// now check for a tag word
			if (bptr[3]&0x40) { // if non-zero, this is a tag word
				tagcnt++;
				iptr=(unsigned long*) bptr;
                unsigned char first = bptr[0];
			unsigned char second = bptr[1];
			unsigned char third = bptr[2];
			unsigned char fourth = bptr[3];
			unsigned int LW = (unsigned int)fourth << 24 | third << 16 | second << 8 | first; // comment out later
			unsigned char fifth = bptr[4];
			unsigned char sixth = bptr[5];
			unsigned char seventh = bptr[6];
			unsigned char eigth = bptr[7];
			unsigned int HW = 	(unsigned int)eigth << 24 | seventh << 16 | sixth << 8 | fifth; // comment out later
			unsigned int bigvar;
		bigvar = (unsigned int)sixth << 24 | fifth << 16 | second << 8 | first; //used till 28/02/2019
		//	bigvar = (unsigned int)HW<< 32 | LW;
		 if ((bigvar & 0xE0000000L) == 0x80000000L)
		//event_time = bigvar& 0x1FFFFFFF; //used till 28/02/2019
	event_time = ( ((HW & 0x1fff)<<16) | (LW & 0xffff) ); // this works too
			if (((bptr[5])&0xFF) == 0xE2)
		Beam_tag = bigvar & 0x0000FFFF;	
				if (verbose) printf("Tagword : %16.16lx %d\n", *iptr, tagcnt);
				i+=8;
				if (cr_fptr && (tagcnt%1000 == 0)) {
					fprintf(cr_fptr,"%3d %d %d\n", tagcnt/1000, (p_cntr-last_pctr), (d_cntr-last_dctr));
					last_pctr=p_cntr;
					last_dctr=d_cntr;
				}
				continue;
			}
			// assume it is a coincidence word...decode it
			mp=(bptr[2]&0x07)|((bptr[6]&7)<<3);
			if (mp != mpsel){ // bench system only has 2 "heads", 0 and 6 which are mp 5
				iptr=(unsigned long*) bptr;
				if (!mperr) printf("Invalid MP = %d %16.16lx\n", mp, *iptr);
				mperr++;
				if (mperr > 100) crash("too many MP errors...specify -M -1 to process all module pairs\n");
				i+=8;
				continue;
			}
			cax=bptr[0]%52;
			cay=bptr[1]%52;
			cbx=bptr[4]%52;
			cby=bptr[5]%52;
            ca=52*(bptr[0]%52)+(bptr[1]%52); // detector address on head A
			cb=52*(bptr[4]%52)+(bptr[5]%52); // detector address on head B
//			tdiff=(32+tcor[ca]+tcor[cb+52*52]+(((bptr[3]&0x0e)>>1)|((bptr[7]&0x0e)<<2)))%64; // time difference retrieved from byte 3 and 7
			tdiff=(32+(((bptr[3]&0x0e)>>1)|((bptr[7]&0x0e)<<2)))%64; // to accumulate information required for reconstruction, one needs to store the ca and cb and tdiff
			if (tdbits > 6) tdiff=tdiff<<(tdbits-6);
			tdiff=(nh+tdiff+tcor[ca]+tcor[cb+52*52])%nh;
			incr=(bptr[7]&0x40)?1:rinc; // prompt or delay
      chists[ca*nh+tdiff]+=incr; // increment the corresponding time bin on the crystal of head A
      chists[cb*nh+tdiff+nxy*nxy*nh]+=incr; //  increment the corresponding time bin on the crystal of head B
      coinc_data[0] = ca; 
      coinc_data[1] = cb;
      coinc_data[2] = cax;
      coinc_data[3] = cay;
      coinc_data[4] = cbx;
      coinc_data[5] = cby;
      coinc_data[6] = tdiff;
      coinc_data[7] = incr;
       coinc_data[8] = event_time;
      coinc_data[9] = Beam_tag;
      
     PanelA[cax][cay] += 1;
     PanelB[cbx][cby] += 1;
     
      fwrite(&coinc_data, sizeof(coinc_data), 1, coin); // write the coincidence data to file
     		// we use different crystal id for allc
			// ca = crystal in block ba
			// cb = crystal in block bb
			// ba is block in first head
			// bb is block in second head
			x=bptr[1]%52;
			y=bptr[0]%52;
			ca=(x%13)+13*(y%13);// why modulo here 
			ba=(x/13)+4*(y/13);// why normal division here 
			x=bptr[5]%52;
			y=bptr[4]%52;
			cb=(x%13)+13*(y%13);
			bb=(x/13)+4*(y/13);
			if (allc) allc[tdiff+nh*(ca+169*ba)+nh*ncry*(cb+169*bb)]+=incr;
			//if (allc) allc[tdiff+nh*ca+nh*ncry*cb]+=incr; 
      i+=8;
			event_cntr++;
			if (incr>0) p_cntr++; else d_cntr++;
		}
	}
	fclose(fptr);
    
	printf("syncerr=%d\n", syncerr);
	printf("event_cntr=%d\n", event_cntr);
	printf("tagcnt=%d\n", tagcnt);
   fwrite( chists, nh*nxy*nxy*nheads, sizeof(int), fptr2);
	fclose(fptr2);
//     if (CoinPanelA) {
    	CoinPanelA = fopen("CoinPanelA.dat", "wb"); // file pointer for populating the detector coordinates in PANEL A
	   fwrite(PanelA, sizeof(int), 52*52, CoinPanelA);
     fclose (CoinPanelA);
// } else {
//     perror("fopen");
// }
    CoinPanelB = fopen("CoinPanelB.dat", "wb"); // file pointer for populating the detector coordinates in PANEL B 
    fwrite(PanelB, sizeof(int), 52*52, CoinPanelB);
    fclose (CoinPanelB);    
	  if (allc) {
    fptr2=fopen(allc_file, "wb");
    if (!fptr2) crash("Sorry, failed to create allC file '%s'\n", allc_file);
    fwrite(allc, nh*ncry*ncry, sizeof(short int), fptr);
    fclose(fptr2);
    fclose (coin);
      }
  gettimeofday(&t1, 0);
  printf("Processing complete in %0.1f seconds\n", delta_msec(&t0, &t1)/1000.);
//fclose(ffff);
	system(0);
}
/* processing in IDL...
; this code will start with raw coincidence data and compute 2nd order time correction using default time precision (78 psec)
terr=lonarr(52*52*2)
$lmtime_align -i plain_source_4000sec -h /tmp/thist
h=read_data('/tmp/thist',lonarr(64,52*52*2))
th=total(h,2)&plot,th,psym=1&print,78*fwhm(th),centroid(th)&x=findgen(64)&oplot,gaussfit(x,th,a,nterms=3),color='ff'x&print,a[1],78*a[2]
for i=0,5407 do cent[i]=fix(centroid(h[*,i])+.5)
terr=terr+32-cent
write_data,long(terr),'/tmp/tcor.dat'
$lmtime_align -i plain_source_4000sec -h /tmp/thist -e /tmp/tcor.dat
h=read_data('/tmp/thist',lonarr(64,52*52*2))
th=total(h,2)&plot,th,psym=1&print,fwhm(th),centroid(th)&x=findgen(64)&oplot,gaussfit(x,th,a,nterms=3),color='ff'x&print,a
for i=0,5407 do cent[i]=fix(centroid(h[*,i])+.5)
terr=terr+32-cent
write_data,long(terr),'/tmp/tcor.dat'
;
;
;
niter=30
.run
nc=52*52*2
terr=lonarr(nc)
write_data,terr,'/tmp/tcorB8.dat'
for iter=1,niter do begin
  spawn,'lmtime_align -i plain_source_4000sec -h /tmp/thistx4 -e /tmp/tcorB8.dat -B 8',results
  h4=read_data('/tmp/thistx4',lonarr(256,nc))&th4=total(h4,2)
	c=where(th4 gt 0)
  plot,x,th4,psym=1,xr=[50,200]&oplot,c,gaussfit(c,th4[c],a,nterms=3),color='ff'x&print,iter,a[1],2.35482*78*a[2]/4
  for i=0,5407 do begin
		c=where(h4[*,i] gt 0)
	  q=gaussfit(c,h4[c,i],a,nterms=3)&cent2[i]=a[1]
	endfor
  terr=terr+256*(128-round(cent2))/256&write_data,long(terr),'/tmp/tcorB8.dat'
endfor
end
;
; iterate with B bits
;
niter=30
b=8
lmfile='plain_source_1.5inch_off_center_4000sec'
.run
nc=52*52*2
nv=2^b
nv2=nv/2
x=indgen(nv)
ccent=fltarr(nc)
creso=fltarr(nc)
terr=lonarr(nc)
write_data,terr,'/tmp/tcor.dat'
rscale=2.35482*78*64/nv
cmd='lmtime_align -i '+lmfile+' -h /tmp/thist -e /tmp/tcor.dat -B '+istr(b)&print,cmd
for iter=1,niter do begin
	spawn,cmd,results
  h2=read_data('/tmp/thist',lonarr(nv,nc))&th2=total(h2,2)
	c=where(th2 gt 0)
  plot,x[c],th2[c],psym=1,title='Iter '+istr(iter)
	oplot,c,gaussfit(x[c],th2[c],a,nterms=3),color='ff'x
	print,iter,a[1],rscale*a[2]
;	if iter eq 1 then base_cent=a[1]
	base_cent=a[1]
	base_cent=nv/2
  base_cent=32.3881
  for i=0,nc-1 do begin
		c=where(h2[*,i] gt 0)
	  q=gaussfit(x[c],h2[c,i],a,nterms=3)
		ccent[i]=a[1]
		creso[i]=rscale*a[2]
	endfor
  terr=terr+round(base_cent-ccent)/2&write_data,long(terr),'/tmp/tcor.dat'
endfor
end
;
*/
							
			
		
