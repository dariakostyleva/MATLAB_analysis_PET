% *** This script creates the flood maps (2D) 
% *** and 2D PET histograms (1D for columns and 1D for rows)
% *** Author: Daria K 

% start time counter
tic;
%open file with reduced data
datafile_red =  uigetfile('*_red.mat')
[filepath,name,ext] = fileparts(datafile_red); %separates path, name and extension of the file
z=load(datafile_red)
zz=z.z; % don't know yet why this line is needed
clear z;

% assign each array a column with corresponding data
%                                                                                                                                                                                                 
%cax = zz(:,1);
%cay = zz(:,2);
%cbx = zz(:,3);
%                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
%cby = zz(:,4);

clf('reset') % clear current figure window
figname = strcat('Flood maps - data file:',name)
figure('Name',figname,'NumberTitle','off'); % create figure
set(gcf,'position',[100,300,1100,550]) % set dimentions to fit the screen
subplot(1,2,1) % go to subplot
dim = [.2 .6 .3 .3]; % dimention of annotation
text = {'flood map DEA0', datafile_red}; % text of annotation
annotation('textbox',dim,'String',text,'FitBoxToText','on','Interpreter', 'none');
ha = histogram2(zz(:,1),zz(:,2),[52 52],'FaceColor','flat'); % create and draw histo
xlabel('Crystal ID X') % label x axis
ylabel('Crystal ID Y') % label y axis
axis square
colorbar % add color 
view(2) % view from the top

subplot(1,2,2) % go to subplot
dim = [.6 .6 .3 .3]; % dimention of annotation
text = {'flood map DEA6', datafile_red}; % text of annotation
annotation('textbox',dim,'String',text,'FitBoxToText','on','Interpreter', 'none');
hb = histogram2(zz(:,3),zz(:,4),[52 52],'FaceColor','flat');
xlabel('Crystal ID X')
ylabel('Crystal ID Y')
axis square
colorbar
view(2)

[filepath,name,ext] = fileparts(datafile_red); %separates path, name and extension of the file
figname = strcat('Q:\Documents\PET\MATLAB_figures_PET\',name,'_flood_map.fig'); % create name for figure
saveas(gcf, figname)  % save figure with the proper name to folder
%figname = strcat('Q:\Documents\PET\MATLAB_figures_PET\',name,'_flood_map.png'); % create name for figure
%saveas(gcf, figname)  % save figure with the proper name to folder


% 2D PET histos
% column vs column

xaxis = zeros(52,1); % this is needed to plot data from 0 to 51 on x axis
for j = 1:52
    xaxis(j) = j-1;
end

countx = zeros(52,1);  % empty array to store 2D pet data in x (columns)
county = zeros(52,1);  % empty array to store 2D pet data in y (rows)
for i = 1 : length(zz) % loop over all events
    if zz(i,1) + zz(i,3) == 51 % condition if opposite crystals in column had event
        %!!! I have to add one to array index below, because in MatLab array starts from 1 !!! 
        countx(zz(i,1)+1) = countx(zz(i,1)+1) + 1; % adds one to bin zz(i,1) (cax)
    end
    if zz(i,2) == zz(i,4) % condition if opposite crystals in row had event
        %!!! I have to add one to array below, because in MatLab array starts from 1 !!!
        county(zz(i,2)+1) = county(zz(i,2)+1) + 1;
       % county = [county zz(i,2)];
    end
end

figname = strcat('2D PET - 1D profile - data file:', name);
figure('Name',figname,'NumberTitle','off');
set(gcf,'position',[100,300,1100,550]) % set dimentions to fit the screen

subplot(1,2,1) % go to subplot
dim = [.3 .6 .3 .3]; % dimention of annotation
annotation('textbox',dim,'String','Columns','FitBoxToText','on');
%histogram(countx, 'BinWidth', 1, 'BinLimits',[0,52])
bar(xaxis,countx,1)
xlabel('Crystal ID X in head A')
ylabel('Intensity')

subplot(1,2,2) % go to subplot
dim = [.7 .6 .3 .3]; % dimention of annotation
annotation('textbox',dim,'String','Rows','FitBoxToText','on');
%histogram(county, 'BinWidth', 1, 'BinLimits',[0,51])
bar(xaxis,county,1)
xlabel('Crystal ID Y in both heads')
ylabel('Intensity')

figname = strcat('Q:\Documents\PET\MATLAB_figures_PET\',name,'_2d_pet.fig');
saveas(gcf, figname)
%figname = strcat('Q:\Documents\PET\MATLAB_figures_PET\',name,'_2d_pet.png');
%saveas(gcf, figname)

% stop time counter
toc;

%{
figure('Name','2D PET','NumberTitle','off');
set(gcf,'position',[100,300,1100,550]) % set dimentions to fit the screen

subplot(1,2,1) % go to subplot
dim = [.3 .6 .3 .3]; % dimention of annotation
annotation('textbox',dim,'String','Columns','FitBoxToText','on');
N = length(cax); % number of coincidence events, basically length of array
countx = [];  % empty array to store 2D pet data in x
for posx = 0:51 % outer loop over x (over columns)
    for i = 1 : N % inner loop over events in each column
        if cax(i) == posx & cbx(i) == 51 - posx % condition if opposite crystals in column had event
           countx = [countx posx]; % if yes, adds next element posx to array countx
        end
    end
end
histogram(countx, 'BinWidth', 1, 'BinLimits',[0,52])
xlabel('Crystal ID X in head A')
ylabel('Intensity')

% row vs row
subplot(1,2,2) % go to subplot
dim = [.7 .6 .3 .3]; % dimention of annotation
annotation('textbox',dim,'String','Rows','FitBoxToText','on');
N = length(cay); % number of coincidence events
county = []; % array to store 2D pet data in y
for posy = 0:51
    for i = 1 : N
        if cay(i) == posy & cby(i) == posy
           county = [county posy];
        end
    end
end
histogram(county, 'BinWidth', 1, 'BinLimits',[0,52])
xlabel('Crystal ID Y in both heads')
ylabel('Intensity')
%}
