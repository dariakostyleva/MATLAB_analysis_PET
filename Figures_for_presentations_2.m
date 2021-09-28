%%%%%%%%%%%%%%%%%% Script for putting together some images for presentations
%%%%%%%%%%%%%%%%%%     Oxygens, EXPECTED RANGE 39.9 mm    %%%%%%%%%%%%%%%%%%%

fig_O15 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O15_008_red_image.fig');
arr_O15 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
time_O15 = 1200.046; %length of the file in seconds, daq time from BasicDataFileProperties

fig_O14 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_016_red_image.fig');
arr_O14 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
time_O14 = 2343.966; %length of the file in seconds, daq time from BasicDataFileProperties

fig_O16 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O16_015_red_image.fig');
arr_O16 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
time_O16 = 1800.01; %length of the file in seconds, daq time from BasicDataFileProperties

arr_O16 = arr_O16/time_O16; % cps
arr_O15 = arr_O15/time_O15; % cps
arr_O14 = arr_O14/time_O14; % cps
xx = [-119:2:119];
yy = [-119:2:119];
factor = 10^12; % from 10^6 MBq to Bq

% scaling to have counts per second
xx = [-119:2:119];
yy = [-119:2:119];
set(0, 'DefaultLineLineWidth', 1.5);

% load matrix for sensitivity correction 
map_attn = importdata('Sensitivity_corr_atten_pin1_matrix.txt');
map_sens = importdata('Sensitivity_corr_matrix.txt');
% file_map = load('map_merged.mat');
% map = file_map.comb_map_2d_interp;

figure('Name','Oxygen isotopes with ~39 range in PMMA','NumberTitle','off');
subplot(3,3,1);
imagesc(xx,yy,arr_O15);
title('15O original');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)','FontSize',14);
ylabel('Y (mm)','FontSize',14);
a = colorbar;
zlabel = ylabel(a,'cps per 2 mm bin','FontSize',14);
set(gca,'ColorScale','log');
ax = gca;
ax.FontSize = 14;

subplot(3,3,2);
imagesc(xx,yy,arr_O14);
title('14O original');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
a = colorbar;
zlabel = ylabel(a,'cps per 2 mm bin','FontSize',14);
set(gca,'ColorScale','log');
ax = gca;
ax.FontSize = 14;

subplot(3,3,3);
imagesc(xx,yy,arr_O16);
title('16O original');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
a = colorbar;
zlabel = ylabel(a,'cps per 2 mm bin','FontSize',14);
set(gca,'ColorScale','log');
ax = gca;
ax.FontSize = 14;

subplot(3,3,4);
imagesc(xx,yy,arr_O15./map_sens*factor);
title('15O sens corrected');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)','FontSize',14);
ylabel('Y (mm)','FontSize',14);
a = colorbar;
zlabel = ylabel(a,'Activity (Bq) per 2 mm bin','FontSize',14);
set(gca,'ColorScale','log');
ax = gca;
ax.FontSize = 14;

subplot(3,3,5);
imagesc(xx,yy,arr_O14./map_sens*factor);
title('14O sens corrected');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
a = colorbar;
zlabel = ylabel(a,'Activity (Bq) per 2 mm bin','FontSize',14);
set(gca,'ColorScale','log');
ax = gca;
ax.FontSize = 14;

subplot(3,3,6);
imagesc(xx,yy,arr_O16./map_sens*factor);
title('16O sens corrected');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
a = colorbar;
zlabel = ylabel(a,'Activity (Bq) per 2 mm bin','FontSize',14);
set(gca,'ColorScale','log');
ax = gca;
ax.FontSize = 14;

subplot(3,3,7);
imagesc(xx,yy,arr_O15./map_attn*factor);
title('15O sens + atten corrected');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)','FontSize',14);
ylabel('Y (mm)','FontSize',14);
a = colorbar;
zlabel = ylabel(a,'Activity (Bq) per 2 mm bin','FontSize',14);
set(gca,'ColorScale','log');
ax = gca;
ax.FontSize = 14;

subplot(3,3,8);
imagesc(xx,yy,arr_O14./map_attn*factor);
title('14O sens + atten corrected');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
a = colorbar;
zlabel = ylabel(a,'Activity (Bq) per 2 mm bin','FontSize',14);
set(gca,'ColorScale','log');
ax = gca;
ax.FontSize = 14;

subplot(3,3,9);
imagesc(xx,yy,arr_O16./map_attn*factor);
title('16O sens + atten corrected');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
a = colorbar;
zlabel = ylabel(a,'Activity (Bq) per 2 mm bin','FontSize',14);
set(gca,'ColorScale','log');
ax = gca;
ax.FontSize = 14;

% scaled to have counts per second
figure;
hold on;
plot([-84:2:155],arr_O14(61,:)./map_attn(61,:)*factor,'-k','DisplayName','14O sens + atten corr, file 16');
plot([-84:2:155],arr_O15(61,:)./map_attn(61,:)*factor,'-m','DisplayName','15O sens + atten corr, file 8');
plot([-84:2:155],arr_O16(61,:)./map_attn(61,:)*factor,'-b','DisplayName','16O sens + atten corr, file 15');
plot([-84:2:155],arr_O14(61,:)./map_sens(61,:)*factor,'--k','DisplayName','14O sens corr, file 16');
plot([-84:2:155],arr_O15(61,:)./map_sens(61,:)*factor,'--m','DisplayName','15O sens corr, file 8');
plot([-84:2:155],arr_O16(61,:)./map_sens(61,:)*factor,'--b','DisplayName','16O sens corr, file 15');
hold off;
title('2 mm slice along beam from left to right, ~ 39 mm range of Oxygens in PMMA, achromatic mode of FRS')
xlabel('Depth in PMMA (mm)');
%ylabel('Intensity (counts/2 mm/sec)');
ylabel('Activity (Bq) per 2 mm bin');
full_horProj = findobj(gca,'Type','line');
xticks([-20:10:220]);
xlim([-10 140]);
%ylim([0 1.2]);
legend;
ax = gca;
ax.FontSize = 13;

figure;
hold on;
plot([-84:2:155],rescale(arr_O14(61,:)./map_attn(61,:)*factor/time_O14),'-k','DisplayName','14O sens + atten corr, file 16');
plot([-84:2:155],rescale(arr_O15(61,:)./map_attn(61,:)*factor/time_O15),'-m','DisplayName','15O sens + atten corr, file 8');
plot([-84:2:155],rescale(arr_O16(61,:)./map_attn(61,:)*factor/time_O16),'-b','DisplayName','16O sens + atten corr, file 15');
plot([-84:2:155],rescale(arr_O14(61,:)./map_sens(61,:)*factor/time_O14),'--k','DisplayName','14O sens corr, file 16');
plot([-84:2:155],rescale(arr_O15(61,:)./map_sens(61,:)*factor/time_O15),'--m','DisplayName','15O sens corr, file 8');
plot([-84:2:155],rescale(arr_O16(61,:)./map_sens(61,:)*factor/time_O16),'--b','DisplayName','16O sens corr, file 15');
plot([-84:2:155],rescale(arr_O14(61,:)),'-.k','DisplayName','14O orig, file 16');
plot([-84:2:155],rescale(arr_O15(61,:)),'-.m','DisplayName','15O orig, file 8');
plot([-84:2:155],rescale(arr_O16(61,:)),'-.b','DisplayName','16O orig, file 15');
hold off;
title('2 mm slice along beam from left to right, ~ 39 mm range of Oxygens in PMMA, achromatic mode of FRS')
xlabel('Depth in PMMA (mm)');
%ylabel('Intensity (counts/2 mm/sec)');
ylabel('Intensity (a.u.)');
full_horProj = findobj(gca,'Type','line');
xticks([-20:10:220]);
xlim([-10 140]);
%ylim([0 1.2]);
legend;
ax = gca;
ax.FontSize = 13;
