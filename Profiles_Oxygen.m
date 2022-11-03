%%%%%%%%%%%%%%%%%% Script for putting profiles for presenation

%%%%%%%%%%%%%%%%%%     Oxygens lower energy, EXPECTED RANGE PMMA 39.9 mm    %%%%%%%%%%%%%%%%%%%
fig_O14l = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_016_red_spilloff_image_corr_test.fig','invisible');
arr_O14l = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_O15l = openfig('Q:\Documents\PET\MATLAB_figures_PET\O15_008_red_spilloff_image_corr_test.fig','invisible');
arr_O15l = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_O16l = openfig('Q:\Documents\PET\MATLAB_figures_PET\O16_015_red_spilloff_image_corr_test.fig','invisible');
arr_O16l = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_O14l_corr = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_016_red_spilloff_image_corr.fig','invisible');
arr_O14l_corr = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_O15l_corr = openfig('Q:\Documents\PET\MATLAB_figures_PET\O15_008_red_spilloff_image_corr.fig','invisible');
arr_O15l_corr = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_O16l_corr = openfig('Q:\Documents\PET\MATLAB_figures_PET\O16_015_red_spilloff_image_corr.fig','invisible');
arr_O16l_corr = get(get(gca,'Children'),'CData');


%%%%%%%%%%%%%%%%%%     Oxygens higher energy, EXPECTED RANGE PMMA 102.6 mm    %%%%%%%%%%%%%%%%%%%
fig_O14 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_red_spilloff_image.fig','invisible');
arr_O14 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_O15 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O15_001_red_spilloff_image.fig','invisible');
arr_O15 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_O16 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O16_005_red_spilloff_image.fig','invisible');
arr_O16 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_O14_corr = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_red_spilloff_image_corr.fig','invisible');
arr_O14_corr = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_O15_corr = openfig('Q:\Documents\PET\MATLAB_figures_PET\O15_001_red_spilloff_image_corr.fig','invisible');
arr_O15_corr = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_O16_corr = openfig('Q:\Documents\PET\MATLAB_figures_PET\O16_005_red_spilloff_image_corr.fig','invisible');
arr_O16_corr = get(get(gca,'Children'),'CData');


xx = [-119:2:119];
yy = [-119:2:119];

depth_pmma_le = [-84:2:155]; % scale for x axis in mm lower energy, pin 1 
depth_pmma_he = [-49:2:190]; % scale for x axis in mm higher energy, pin 2

set(0, 'DefaultLineLineWidth', 1.5);


figure;
subplot(2,1,1);
hold on
% plot(depth_pmma_he,sum(arr_O14(40:80,:))./max(sum(arr_O14(40:80,:))),'-o','DisplayName','O14 uncorr');
% plot(depth_pmma_he,sum(arr_O15(40:80,:))./max(sum(arr_O15(40:80,:))),'-o','DisplayName','O15 uncorr');
% plot(depth_pmma_he,sum(arr_O16(40:80,:))./max(sum(arr_O16(40:80,:))),'-o','DisplayName','O16 uncorr');

plot(depth_pmma_he,sum(arr_O14_corr(40:80,:))./max(sum(arr_O14_corr(40:80,:))),'-o','DisplayName','O14 ');
plot(depth_pmma_he,sum(arr_O15_corr(40:80,:))./max(sum(arr_O15_corr(40:80,:))),'-o','DisplayName','O15 ');
plot(depth_pmma_he,sum(arr_O16_corr(40:80,:))./max(sum(arr_O16_corr(40:80,:))),'-o','DisplayName','O16 ');
hold off;
ax = gca;
ax.FontSize = 14;
ax.XLim = [-5,130];
ax.YLim = [0,1.1];
xlabel('Depth in PMMA (mm)');
ylabel('Coincidence events (a.u.)');
legend
%clear all;
%return;
set(gca, 'YScale', 'linear')

subplot(2,1,2);
hold on
plot(depth_pmma_le,sum(arr_O14l(40:80,:))./max(sum(arr_O14l(40:80,:))),'-o','DisplayName','O14 ');
plot(depth_pmma_le,sum(arr_O15l(40:80,:))./max(sum(arr_O15l(40:80,:))),'-o','DisplayName','O15 ');
plot(depth_pmma_le,sum(arr_O16l(40:80,:))./max(sum(arr_O16l(40:80,:))),'-o','DisplayName','O16 ');

% plot(depth_pmma_le,sum(arr_O14l_corr(40:80,:))./max(sum(arr_O14l_corr(40:80,:))),'-o','DisplayName','O14 ');
% plot(depth_pmma_le,sum(arr_O15l_corr(40:80,:))./max(sum(arr_O15l_corr(40:80,:))),'-o','DisplayName','O15 ');
% plot(depth_pmma_le,sum(arr_O16l_corr(40:80,:))./max(sum(arr_O16l_corr(40:80,:))),'-o','DisplayName','O16 ');
hold off;
ax = gca;
ax.FontSize = 14;
ax.XLim = [-5,130];
ax.YLim = [0,1.1];
xlabel('Depth in PMMA (mm)');
ylabel('Coincidence events (a.u.)');
legend
%clear all;
%return;
set(gca, 'YScale', 'linear')


return;

data = [depth_pmma_le',sum(arr_C10m(40:80,:))]

data_C10_le = [depth_pmma_le',rescale(sum(arr_C10m(40:80,:),'omitnan'))'];
data_C11_le = [depth_pmma_le',rescale(sum(arr_C11a(40:80,:),'omitnan'))'];
data_C12_le = [depth_pmma_le',rescale(sum(arr_C12a(40:80,:),'omitnan'))'];
data_C10_he = [depth_pmma_he',rescale(sum(arr_C10ah(40:80,:),'omitnan'))'];
data_C11_he = [depth_pmma_he',rescale(sum(arr_C11ah(40:80,:),'omitnan'))'];
data_C12_he = [depth_pmma_C12_18_he',rescale(sum(arr_C12ah(40:80,:),'omitnan'))'];

data = [data_C10_le data_C11_le data_C12_le data_C10_he data_C11_he data_C12_he];
writematrix(data,'activity_prof.xlsx');



