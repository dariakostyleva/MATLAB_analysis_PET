% ***** Macro to make reconstruction of image in a mid plane z = 0 ****** 

function []=MidplaneRecon_curve_mult(datafile_red)
    z=load(datafile_red)
    tic; % Start timnae counter
    events=z.z;
    clear z;
    nevents=length(events)  % number of events


    PlaneOffset = 0;   % position of image plane from scanner center, in mm 
    theta = (7.5/2)*pi/180; % tapered angle
    h = 4;    % mm, size of one crystal
    B = 54.85; % mm, measured size of block in tapered direction
    R = 150; % mm, distance from FOV to place where block 2 and 3 meet
    t = 8; % mm, depth of interaction, randomized later in the code
    dx = (B - 13*h)/2 + 0.375; % mm, calculated metal cover plus correction
    dy = (B - 13*h)/2 + 0.7;  % mm, calculated metal cover plus correction
    H = 2*dx + 13*h; % mm, total calculated width of one block
    mu = 1/12; % 1/mm, parameter for randomization of DOI
    det_length = 20; % mm, lenght of block detector

    imgx=zeros(1,nevents); % array to store x coord of midplane for 2D hist
    imgy=zeros(1,nevents); % array to store y coord of midplane for 2D hist

    midplaneImage = zeros(120,120); %I have to put 120 here (and not half of FOV) because x is calculated using t which makes it larger. So shift must be larger
    doi = zeros(1,nevents); % array to hold randomized DOI, just to double-check

% ****** First calculate the space coord for each crystal from 0 to 51 once. 
    geom = zeros(52,3); % array to hold calculated coord in mm
    for c = 0:51 
        [xcalc, ycalc] = calculate_curve(c);
        geom(c+1,1) = c;
        geom(c+1,2) = xcalc;
        geom(c+1,3) = ycalc;
        if c == 51 
            geom   % printout of geometry array without randomisation!
            geom(c+1,3);
            width = (geom(c+1,2) + 0.5*h*cos(3*theta) + dx*cos(3*theta))*2; % mm, width of one scanner head in x direction
            height =(geom(c+1,3) + 0.5*h*cos(3*0) + dy*cos(3*0))*2; % mm, height of one scanner head in y direction
        end
    end

% ****** Here the loop over events starts
% NOTE: for NON-REDUCED data file change to events(n,3),events(n,4) and events(n,5),events(n,6) 
    for n= 1:nevents
    
    % randomisation of DOI according to exponential function limited by length of detector 
    % rand returns a number between 0 and 1
        t = -log(rand)/mu;
        while t > det_length
            t = -log(rand)/mu;
            if t <= det_length
                break;
            end
        end
 
    % 1st step:
    %    randomisation is added to x and y, and corresp z is calculated with rand DOI  
    % 2nd step:
    %    rand DOI is included into x calculation, so it does not contribute twice
    
    % DEA0 (columns 1 and 2 in events are the x and y crystal ID in DEA0) 
        crystalPos1y = geom(events(n,2)+1,3) + h*(rand - 1/2); % y is calculated the same for all blocks
        if events(n,1) >= 0 && events(n,1) <= 12
            crystalPos1x = geom(events(n,1)+1,2) + (rand-1/2)*h*cos(3*theta); 
            crystalPos1z = R - H*sin(theta) + ( crystalPos1x + H*cos(theta))*tan(3*theta) + t*cos(3*theta);
            crystalPos1x = crystalPos1x - t*sin(3*theta);
        elseif events(n,1) >= 13 && events(n,1) <= 25 
            crystalPos1x = geom(events(n,1)+1,2) + (rand-1/2)*h*cos(theta); 
            crystalPos1z = R + crystalPos1x*tan(theta) + t*cos(theta);
            crystalPos1x = crystalPos1x - t*sin(theta);
        elseif events(n,1) >= 26 && events(n,1) <= 38    
            crystalPos1x = geom(events(n,1)+1,2) + (rand-1/2)*h*cos(theta); 
            crystalPos1z = R - crystalPos1x*tan(theta) + t*cos(theta);
            crystalPos1x = crystalPos1x + t*sin(theta);
        elseif events(n,1) >= 39 && events(n,1) <= 51
            crystalPos1x = geom(events(n,1)+1,2) + (rand-1/2)*h*cos(3*theta);        
            crystalPos1z = R - H*sin(theta) - (crystalPos1x - H*cos(theta))*tan(3*theta) + t*cos(3*theta); 
            crystalPos1x = crystalPos1x + t*sin(3*theta);
        end
    
        if events(n,1) == 51 % just to check what is width when DOI is included in x
            actual_width = ((crystalPos1x + 0.5*h*cos(3*theta) + dx*cos(3*theta))*2);
        end
    
    % randomisation of DOI according to exponential function limited by length of detector 
        t = -log(rand)/mu;
        while t > det_length
            t = -log(rand)/mu;
            if t <= det_length
                break;
            end
        end

    % DEA6 (columns 3 and 4 in events are the x and y crystal ID in DEA6) 
        crystalPos2y = geom(events(n,4)+1,3) + h*(rand - 1/2); % y is calculated the same for all blocks
        if events(n,3) >= 0 && events(n,3) <= 12
            crystalPos2x = geom(events(n,3)+1,2) + (rand-1/2)*h*cos(3*theta);
            crystalPos2z = R - H*sin(theta) + ( crystalPos2x + H*cos(theta))*tan(3*theta) + t*cos(3*theta);
            crystalPos2x = crystalPos2x - t*sin(3*theta);
        elseif events(n,3) >= 13 && events(n,3) <= 25
            crystalPos2x = geom(events(n,3)+1,2) + (rand-1/2)*h*cos(theta); 
            crystalPos2z = R + crystalPos2x*tan(theta) + t*cos(theta);
            crystalPos2x = crystalPos2x - t*sin(theta);
        elseif events(n,3) >= 26 && events(n,3) <= 38
            crystalPos2x = geom(events(n,3)+1,2) + (rand-1/2)*h*cos(theta); 
            crystalPos2z = R - crystalPos2x*tan(theta) + t*cos(theta);
            crystalPos2x = crystalPos2x + t*sin(theta);
        elseif events(n,3) >= 39 && events(n,3) <= 51
            crystalPos2x = geom(events(n,3)+1,2) + (rand-1/2)*h*cos(3*theta);
            crystalPos2z = R - H*sin(theta) - ( crystalPos2x - H*cos(theta))*tan(3*theta) + t*cos(3*theta);
            crystalPos2x = crystalPos2x + t*sin(3*theta);
        end
    
        P1 = [crystalPos1x, crystalPos1y, crystalPos1z]; % LOR endpoint #1
        P2 = [-crystalPos2x, crystalPos2y, -crystalPos2z]; % LOR endpoint #2 
        u = P2-P1;  % directional vector along the LOR

        midplaneCrossingx = (PlaneOffset-P1(3))*u(1)/u(3)+P1(1);    % x coordinate of mid plane crossing
        midplaneCrossingy = (PlaneOffset-P1(3))*u(2)/u(3)+P1(2);   % y coordinate of mid plane crossing

        imgx(n) = midplaneCrossingx; % for 2d histo
        imgy(n) = midplaneCrossingy; % for 2d histo
    
        midplanePixelx=floor((midplaneCrossingx + 120)/2)+1; % add 1 because index 0 is not allowed
        midplanePixely=120-floor((midplaneCrossingy + 120)/2)+1; % here is the same 120 used, explanation see above
        midplaneImage(midplanePixelx,midplanePixely) = midplaneImage(midplanePixelx,midplanePixely)+1;
    
        doi(n) = t; % filling array with randomized DOI
    
    end
% NOTE: what is defined as the scanner x-coordinate is the y-coordinate in
% the image...

figure('Name','Reconstruction, 2d image','NumberTitle','off');
xrange = [-119:2:119];
yrange = [-119:2:119];
image = imagesc(xrange,yrange,midplaneImage);
title(datafile_red,'Interpreter', 'none');  
% dim = [.6 .6 .3 .3]; % dimention of annotation
% text = {'2D image', datafile_red}; % text of annotation
% annotation('textbox',dim,'String',text,'FitBoxToText','on','Interpreter', 'none');
colorbar;
colormap(parula);
xlabel('X (mm)');
ylabel('Y (mm)');
set(gca,'ColorScale','log');
axis square;
axis xy;
ax = gca;
ax.FontSize = 14;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
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
%{
figure('Name','Auxiliary plots','NumberTitle','off');
subplot(2,2,1) % go to subplot
hist(doi, 100);
xlabel('DOI (mm)');
ylabel('Counts');
title('Randomized DOI')
movegui('east'); % moves plot on the screen 

subplot(2,2,2)
xx = 0:1:300;
yy = exp(-xx*mu);
plot(xx,yy)
xlabel('Exponential function exp(-x/12)');
ylabel('Counts');
title('Exponential PDF')

subplot(2,2,3)
horProj = sum(midplaneImage, 1);
xx = [-120:240/119:120];
plot(xx,horProj);
%histogram(horProj)
%plot(horProj)
xlabel('X (mm)');
ylabel('Counts');
set(gca,'ColorScale','log');
title('Projection of image on X')
%}
% saving image as matlab figure
    [filepath,name,ext] = fileparts(datafile_red); %separates path, name and extension of the file
    figname = strcat('Q:\Documents\PET\MATLAB_figures_PET\Na22\',name,'_image.fig'); % create name for figure
    saveas(image, figname)  % saves figure 
    close all;

% stop time counter
    toc;
end

% ***** 2D histogram, uncomment if needed ********
% figure('Name','Reconstruction, 2d histo','NumberTitle','off'); % create figure
% set(gcf,'position',[100,300,1100,550]) % set dimentions to fit the screen
% im_hist = histogram2(-imgy,imgx,[113 111],'DisplayStyle','tile');
% title('2D histogram') 
% colorbar;
% colormap(parula);
% xlabel('X (mm)');
% ylabel('Y (mm)');
% set(gca,'ColorScale','log');
% axis square;
% axis xy;
% ax = gca;
% ax.FontSize = 14;
% ax.XLim = [-105,105];
% ax.YLim = [-105,105];
% xticks([-120:20:120]);
% yticks([-120:20:120]);
% ax.TickDir = 'out';
% ax.TickLength = [0.02 0.02];
% ax.XGrid = 'on';
% ax.YGrid = 'on';
% ax.GridLineStyle = '--';
% ax.GridAlphaMode = 'manual';
% ax.GridAlpha = 0.5;
% ax.GridColorMode = 'manual';
% ax.GridColor = 'white';
% %set(gca,'ColorScale','log');

