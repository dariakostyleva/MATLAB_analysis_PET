%%%%%%%%%%%%%%%%%% Script for putting profiles for presenation

%%%%%%%%%%%%%%%%%%     Carbons lower energy, EXPECTED RANGE PMMA 39.3 mm    %%%%%%%%%%%%%%%%%%%
% 
fig_C10m = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_015_red_image_188c_Hans_corr','invisible');
arr_C10m = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C10me = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_015_red_image_188c_Hans_corr_err.fig','invisible');
arr_C10me = get(get(gca,'Children'),'CData');

% fig_C10a = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_red_image_212c_Hans_corr_test.fig','invisible');
% arr_C10a = get(get(gca,'Children'),'CData'); % getting data from figure as an array
% fig_C10ae = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_red_image_212c_Hans_corr_err_test.fig','invisible');
% %fig_C10ae = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_001_figs\C10_001_red_image_248c_corr_err.fig','invisible');
% arr_C10ae = get(get(gca,'Children'),'CData');

fig_C11a = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_red_spilloff_image_188c_Hans_corr.fig','invisible');
arr_C11a = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C11ae = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_red_spilloff_image_188c_Hans_corr_err.fig','invisible');
arr_C11ae = get(get(gca,'Children'),'CData');

fig_C12a = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_017_red_spilloff_image_188c_Hans_corr.fig','invisible');
arr_C12a = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C12ae = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_017_red_spilloff_image_188c_Hans_corr_err.fig','invisible');
arr_C12ae = get(get(gca,'Children'),'CData');

xx = [-119:2:119];
yy = [-119:2:119];
depth_pmma_le = [-79.7:2:159.3]; % scale for x axis in mm lower energy
depth_pmma_he = [-16.4:2:222.6]; % scale for x axis in mm higher energy
depth_pmma_C10_14_le = [-76.4:2:162.6]; % scale for x axis in mm lower energy IC forgotten
depth_pmma_C12_18_he = [-49:2:190]
set(0, 'DefaultLineLineWidth', 1.5);


figure;

hold on;
% plot(depth_pmma_C10_14_le,sum(arr_C10a(40:80,:))./max(sum(arr_C10a(40:80,:))),'-o','DisplayName','C10a');
% plot(depth_pmma_le,sum(arr_C10m(40:80,:))./max(sum(arr_C10m(40:80,:))),'-o','DisplayName','C10m');
% plot(depth_pmma_le,sum(arr_C11a(40:80,:))./max(sum(arr_C11a(40:80,:))),'-o','DisplayName','C11');
% plot(depth_pmma_le,sum(arr_C12a(40:80,:))./max(sum(arr_C12a(40:80,:))),'-o','DisplayName','C12');
%plot(depth_pmma_C10_14_le,sum(arr_C10a(40:80,:))./1.4528e+08,'-o','DisplayName','C10a');
plot(depth_pmma_le,sum(arr_C10m(40:80,:))./7.6455e+07,'-o','DisplayName','C10');
plot(depth_pmma_le,sum(arr_C11a(40:80,:))./1.4752e+09,'-o','DisplayName','C11');
plot(depth_pmma_le,sum(arr_C12a(40:80,:))./1.6675e+09,'-o','DisplayName','C12');
hold off;

set(gca, 'YScale', 'log');
ax = gca;
ax.FontSize = 14;
ax.XLim = [-5,70];
xlabel('Depth in PMMA (mm)');
ylabel('Coincidence events per 2 mm/ total intensity during 15 min of irrad');
legend
%clear all;
%return;
arr1 = sum(arr_C10m(40:80,:))./7.6455e+07;
arr2 = sum(arr_C11a(40:80,:))./1.4752e+09;
arr3 = sum(arr_C12a(40:80,:))./1.6675e+09;
data_C10_le = [depth_pmma_le',arr1'];
data_C11_le = [depth_pmma_le',arr2'];
data_C12_le = [depth_pmma_le',arr3'];

%return;
data = [data_C10_le data_C11_le data_C12_le ];
writematrix(data,'activity_prof_le.xlsx');



