% performs a midplane reconstruction
% input file is a converted data file, not reduced
% the image is directly made as a histogram

datafile_red = uigetfile('*.mat')
z=load(datafile_red)
events=z.z;
clear z;
% start time counter
tic;

nevents=length(events)  % number of events
DOI = 8; % mm; the DOI assumed and used to calculate the LoR endpoints 
PlaneOffset = 0;   % position of image plane from scanner center, in mm 
% 252 mm = distance between the scanner panels
intermoduleOffset = 252+2*DOI; % assumes flat panels
pixelsize = 2;   % image pixels size in mm
midplaneImage = zeros(104,104);

% The line below makes a matrix to store the (x,y,z) coordinates of endpoints of the LoRs
% lor=zeros(nevents,6);    
% stores the coordinates of the ends of the LoRs

for n= 1:nevents
    
% the 2 lines below are when using a NON-REDUCED data file
%    [crystalPos1x,crystalPos1y] = positionCalculateSiemens(events(n,3),events(n,4));
%    [crystalPos2x,crystalPos2y] = positionCalculateSiemens(events(n,5),events(n,6));

% the 2 lines below are when using a REDUCED data file
    [crystalPos1x,crystalPos1y] = positionCalculateSiemens(events(n,1),events(n,2));
    [crystalPos2x,crystalPos2y] = positionCalculateSiemens(events(n,3),events(n,4));

% below, the x-direction is reversed to reflect the scanner installation
% with DEA0-15 facing DEA6-3, DEA0-0 facing DEA6-12 etc.
    crystalPos2x = 208-crystalPos2x;

    crystalPos1z =0.0013*(crystalPos1y-104).^2; % takes curvature into account ?
    crystalPos2z =0.0013*(crystalPos2y-104).^2; % takes curvatur into account ?

P1 = [crystalPos1x, crystalPos1y, intermoduleOffset/2+crystalPos1z]; % LOR endpoint #1
P2 = [crystalPos2x, crystalPos2y, -intermoduleOffset/2-crystalPos2z]; % LOR endpoint #2 
u = P2-P1;  % directional vector along the LOR

midplaneCrossingx=(PlaneOffset-P1(3))*u(1)/u(3)+P1(1);    % x coordinate of mid plane crossing
midplaneCrossingy=(PlaneOffset-P1(3))*u(2)/u(3)+P1(2);    % y coordinate of mid plane crossing

% NOTE: CHANGE COORDINATES SUCH THAT DOWNSTREAM BEAM IS IN POSITIVE X
% DIRECTION IN THE IMAGE
% NOTE: what is defined as the scanner x-coordinate is the y-coordinate in
% the image...
midplanePixelx=floor(midplaneCrossingx/pixelsize)+1;       % add 1 because index 0 is not allowed
midplanePixely=103-floor(midplaneCrossingy/pixelsize)+1;

midplaneImage(midplanePixelx,midplanePixely) = midplaneImage(midplanePixelx,midplanePixely)+1;

end

figure('Name','Midplane reconstruction','NumberTitle','off'); 
xrange = [-104:2:104];
yrange = [-104:2:104];
image = imagesc(xrange,yrange,midplaneImage)
colorbar
set(gca,'ColorScale','log')
axis square;
axis xy;
ax = gca;
ax.FontSize = 14;
ax.XLim = [-105,105];
ax.YLim = [-105,105];
xlabel('X (mm)');
ylabel('Y (mm)');
xticks([-120:20:120]);
yticks([-120:20:120]);
ax.TickDir = 'out';
ax.TickLength = [0.02 0.02];
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.GridLineStyle = '--';
ax.GridAlphaMode = 'manual';
ax.GridAlpha = 0.5;
ax.GridColorMode = 'manual';
ax.GridColor = 'white';
colorbar
%set(gca,'ColorScale','log');
% stop time counter
toc;

figure('Name','Projection of Midplane reconstruction','NumberTitle','off');
horProj = sum(midplaneImage, 2);
xx = [-104:208/103:104];
plot(xx,horProj);
set(gca,'ColorScale','log');
% 
% [filepath,name,ext] = fileparts(datafile_red); %separates path, name and extension of the file
% figname = strcat('Q:\Documents\PET\Pics\',name,'_reconstr.png'); % create name for figure
% saveas(gcf, figname)  % save figure with the proper name to folder

