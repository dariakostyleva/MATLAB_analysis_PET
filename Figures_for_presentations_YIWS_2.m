%%%%%%%%%%%%%%%%%% Script for putting together some images for presentations
%%%%%%%%%%%%%%%%%%     Carbons higher energy, EXPECTED RANGE PMMA 102.6 mm    %%%%%%%%%%%%%%%%%%%

%fig_C10a = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_001_figs\C10_001_red_image_248c_corr.fig','invisible');
fig_C10a = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_corr.fig','invisible');
arr_C10a = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C10ae = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_corr_err.fig','invisible');
%fig_C10ae = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_001_figs\C10_001_red_image_248c_corr_err.fig','invisible');
arr_C10ae = get(get(gca,'Children'),'CData');

fig_C10m = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_015_figs\C10_015_red_image_corr','invisible');
arr_C10m = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C10me = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_015_figs\C10_015_red_image_corr_err.fig','invisible');
arr_C10me = get(get(gca,'Children'),'CData');

fig_C11a = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_518c_corr.fig','invisible');
arr_C11a = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C11ae = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_518c_corr_err.fig','invisible');
arr_C11ae = get(get(gca,'Children'),'CData');

fig_C12a = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_017_figs\C12_017_red_spilloff_image_212c_corr.fig','invisible');
arr_C12a = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C12ae = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_017_figs\C12_017_red_spilloff_image_212c_corr_err.fig','invisible');
arr_C12ae = get(get(gca,'Children'),'CData');

xx = [-119:2:119];
yy = [-119:2:119];
depth_pmma = [-79.7:2:159.3]; % scale for x axis in mm lowe energy
depth_pmma_C10_14 = [-76.4:2:162.6];
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
axis square;
axis xy;
ax.XLim = [-60,60];
ax.YLim = [-60,60];
xticks([-120:20:120]);
yticks([-120:20:120]);

subplot(2,3,4);
errorbar(depth_pmma,sum(arr_C10a(50:70,:),'omitnan'),sqrt(sum(power(arr_C10ae(50:70,:),2),1,'omitnan')),'DisplayName','Achromatic mode');
ax = gca;
ax.FontSize = 14;
ax.XLim = [10,60];
xlabel('Depth in PMMA (mm)');
ylabel('Number of decays');

subplot(2,3,5);
errorbar(depth_pmma,sum(arr_C11a(50:70,:),'omitnan'),sqrt(sum(power(arr_C11ae(50:70,:),2),1,'omitnan')),'DisplayName','Achromatic mode');
ax = gca;
ax.FontSize = 14;
ax.XLim = [10,60];
xlabel('Depth in PMMA (mm)');
ylabel('Number of decays');

subplot(2,3,6);
errorbar(depth_pmma,sum(arr_C12a(50:70,:),'omitnan'),sqrt(sum(power(arr_C12ae(50:70,:),2),1,'omitnan')),'DisplayName','Achromatic mode');
ax = gca;
ax.FontSize = 14;
ax.XLim = [10,60];
xlabel('Depth in PMMA (mm)');
ylabel('Number of decays');
%%
max11 = sum(sum(arr_C11a(50:70,:),'omitnan'));
max10 = sum(sum(arr_C10a(50:70,:),'omitnan'));
max12 = sum(sum(arr_C12a(50:70,:),'omitnan'));

bp_C12 = load('12C_138MeV_H2O_23_plot.dat');
depth_PMMA_bp_C12 = bp_C12(:,1)./1.165 + 0.8;
dose_C12 = bp_C12(:,2)

figure;
plot(depth_PMMA_bp_C12,dose_C12);

figure;
hold on
% errorbar(depth_pmma,sum(arr_C10a(50:70,:),'omitnan'),sqrt(sum(power(arr_C10ae(50:70,:),2),1,'omitnan')),'DisplayName','C10');
% errorbar(depth_pmma,sum(arr_C11a(50:70,:),'omitnan'),sqrt(sum(power(arr_C11ae(50:70,:),2),1,'omitnan')),'DisplayName','C11');
% errorbar(depth_pmma,sum(arr_C12a(50:70,:),'omitnan'),sqrt(sum(power(arr_C12ae(50:70,:),2),1,'omitnan')),'DisplayName','C12');
%plot(depth_pmma_C10_14,rescale(sum(arr_C10a(40:80,:),'omitnan')),'DisplayName','C10 achro corr');
%plot(depth_pmma,rescale(sum(arr_C10a(40:80,:),'omitnan')),'--','DisplayName','C10 achro old');
plot(depth_pmma,rescale(sum(arr_C10m(40:80,:),'omitnan')),'DisplayName','C10 mono');
plot(depth_pmma,rescale(sum(arr_C11a(40:80,:),'omitnan')),'DisplayName','C11 mono');
plot(depth_pmma,rescale(sum(arr_C12a(40:80,:),'omitnan')),'DisplayName','C12 achro');
plot(depth_PMMA_bp_C12,rescale(dose_C12),'DisplayName','C12 dose');
%plot(wc_C12_depth,rescale(wc_C12_dose),'DisplayName','C12 WC');
ax = gca;
ax.FontSize = 14;
ax.XLim = [10,60];
ax.YLim = [0,1.1];
xlabel('Depth in PMMA (mm)');
ylabel('Number of decays (a.u.)');
legend
%clear all;



