% This script draws profiles of corrected images with certain time steps 

fig1 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spillon_image_1c_corr.fig','invisible');
arr1 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig1e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spillon_image_1c_corr_err.fig','invisible');
arr1e = get(get(gca,'Children'),'CData');
fig2 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spillon_image_2c_corr.fig','invisible');
arr2 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig2e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spillon_image_2c_corr_err.fig','invisible');
arr2e = get(get(gca,'Children'),'CData');
fig3 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spillon_image_3c_corr.fig','invisible');
arr3 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig3e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spillon_image_3c_corr_err.fig','invisible');
arr3e = get(get(gca,'Children'),'CData');
fig4 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spillon_image_4c_corr.fig','invisible');
arr4 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig4e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spillon_image_4c_corr_err.fig','invisible');
arr4e = get(get(gca,'Children'),'CData');
fig7 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spillon_image_7c_corr.fig','invisible');
arr7 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig7e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spillon_image_7c_corr_err.fig','invisible');
arr7e = get(get(gca,'Children'),'CData');
fig10 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spillon_image_10c_corr.fig','invisible');
arr10 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig10e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spillon_image_10c_corr_err.fig','invisible');
arr10e = get(get(gca,'Children'),'CData');
fig30 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spillon_image_30c_corr.fig','invisible');
arr30 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig30e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spillon_image_30c_corr_err.fig','invisible');
arr30e = get(get(gca,'Children'),'CData');

depth_pmma = [-79.7:2:159.3]; % scale for x axis in mm

figure;
title('File C11_012, 40 mm slice, reconstucted for different irradiation time, sensitivity corrected, SPILLON events','Interpreter', 'none');
hold on
errorbar(depth_pmma,sum(arr1(50:70,:)),sqrt(sum(power(arr1e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle');
errorbar(depth_pmma,sum(arr2(50:70,:)),sqrt(sum(power(arr2e(50:70,:),2),1,'omitnan')),'DisplayName','2 cycle');
errorbar(depth_pmma,sum(arr3(50:70,:)),sqrt(sum(power(arr3e(50:70,:),2),1,'omitnan')),'DisplayName','3 cycle');
errorbar(depth_pmma,sum(arr4(50:70,:)),sqrt(sum(power(arr4e(50:70,:),2),1,'omitnan')),'DisplayName','4 cycle');
errorbar(depth_pmma,sum(arr7(50:70,:)),sqrt(sum(power(arr7e(50:70,:),2),1,'omitnan')),'DisplayName','7 cycle');
errorbar(depth_pmma,sum(arr10(50:70,:)),sqrt(sum(power(arr10e(50:70,:),2),1,'omitnan')),'DisplayName','10 cycle');
errorbar(depth_pmma,sum(arr30(50:70,:)),sqrt(sum(power(arr30e(50:70,:),2),1,'omitnan')),'DisplayName','30 cycle');
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


data = [data1 data2 data3 data4 data7 data10 data30];
writematrix(data,'C11_012_time_variation_spillon.csv');