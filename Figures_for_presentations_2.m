%%%%%%%%%%%%%%%%%% Script for putting together some images for presentations
%%%%%%%%%%%%%%%%%%     Oxygens, EXPECTED RANGE 39.9 mm    %%%%%%%%%%%%%%%%%%%

fig_O15 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O15_008_red_image.fig','invisible');
arr_O15 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
time_O15 = 1200.046; %length of the file in seconds, daq time from BasicDataFileProperties

fig_O14 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_016_red_image.fig','invisible');
arr_O14 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
time_O14 = 2343.966; %length of the file in seconds, daq time from BasicDataFileProperties

fig_O16 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O16_015_red_image.fig','invisible');
arr_O16 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
time_O16 = 1800.01; %length of the file in seconds, daq time from BasicDataFileProperties

% arr_O15 = rescale(arr_O15);
% arr_O14 = rescale(arr_O14);
% arr_O16 = rescale(arr_O16);
xx = [-119:2:119];
yy = [-119:2:119];

% load matrix for sensitivity correction 
map = importdata('sensitivity_corr_matrix.txt');

% scaling to have counts per second
h = figure; set(h, 'Visible', 'off');
plot_O14 = plot([-84:2:155],arr_O14(61,:)./map(61,:));
y_O14_orig = get(plot_O14, 'YData');
y_O14 = y_O14_orig/time_O14;

plot_O15 = plot([-84:2:155],arr_O15(61,:)./map(61,:));
y_O15_orig = get(plot_O15, 'YData');
y_O15 = y_O15_orig/time_O15;

plot_O16 = plot([-84:2:155],arr_O16(61,:)./map(61,:));
y_O16_orig = get(plot_O16, 'YData');
y_O16 = y_O16_orig/time_O16;
%%%%

figure;
hold on;
plot([-84:2:155],rescale(y_O14),'DisplayName','14O');
plot([-84:2:155],rescale(y_O15),'DisplayName','15O');
plot([-84:2:155],rescale(y_O16),'DisplayName','16O');
hold off;
title('2 mm slice along beam from left to right, ~ 40 mm range of Oxygens in PMMA, achromatic mode of FRS')
xlabel('Depth in PMMA (mm)');
ylabel('Relative counts (a.u.)');
%ylabel('Intensity (counts/2 mm/sec)');
full_horProj = findobj(gca,'Type','line');
xticks([-20:10:220]);
xlim([-10 90]);
%ylim([0 1.2]);
legend;
ax = gca;
ax.FontSize = 13;


% figure('Name','Oxygen isotopes with ~40 range in PMMA','NumberTitle','off');
% subplot(1,3,1);
% imagesc(xx,yy,arr_O15);
% title('15O');
% axis square;
% axis xy;
% ax.XLim = [-120,120];
% ax.YLim = [-120,120];
% xticks([-120:20:120]);
% yticks([-120:20:120]);
% xlabel('X (mm)');
% ylabel('Y (mm)');
% colorbar;
% set(gca,'ColorScale','log');
% 
% subplot(1,3,2);
% imagesc(xx,yy,arr_O14);
% title('14O');
% axis square;
% axis xy;
% ax.XLim = [-120,120];
% ax.YLim = [-120,120];
% xticks([-120:20:120]);
% yticks([-120:20:120]);
% xlabel('X (mm)');
% ylabel('Y (mm)');
% colorbar;
% set(gca,'ColorScale','log');
% 
% subplot(1,3,3);
% imagesc(xx,yy,arr_O16);
% title('16O');
% axis square;
% axis xy;
% ax.XLim = [-120,120];
% ax.YLim = [-120,120];
% xticks([-120:20:120]);
% yticks([-120:20:120]);
% xlabel('X (mm)');
% ylabel('Y (mm)');
% colorbar;
% set(gca,'ColorScale','log');
% 
% 
% file_map = load('map_merged.mat');
% map = file_map.comb_map_2d_interp;

% figure;
% hold on;
% plot([-84:2:155],rescale(sum(arr_O14, 1)),'DisplayName','14O');
% plot([-84:2:155],rescale(sum(arr_O14./map, 1)),'DisplayName','14O, preliminary sensitivity correction');
% hold off;
% title('Projection along beam from left to right, ~ 40 mm range of Oxygens in PMMA, achromatic mode of FRS')
% xlabel('Depth in PMMA (mm)');
% ylabel('Relative counts');
% full_horProj = findobj(gca,'Type','line');
% xticks([-20:10:220]);
% xlim([0 140]);
% ylim([0 1.2]);
% legend;
% 
% figure;
% hold on;
% plot([-84:2:155],rescale(sum(arr_O14./map, 1)),'DisplayName','14O');
% plot([-84:2:155],rescale(sum(arr_O15./map, 1)),'DisplayName','15O');
% plot([-84:2:155],rescale(sum(arr_O16./map, 1)),'DisplayName','16O');
% hold off;
% title('Projection along beam from left to right, ~ 40 mm range of Oxygens in PMMA, achromatic mode of FRS')
% xlabel('Depth in PMMA (mm)');
% ylabel('Relative counts');
% full_horProj = findobj(gca,'Type','line');
% xticks([-20:10:220]);
% xlim([-10 140]);
% ylim([0 1.2]);
% legend;

