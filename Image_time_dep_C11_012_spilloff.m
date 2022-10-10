% This script draws profiles of corrected images with certain time steps 

fig1 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_1c_corr.fig','invisible');
arr1 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig1e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_1c_corr_err.fig','invisible');
arr1e = get(get(gca,'Children'),'CData');
fig2 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_2c_corr.fig','invisible');
arr2 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig2e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_2c_corr_err.fig','invisible');
arr2e = get(get(gca,'Children'),'CData');
fig3 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_3c_corr.fig','invisible');
arr3 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig3e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_3c_corr_err.fig','invisible');
arr3e = get(get(gca,'Children'),'CData');
fig4 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_4c_corr.fig','invisible');
arr4 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig4e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_4c_corr_err.fig','invisible');
arr4e = get(get(gca,'Children'),'CData');
fig7 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_7c_corr.fig','invisible');
arr7 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig7e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_7c_corr_err.fig','invisible');
arr7e = get(get(gca,'Children'),'CData');
fig10 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_10c_corr.fig','invisible');
arr10 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig10e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_10c_corr_err.fig','invisible');
arr10e = get(get(gca,'Children'),'CData');
fig30 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_30c_corr.fig','invisible');
arr30 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig30e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_30c_corr_err.fig','invisible');
arr30e = get(get(gca,'Children'),'CData');
fig70 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_70c_corr.fig','invisible');
arr70 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig70e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_70c_corr_err.fig','invisible');
arr70e = get(get(gca,'Children'),'CData');
fig100 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_100c_corr.fig','invisible');
arr100 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig100e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_100c_corr_err.fig','invisible');
arr100e = get(get(gca,'Children'),'CData');
fig518 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_518c_corr.fig','invisible');
arr518 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig518e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_518c_corr_err.fig','invisible');
arr518e = get(get(gca,'Children'),'CData');

depth_pmma = [-79.7:2:159.3]; % scale for x axis in mm

figure;
title('File C11_012, 40 mm slice, reconstucted for different irradiation time, sensitivity corrected, SPILLOFF events','Interpreter', 'none');
hold on
errorbar(depth_pmma,sum(arr1(50:70,:)),sqrt(sum(power(arr1e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle');
errorbar(depth_pmma,sum(arr2(50:70,:)),sqrt(sum(power(arr2e(50:70,:),2),1,'omitnan')),'DisplayName','2 cycle');
errorbar(depth_pmma,sum(arr3(50:70,:)),sqrt(sum(power(arr3e(50:70,:),2),1,'omitnan')),'DisplayName','3 cycle');
errorbar(depth_pmma,sum(arr4(50:70,:)),sqrt(sum(power(arr4e(50:70,:),2),1,'omitnan')),'DisplayName','4 cycle');
errorbar(depth_pmma,sum(arr7(50:70,:)),sqrt(sum(power(arr7e(50:70,:),2),1,'omitnan')),'DisplayName','7 cycle');
errorbar(depth_pmma,sum(arr10(50:70,:)),sqrt(sum(power(arr10e(50:70,:),2),1,'omitnan')),'DisplayName','10 cycle');
errorbar(depth_pmma,sum(arr30(50:70,:)),sqrt(sum(power(arr30e(50:70,:),2),1,'omitnan')),'DisplayName','30 cycle');
errorbar(depth_pmma,sum(arr70(50:70,:)),sqrt(sum(power(arr70e(50:70,:),2),1,'omitnan')),'DisplayName','70 cycle');
errorbar(depth_pmma,sum(arr100(50:70,:)),sqrt(sum(power(arr100e(50:70,:),2),1,'omitnan')),'DisplayName','100 cycle');
errorbar(depth_pmma,sum(arr518(50:70,:)),sqrt(sum(power(arr518e(50:70,:),2),1,'omitnan')),'DisplayName','518 cycle, , full beam-on period');
hold off
xlabel('Depth in PMMA (mm)');
ylabel('Intensity (counts)');
set(gca, 'YScale', 'log');
l = legend; set(l, 'Interpreter', 'none');

data1 = [depth_pmma',sum(arr1(50:70,:))',sqrt(sum(power(arr1e(50:70,:),2),1,'omitnan'))'];
data2 = [depth_pmma',sum(arr2(50:70,:))',sqrt(sum(power(arr2e(50:70,:),2),1,'omitnan'))'];
data3 = [depth_pmma',sum(arr3(50:70,:))',sqrt(sum(power(arr3e(50:70,:),2),1,'omitnan'))'];
data4 = [depth_pmma',sum(arr4(50:70,:))',sqrt(sum(power(arr4e(50:70,:),2),1,'omitnan'))'];
data7 = [depth_pmma',sum(arr7(50:70,:))',sqrt(sum(power(arr7e(50:70,:),2),1,'omitnan'))'];
data10 = [depth_pmma',sum(arr10(50:70,:))',sqrt(sum(power(arr10e(50:70,:),2),1,'omitnan'))'];
data30 = [depth_pmma',sum(arr30(50:70,:))',sqrt(sum(power(arr30e(50:70,:),2),1,'omitnan'))'];
data70 = [depth_pmma',sum(arr70(50:70,:))',sqrt(sum(power(arr70e(50:70,:),2),1,'omitnan'))'];
data100 = [depth_pmma',sum(arr100(50:70,:))',sqrt(sum(power(arr100e(50:70,:),2),1,'omitnan'))'];
data518 = [depth_pmma',sum(arr518(50:70,:))',sqrt(sum(power(arr518e(50:70,:),2),1,'omitnan'))'];
%return;
data = [data1 data2 data3 data4 data7 data10 data30 data70 data100 data518];
writematrix(data,'C11_012_time_variation_spilloff.csv');