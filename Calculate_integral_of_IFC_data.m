


% this script calculates number of IFC counts per spill
ifc_hist_C12 = load("hist_0259_C12_017_100msec_bins.txt");
ifc_hist_C10a = load("hist_0255_C10_014_100msec_bins.txt");
ifc_hist_C10m = load("hist_0256_C10_015_100msec_bins.txt");
ifc_hist_C11 = load("hist_0248_C11_012_100msec_bins.txt");
%sum(ifc_hist_C10a(1:9070,2))
sum(ifc_hist_C10m(1:9070,2))
sum(ifc_hist_C11(1:9070,2))
sum(ifc_hist_C12(:,2))


return;
counts_accum = 0;
index_start = 174; %look up in how the IFC is shifted in respect to PET, look for zero

for k=1:250
    counts_in_spill(k) = 0;
    for i=index_start:length(ifc_hist)
        if and(ifc_hist(i)>0, ifc_hist(i) <= ifc_hist(index_start)+4.8*k)
            counts_in_spill(k) = counts_in_spill(k) + ifc_hist(i,2);
        end
    end
end

cycles = [1 2 3 4 7 10 30 70 100 250];
ifc_integr = [ 820842.54 1642558.44 2451504.86 3235147.18 5647507.8 8059905.32 23695779.16 54228308.44 77465535.38 194874987.4];
pet_integr = [ 95161.00 280590.00 543340.00 860120.00 2126600.00 3670700.00 16273000.00 42064000.00 61577000.00 161490000.00 ];

% cycles = [1 2 3 4 7 10];
% ifc_integr = [ 820842.54 1642558.44 2451504.86 3235147.18 5647507.8 8059905.32  ];
% pet_integr = [ 95161.00 280590.00 543340.00 860120.00 2126600.00 3670700.00  ];
time = [4.8 2*4.8 3*4.8 4*4.8 7*4.8 10*4.8 30*4.8 70*4.8 100*4.8 250*4.8];

figure;
subplot(2,2,1);
plot(cycles,ifc_integr,'.','MarkerSize', 20);
xlabel('Cycles');
ylabel('Integral of implanted ions (cal IFC counts)');

subplot(2,2,2);
plot(cycles,pet_integr,'.','MarkerSize', 20);
xlabel('Cycles');
ylabel('Integral of decay events (sens corr PET counts)');
set(gca, 'YScale', 'log')

f1 = fit(ifc_integr',pet_integr','a*x^n');
%fexp = fit(ifc_integr',pet_integr','x-1./l+1./l*exp(-l*x)','Lower',[0],'Upper',[0.1]);
fexp = fit(ifc_integr',pet_integr','x-t*(1-exp(-x/t))','Lower',[0],'Upper',[28]);
fexp2 = fit(time',pet_integr','a+x-t*(1-exp(-x/t))');
cf1 = coeffvalues(f1);
cfexp = coeffvalues(fexp)
cfexp2 = coeffvalues(fexp2)
t12 = cfexp*log(2)
subplot(2,2,3);

hold on;
%plot(f1,ifc_integr,pet_integr);
plot(fexp,ifc_integr,pet_integr);
%plot(ifc_integr,pet_integr,'.','MarkerSize', 20);
ylabel('Integral of decay events (sens corr PET counts)');
xlabel('Number of implanted ions (cal IFC counts) per cycle');

subplot(2,2,4);
plot(fexp2,time,pet_integr);
ylabel('Integral of decay events (sens corr PET counts)');
xlabel('Time (sec)');
set(gca, 'YScale', 'log')
