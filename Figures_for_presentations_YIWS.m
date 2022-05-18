%%%%%%%%%%%%%%%%%% Script for putting together some images for presentations
%%%%%%%%%%%%%%%%%%     Carbons higher energy, EXPECTED RANGE PMMA 102.6 mm    %%%%%%%%%%%%%%%%%%%

fig_C10a = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_001_figs\C10_001_red_image_248c_corr.fig','invisible');
arr_C10a = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C10ae = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_001_figs\C10_001_red_image_248c_corr_err.fig','invisible');
arr_C10ae = get(get(gca,'Children'),'CData');

fig_C10m = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_003_figs\C10_003_red_image_248c_corr','invisible');
arr_C10m = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C10me = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_003_figs\C10_003_red_image_248c_corr_err.fig','invisible');
arr_C10me = get(get(gca,'Children'),'CData');

fig_C11a = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\C11_007_red_spilloff_image_503c_corr.fig','invisible');
arr_C11a = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C11ae = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\C11_007_red_spilloff_image_503c_corr_err.fig','invisible');
arr_C11ae = get(get(gca,'Children'),'CData');

fig_C12a = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_923c_corr.fig','invisible');
arr_C12a = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C12ae = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_923c_corr_err.fig','invisible');
arr_C12ae = get(get(gca,'Children'),'CData');

xx = [-119:2:119];
yy = [-119:2:119];
depth_pmma = [-16.4:2:222.6]; % scale for x axis in mm
set(0, 'DefaultLineLineWidth', 1.5);

figure;
subplot(2,3,1);
imagesc(xx,yy,arr_C10a);
axis square;
axis xy;
ax.XLim = [-60,60];
ax.YLim = [-60,60];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
a = colorbar;
zlabel = ylabel(a,'Number of decays per pixel','FontSize',14);
set(gca,'ColorScale','linear');
ax = gca;
ax.FontSize = 14;

subplot(2,3,2);
imagesc(xx,yy,arr_C11a);
axis square;
axis xy;
ax.XLim = [-60,60];
ax.YLim = [-60,60];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
a = colorbar;
zlabel = ylabel(a,'Number of decays per pixel','FontSize',14);
set(gca,'ColorScale','linear');
ax = gca;
ax.FontSize = 14;

subplot(2,3,3);
imagesc(xx,yy,arr_C12a);
xlabel('X (mm)');
ylabel('Y (mm)');
a = colorbar;
zlabel = ylabel(a,'Number of decays per pixel','FontSize',14);
set(gca,'ColorScale','linear');
ax = gca;
ax.FontSize = 14;

subplot(2,3,4);
errorbar(depth_pmma,sum(arr_C10a(50:70,:),'omitnan'),sqrt(sum(power(arr_C10ae(50:70,:),2),1,'omitnan')),'DisplayName','Achromatic mode');
ax = gca;
ax.FontSize = 14;
ax.XLim = [80,130];
xlabel('Depth in PMMA (mm)');
ylabel('Number of decays');

subplot(2,3,5);
errorbar(depth_pmma,sum(arr_C11a(50:70,:),'omitnan'),sqrt(sum(power(arr_C11ae(50:70,:),2),1,'omitnan')),'DisplayName','Achromatic mode');
ax = gca;
ax.FontSize = 14;
ax.XLim = [80,130];
xlabel('Depth in PMMA (mm)');
ylabel('Number of decays');

subplot(2,3,6);
errorbar([-49:2:190],sum(arr_C12a(50:70,:),'omitnan'),sqrt(sum(power(arr_C12ae(50:70,:),2),1,'omitnan')),'DisplayName','Achromatic mode');
ax = gca;
ax.FontSize = 14;
ax.XLim = [60,120];
xlabel('Depth in PMMA (mm)');
ylabel('Number of decays');


figure;
subplot(2,2,1);
imagesc(xx,yy,arr_C10a);
%title('14O original');
xlabel('X (mm)');
ylabel('Y (mm)');
a = colorbar;
zlabel = ylabel(a,'Number of decays per pixel','FontSize',14);
set(gca,'ColorScale','linear');
ax = gca;
ax.FontSize = 14;
axis square;
axis xy;
ax.XLim = [-60,60];
ax.YLim = [-60,60];
xticks([-120:20:120]);
yticks([-120:20:120]);

subplot(2,2,3);
imagesc(xx,yy,arr_C10m);
%title('14O original');
axis square;
axis xy;
ax.XLim = [-60,60];
ax.YLim = [-60,60];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
a = colorbar;
zlabel = ylabel(a,'Number of decays per pixel','FontSize',14);
set(gca,'ColorScale','linear');
ax = gca;
ax.FontSize = 14;
ax.XLim = [-60,60];
ax.YLim = [-60,60];

subplot(2,2,2);
hold on
errorbar(depth_pmma,sum(arr_C10a(50:70,:),'omitnan'),sqrt(sum(power(arr_C10ae(50:70,:),2),1,'omitnan')),'DisplayName','Achromatic mode');
errorbar(depth_pmma,sum(arr_C10m(1:120,:),'omitnan'),sqrt(sum(power(arr_C10me(1:120,:),2),1,'omitnan')),'DisplayName','Mono-energetic mode');
%plot(depth_pmma,rescale(sum(arr_C10a(50:70,:),'omitnan')),'DisplayName','C10 achro');
%plot(depth_pmma,rescale(sum(arr_C10m(50:70,:),'omitnan')),'DisplayName','C10 mono');
hold off;
legend;
ax = gca;
ax.FontSize = 14;
ax.XLim = [80,130];
xlabel('Depth in PMMA (mm)');
ylabel('Number of decays');
%%
figure;
hold on
% errorbar(depth_pmma,sum(arr_C10a(50:70,:),'omitnan'),sqrt(sum(power(arr_C10ae(50:70,:),2),1,'omitnan')),'DisplayName','C10');
% errorbar(depth_pmma,sum(arr_C11a(50:70,:),'omitnan'),sqrt(sum(power(arr_C11ae(50:70,:),2),1,'omitnan')),'DisplayName','C11');
% errorbar(depth_pmma,sum(arr_C12a(50:70,:),'omitnan'),sqrt(sum(power(arr_C12ae(50:70,:),2),1,'omitnan')),'DisplayName','C12');
plot(depth_pmma,rescale(smooth(sum(arr_C10a(50:70,:),'omitnan'),6)),'DisplayName','C10');
plot(depth_pmma,rescale(smooth(sum(arr_C11a(50:70,:),'omitnan'),6)),'DisplayName','C11');
plot([-49:2:190],rescale(smooth(sum(arr_C12a(50:70,:),'omitnan'),6)),'DisplayName','C12');
ax = gca;
ax.FontSize = 14;
ax.XLim = [60,120];
xlabel('Depth in PMMA (mm)');
ylabel('Number of decays (a.u.)');
legend
clear all;

