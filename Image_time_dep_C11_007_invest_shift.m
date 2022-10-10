% This script draws profiles of corrected images with certain time steps 

fig1 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_0_10_corr.fig','invisible');
arr1 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig1e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_0_10_corr_err.fig','invisible');
arr1e = get(get(gca,'Children'),'CData');
fig2 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_50_60_corr.fig','invisible');
arr2 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig2e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_50_60_corr_err.fig','invisible');
arr2e = get(get(gca,'Children'),'CData');
fig3 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_100_110_corr.fig','invisible');
arr3 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig3e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_100_110_corr_err.fig','invisible');
arr3e = get(get(gca,'Children'),'CData');
fig4 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_150_160_corr.fig','invisible');
arr4 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig4e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_150_160_corr_err.fig','invisible');
arr4e = get(get(gca,'Children'),'CData');
fig7 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_200_210_corr.fig','invisible');
arr7 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig7e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_200_210_corr_err.fig','invisible');
arr7e = get(get(gca,'Children'),'CData');
fig10 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_250_260_corr.fig','invisible');
arr10 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig10e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_250_260_corr_err.fig','invisible');
arr10e = get(get(gca,'Children'),'CData');
fig30 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_300_310_corr.fig','invisible');
arr30 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig30e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_300_310_corr_err.fig','invisible');
arr30e = get(get(gca,'Children'),'CData');
fig70 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_350_360_corr.fig','invisible');
arr70 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig70e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_350_360_corr_err.fig','invisible');
arr70e = get(get(gca,'Children'),'CData');
fig100 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_400_410_corr.fig','invisible');
arr100 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig100e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_400_410_corr_err.fig','invisible');
arr100e = get(get(gca,'Children'),'CData');
figall = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_450_460_corr.fig','invisible');
arrall = get(get(gca,'Children'),'CData'); % getting data from figure as an array
figalle = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_450_460_corr_err.fig','invisible');
arralle = get(get(gca,'Children'),'CData');
figall2 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_490_500_corr.fig','invisible');
arrall2 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
figalle2 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\shift_invest\C11_007_red_spilloff_image_10c_490_500_corr_err.fig','invisible');
arralle2 = get(get(gca,'Children'),'CData');

depth_pmma = [-16.4:2:222.6]; % scale for x axis in mm

figure;
title('File C11_007, cuts of 10 spills, 40 mm slice, reconstucted for different irradiation time, sensitivity corrected, SPILLOFF events','Interpreter', 'none');
hold on
errorbar(depth_pmma,sum(arr1(50:70,:)),sqrt(sum(power(arr1e(50:70,:),2),1,'omitnan')),'DisplayName','0-10 cycle');
errorbar(depth_pmma,sum(arr2(50:70,:)),sqrt(sum(power(arr2e(50:70,:),2),1,'omitnan')),'DisplayName','50-60 cycle');
errorbar(depth_pmma,sum(arr3(50:70,:)),sqrt(sum(power(arr3e(50:70,:),2),1,'omitnan')),'DisplayName','100-110 cycle');
errorbar(depth_pmma,sum(arr4(50:70,:)),sqrt(sum(power(arr4e(50:70,:),2),1,'omitnan')),'DisplayName','150-160 cycle');
errorbar(depth_pmma,sum(arr7(50:70,:)),sqrt(sum(power(arr7e(50:70,:),2),1,'omitnan')),'DisplayName','200-210 cycle');
errorbar(depth_pmma,sum(arr10(50:70,:)),sqrt(sum(power(arr10e(50:70,:),2),1,'omitnan')),'DisplayName','250-260 cycle');
errorbar(depth_pmma,sum(arr30(50:70,:)),sqrt(sum(power(arr30e(50:70,:),2),1,'omitnan')),'DisplayName','300-310 cycle');
errorbar(depth_pmma,sum(arr70(50:70,:)),sqrt(sum(power(arr70e(50:70,:),2),1,'omitnan')),'DisplayName','350-360 cycle');
errorbar(depth_pmma,sum(arr100(50:70,:)),sqrt(sum(power(arr100e(50:70,:),2),1,'omitnan')),'DisplayName','400-410 cycle');
errorbar(depth_pmma,sum(arrall(50:70,:)),sqrt(sum(power(arralle(50:70,:),2),1,'omitnan')),'DisplayName','450-460 cycle');
errorbar(depth_pmma,sum(arrall2(50:70,:)),sqrt(sum(power(arralle2(50:70,:),2),1,'omitnan')),'DisplayName','490-500 cycle');
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
dataall = [depth_pmma',sum(arrall(50:70,:))',sqrt(sum(power(arralle(50:70,:),2),1,'omitnan'))'];
dataall2 = [depth_pmma',sum(arrall2(50:70,:))',sqrt(sum(power(arralle2(50:70,:),2),1,'omitnan'))'];
%return;
data = [data1 data2 data3 data4 data7 data10 data30 data70 data100 dataall dataall2];
writematrix(data,'C11_007_time_variation_10_spills_cuts.xlsx');