%%%%%%%%%%%%%%%%%% Script for putting together some images for presentations
%%%%%%%%%%%%%%%%%%     Oxygens, EXPECTED RANGE 102 mm    %%%%%%%%%%%%%%%%%%%

fig_O15 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O15_001_red_image.fig','invisible');
arr_O15 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
time_O15 = 900.522; %length of the file in seconds, daq time from BasicDataFileProperties

fig_O14 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_red_image.fig','invisible');
arr_O14 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
time_O14 = 2399.902; %length of the file in seconds, daq time from BasicDataFileProperties

fig_O16 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O16_005_red_image.fig','invisible');
arr_O16 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
time_O16 = 3000.559; %length of the file in seconds, daq time from BasicDataFileProperties

factor = 10^6; % from 10^6 MBq to MBq

% arr_O15 = rescale(arr_O15);
% arr_O14 = rescale(arr_O14);
% arr_O16 = rescale(arr_O16);
xx = [-119:2:119];
yy = [-119:2:119];

% load matrix for sensitivity correction 
map = importdata('Sensitivity_corr_matrix.txt');
% file_map = load('map_merged.mat');
% map = file_map.comb_map_2d_interp;

figure('Name','Oxygen isotopes with ~102 range in PMMA','NumberTitle','off');
subplot(1,3,1);
imagesc(xx,yy,arr_O15./map*factor);
title('15O');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)','FontSize',14);
ylabel('Y (mm)','FontSize',14);
xlim([-110 110]);
ylim([-110 110]);
a = colorbar;
ylabel(a,'Activity (MBq) per 2 mm bin','FontSize',14,'Rotation',270);
%ylabel(a,'Intensity (counts/2 mm)','FontSize',10.45,'Rotation',270);
set(gca,'ColorScale','log');
ax = gca;
ax.FontSize = 14;

subplot(1,3,2);
imagesc(xx,yy,arr_O14./map*factor);
title('14O');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
xlim([-110 110]);
ylim([-110 110]);
a = colorbar;
ylabel(a,'Activity (MBq) per 2 mm bin','FontSize',14,'Rotation',270);
%ylabel(a,'Intensity (counts/2 mm)','FontSize',10.45,'Rotation',270);
set(gca,'ColorScale','log');
ax = gca;
ax.FontSize = 14;

subplot(1,3,3);
imagesc(xx,yy,arr_O16./map*factor);
title('16O');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
xlim([-110 110]);
ylim([-110 110]);
a = colorbar;
ylabel(a,'Activity (MBq) per 2 mm bin','FontSize',14,'Rotation',270);
%ylabel(a,'Intensity (counts/2 mm)','FontSize',10.45,'Rotation',270);
set(gca,'ColorScale','log');
ax = gca;
ax.FontSize = 14;

% scaling to have counts per second
h = figure; set(h, 'Visible', 'off');
plot_O14 = plot([-49:2:190],arr_O14(61,:)./map(61,:)*factor);
y_O14_orig = get(plot_O14, 'YData');
y_O14 = y_O14_orig/time_O14;

plot_O15 = plot([-49:2:190],arr_O15(61,:)./map(61,:)*factor);
y_O15_orig = get(plot_O15, 'YData');
y_O15 = y_O15_orig/time_O15;

plot_O16 = plot([-49:2:190],arr_O16(61,:)./map(61,:)*factor);
y_O16_orig = get(plot_O16, 'YData');
y_O16 = y_O16_orig/time_O16;
%%%%

figure;
hold on;
plot([-49:2:190],y_O14,'DisplayName','14O');
plot([-49:2:190],y_O15,'DisplayName','15O');
plot([-49:2:190],y_O16,'DisplayName','16O');
hold off;
title('2 mm slice along beam from left to right, ~ 102 mm range of Oxygens in PMMA, achromatic mode of FRS')
xlabel('Depth in PMMA (mm)');
%ylabel('Intensity (counts/2 mm/sec)');
ylabel('Activity (MBq) per 2 mm bin');
full_horProj = findobj(gca,'Type','line');
xticks([-20:10:220]);
xlim([-10 140]);
%ylim([0 1.2]);
legend;
ax = gca;
ax.FontSize = 13;

return;
figure;
hold on;
plot([-49:2:190],rescale(sum(arr_O14, 1)),'DisplayName','14O');
plot([-49:2:190],rescale(sum(arr_O14./map, 1)),'DisplayName','14O, preliminary sensitivity correction');
hold off;
title('Projection along beam from left to right, ~ 102 mm range of Oxygens in PMMA, achromatic mode of FRS')
xlabel('Depth in PMMA (mm)');
ylabel('Relative counts');
full_horProj = findobj(gca,'Type','line');
xticks([-20:10:220]);
xlim([0 140]);
ylim([0 1.2]);
legend;

figure;
hold on;
plot([-49:2:190],rescale(sum(arr_O14./map, 1)),'DisplayName','14O');
plot([-49:2:190],rescale(sum(arr_O15./map, 1)),'DisplayName','15O');
plot([-49:2:190],rescale(sum(arr_O16./map, 1)),'DisplayName','16O');
hold off;
title('Projection along beam from left to right, ~ 102 mm range of Oxygens in PMMA, achromatic mode of FRS')
xlabel('Depth in PMMA (mm)');
ylabel('Relative counts');
full_horProj = findobj(gca,'Type','line');
xticks([-20:10:220]);
xlim([-10 140]);
ylim([0 1.2]);
legend;
