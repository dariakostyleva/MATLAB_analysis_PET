
%%% all data 
% This script draws profiles of corrected images with certain time steps 
fig1 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand1_corr.fig','invisible');
arr1 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig1e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand1_corr_err.fig','invisible');
arr1e = get(get(gca,'Children'),'CData');
fig2 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand2_corr.fig','invisible');
arr2 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig2e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand2_corr_err.fig','invisible');
arr2e = get(get(gca,'Children'),'CData');
fig3 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand3_corr.fig','invisible');
arr3 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig3e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand3_corr_err.fig','invisible');
arr3e = get(get(gca,'Children'),'CData');
fig4 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand4_corr.fig','invisible');
arr4 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig4e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand4_corr_err.fig','invisible');
arr4e = get(get(gca,'Children'),'CData');
fig5 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand5_corr.fig','invisible');
arr5 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig5e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand5_corr_err.fig','invisible');
arr5e = get(get(gca,'Children'),'CData');
fig6 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand6_corr.fig','invisible');
arr6 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig6e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand6_corr_err.fig','invisible');
arr6e = get(get(gca,'Children'),'CData');
fig7 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand7_corr.fig','invisible');
arr7 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig7e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand7_corr_err.fig','invisible');
arr7e = get(get(gca,'Children'),'CData');
fig8 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand8_corr.fig','invisible');
arr8 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig8e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand8_corr_err.fig','invisible');
arr8e = get(get(gca,'Children'),'CData');
fig9 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand9_corr.fig','invisible');
arr9 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig9e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand9_corr_err.fig','invisible');
arr9e = get(get(gca,'Children'),'CData');
fig10 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand10_corr.fig','invisible');
arr10 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig10e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand10_corr_err.fig','invisible');
arr10e = get(get(gca,'Children'),'CData');
fig11 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand11_corr.fig','invisible');
arr11 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig11e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand11_corr_err.fig','invisible');
arr11e = get(get(gca,'Children'),'CData');
fig12 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand12_corr.fig','invisible');
arr12 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig12e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand12_corr_err.fig','invisible');
arr12e = get(get(gca,'Children'),'CData');
fig13 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand13_corr.fig','invisible');
arr13 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig13e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand13_corr_err.fig','invisible');
arr13e = get(get(gca,'Children'),'CData');
fig14 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand14_corr.fig','invisible');
arr14 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig14e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand14_corr_err.fig','invisible');
arr14e = get(get(gca,'Children'),'CData');
fig15 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand15_corr.fig','invisible');
arr15 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig15e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand15_corr_err.fig','invisible');
arr15e = get(get(gca,'Children'),'CData');
fig16 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand16_corr.fig','invisible');
arr16 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig16e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand16_corr_err.fig','invisible');
arr16e = get(get(gca,'Children'),'CData');
fig17 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand17_corr.fig','invisible');
arr17 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig17e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand17_corr_err.fig','invisible');
arr17e = get(get(gca,'Children'),'CData');
fig18 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand18_corr.fig','invisible');
arr18 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig18e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand18_corr_err.fig','invisible');
arr18e = get(get(gca,'Children'),'CData');
fig19 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand19_corr.fig','invisible');
arr19 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig19e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand19_corr_err.fig','invisible');
arr19e = get(get(gca,'Children'),'CData');
fig20 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand20_corr.fig','invisible');
arr20 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig20e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c_plato_rand20_corr_err.fig','invisible');
arr20e = get(get(gca,'Children'),'CData');

depth_pmma = [-49:2:190]; % scale for x axis in mm

figure;
title('File C12_018, 40 mm slice, reconstucted for 1 cycle from "plato" selected randomly 20 times, sensitivity corrected, spill-off events','Interpreter', 'none');
hold on
errorbar(depth_pmma,sum(arr1(50:70,:)),sqrt(sum(power(arr1e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle, rand 1');
errorbar(depth_pmma,sum(arr2(50:70,:)),sqrt(sum(power(arr2e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle, rand 2');
errorbar(depth_pmma,sum(arr3(50:70,:)),sqrt(sum(power(arr3e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle, rand 3');
errorbar(depth_pmma,sum(arr4(50:70,:)),sqrt(sum(power(arr4e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle, rand 4');
errorbar(depth_pmma,sum(arr5(50:70,:)),sqrt(sum(power(arr5e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle, rand 5');
errorbar(depth_pmma,sum(arr6(50:70,:)),sqrt(sum(power(arr6e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle, rand 6');
errorbar(depth_pmma,sum(arr7(50:70,:)),sqrt(sum(power(arr7e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle, rand 7');
errorbar(depth_pmma,sum(arr8(50:70,:)),sqrt(sum(power(arr8e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle, rand 8');
errorbar(depth_pmma,sum(arr9(50:70,:)),sqrt(sum(power(arr9e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle, rand 9');
errorbar(depth_pmma,sum(arr10(50:70,:)),sqrt(sum(power(arr10e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle, rand 10');
errorbar(depth_pmma,sum(arr11(50:70,:)),sqrt(sum(power(arr11e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle, rand 11');
errorbar(depth_pmma,sum(arr12(50:70,:)),sqrt(sum(power(arr12e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle, rand 12');
errorbar(depth_pmma,sum(arr13(50:70,:)),sqrt(sum(power(arr13e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle, rand 13');
errorbar(depth_pmma,sum(arr14(50:70,:)),sqrt(sum(power(arr14e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle, rand 14');
errorbar(depth_pmma,sum(arr15(50:70,:)),sqrt(sum(power(arr15e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle, rand 15');
errorbar(depth_pmma,sum(arr16(50:70,:)),sqrt(sum(power(arr16e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle, rand 16');
errorbar(depth_pmma,sum(arr17(50:70,:)),sqrt(sum(power(arr17e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle, rand 17');
errorbar(depth_pmma,sum(arr18(50:70,:)),sqrt(sum(power(arr18e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle, rand 18');
errorbar(depth_pmma,sum(arr19(50:70,:)),sqrt(sum(power(arr19e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle, rand 19');
errorbar(depth_pmma,sum(arr20(50:70,:)),sqrt(sum(power(arr20e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle, rand 20');
hold off
xlabel('Depth in PMMA (mm)');
ylabel('Intensity (counts)');
set(gca, 'YScale', 'log');
l = legend; set(l, 'Interpreter', 'none');

data1 = [depth_pmma',sum(arr1(50:70,:))',sqrt(sum(power(arr1e(50:70,:),2),1,'omitnan'))'];
data2 = [depth_pmma',sum(arr2(50:70,:))',sqrt(sum(power(arr2e(50:70,:),2),1,'omitnan'))'];
data3 = [depth_pmma',sum(arr3(50:70,:))',sqrt(sum(power(arr3e(50:70,:),2),1,'omitnan'))'];
data4 = [depth_pmma',sum(arr4(50:70,:))',sqrt(sum(power(arr4e(50:70,:),2),1,'omitnan'))'];
data5 = [depth_pmma',sum(arr5(50:70,:))',sqrt(sum(power(arr5e(50:70,:),2),1,'omitnan'))'];
data6 = [depth_pmma',sum(arr6(50:70,:))',sqrt(sum(power(arr6e(50:70,:),2),1,'omitnan'))'];
data7 = [depth_pmma',sum(arr7(50:70,:))',sqrt(sum(power(arr7e(50:70,:),2),1,'omitnan'))'];
data8 = [depth_pmma',sum(arr8(50:70,:))',sqrt(sum(power(arr8e(50:70,:),2),1,'omitnan'))'];
data9 = [depth_pmma',sum(arr9(50:70,:))',sqrt(sum(power(arr9e(50:70,:),2),1,'omitnan'))'];
data10 = [depth_pmma',sum(arr10(50:70,:))',sqrt(sum(power(arr10e(50:70,:),2),1,'omitnan'))'];
data11 = [depth_pmma',sum(arr11(50:70,:))',sqrt(sum(power(arr11e(50:70,:),2),1,'omitnan'))'];
data12 = [depth_pmma',sum(arr12(50:70,:))',sqrt(sum(power(arr12e(50:70,:),2),1,'omitnan'))'];
data13 = [depth_pmma',sum(arr13(50:70,:))',sqrt(sum(power(arr13e(50:70,:),2),1,'omitnan'))'];
data14 = [depth_pmma',sum(arr14(50:70,:))',sqrt(sum(power(arr14e(50:70,:),2),1,'omitnan'))'];
data15 = [depth_pmma',sum(arr15(50:70,:))',sqrt(sum(power(arr15e(50:70,:),2),1,'omitnan'))'];
data16 = [depth_pmma',sum(arr16(50:70,:))',sqrt(sum(power(arr16e(50:70,:),2),1,'omitnan'))'];
data17 = [depth_pmma',sum(arr17(50:70,:))',sqrt(sum(power(arr17e(50:70,:),2),1,'omitnan'))'];
data18 = [depth_pmma',sum(arr18(50:70,:))',sqrt(sum(power(arr18e(50:70,:),2),1,'omitnan'))'];
data19 = [depth_pmma',sum(arr19(50:70,:))',sqrt(sum(power(arr19e(50:70,:),2),1,'omitnan'))'];
data20 = [depth_pmma',sum(arr20(50:70,:))',sqrt(sum(power(arr20e(50:70,:),2),1,'omitnan'))'];
%return;
data = [data1 data2 data3 data4 data5 data6 data7 data8 data9 data10 data11 data12 data13 data14 data15 data16 data17 data18 data19 data20];
writematrix(data,'C12_018_rand_1c_plato.csv');


