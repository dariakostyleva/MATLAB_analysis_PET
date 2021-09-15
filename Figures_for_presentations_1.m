%%%%%%%%%%%%%%%%%% Script for putting together some images for presentations
%%%%%%%%%%%%%%%%%%     Oxygens, EXPECTED RANGE 102 mm    %%%%%%%%%%%%%%%%%%%

fig_O15 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O15_001_red_image.fig','invisible');
arr_O15 = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_O14 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_red_image.fig','invisible');
arr_O14 = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_O16 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O16_005_red_image.fig','invisible');
arr_O16 = get(get(gca,'Children'),'CData'); % getting data from figure as an array

arr_O15 = rescale(arr_O15);
arr_O14 = rescale(arr_O14);
arr_O16 = rescale(arr_O16);
xx = [-119:2:119];
yy = [-119:2:119];

figure('Name','Oxygen isotopes with ~102 range in PMMA','NumberTitle','off');
subplot(1,3,1);
imagesc(xx,yy,arr_O15);
title('15O');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
colorbar;
set(gca,'ColorScale','log');

subplot(1,3,2);
imagesc(xx,yy,arr_O14);
title('14O');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
colorbar;
set(gca,'ColorScale','log');

subplot(1,3,3);
imagesc(xx,yy,arr_O16);
title('16O');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
colorbar;
set(gca,'ColorScale','log');


file_map = load('map_merged.mat');
map = file_map.comb_map_2d_interp;

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

figure;
hold on;
plot([-49:2:190],rescale(arr_O14(60,:)./map(60,:)),'DisplayName','14O');
plot([-49:2:190],rescale(arr_O15(60,:)./map(60,:)),'DisplayName','15O');
plot([-49:2:190],rescale(arr_O16(60,:)./map(60,:)),'DisplayName','16O');
hold off;
title('2 mm slice along beam from left to right, ~ 102 mm range of Oxygens in PMMA, achromatic mode of FRS')
xlabel('Depth in PMMA (mm)');
ylabel('Relative counts');
full_horProj = findobj(gca,'Type','line');
xticks([-20:10:220]);
xlim([-10 140]);
ylim([0 1.2]);
legend;
