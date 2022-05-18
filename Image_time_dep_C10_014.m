
%%% all data 
% This script draws profiles of corrected images with certain time steps 
fig1 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_1c_corr.fig','invisible');
arr1 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig1e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_1c_corr_err.fig','invisible');
arr1e = get(get(gca,'Children'),'CData');
fig2 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_3c_corr.fig','invisible');
arr2 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig2e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_3c_corr_err.fig','invisible');
arr2e = get(get(gca,'Children'),'CData');
fig3 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_7c_corr.fig','invisible');
arr3 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig3e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_7c_corr_err.fig','invisible');
arr3e = get(get(gca,'Children'),'CData');
fig4 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_10c_corr.fig','invisible');
arr4 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig4e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_10c_corr_err.fig','invisible');
arr4e = get(get(gca,'Children'),'CData');
fig5 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_30c_corr.fig','invisible');
arr5 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig5e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_30c_corr_err.fig','invisible');
arr5e = get(get(gca,'Children'),'CData');
fig6 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_70c_corr.fig','invisible');
arr6 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig6e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_70c_corr_err.fig','invisible');
arr6e = get(get(gca,'Children'),'CData');
fig7 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_100c_corr.fig','invisible');
arr7 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig7e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_100c_corr_err.fig','invisible');
arr7e = get(get(gca,'Children'),'CData');
fig8 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_corr.fig','invisible');
arr8 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig8e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_corr_err.fig','invisible');
arr8e = get(get(gca,'Children'),'CData');
fig9 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_2c_corr.fig','invisible');
arr9 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig9e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_2c_corr_err.fig','invisible');
arr9e = get(get(gca,'Children'),'CData');
fig10 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_4c_corr.fig','invisible');
arr10 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig10e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_4c_corr_err.fig','invisible');
arr10e = get(get(gca,'Children'),'CData');
depth_pmma = [-79.7:2:159.3]; % scale for x axis in mm

%files with randomly selected spills
rfig4 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_10c_rand4_corr.fig','invisible');
rarr4 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
rfig4e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_10c_rand4_corr_err.fig','invisible');
rarr4e = get(get(gca,'Children'),'CData');
rfig5 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_10c_rand5_corr.fig','invisible');
rarr5 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
rfig5e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_10c_rand5_corr_err.fig','invisible');
rarr5e = get(get(gca,'Children'),'CData');
rfig6 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_10c_rand6_corr.fig','invisible');
rarr6 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
rfig6e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_10c_rand6_corr_err.fig','invisible');
rarr6e = get(get(gca,'Children'),'CData');


figure;
%title('File C10_014, 40 mm slice, reconstucted for different irradiation time, sensitivity corrected, all events','Interpreter', 'none');
hold on
e1 = errorbar(depth_pmma,sum(arr1(50:70,:)),sqrt(sum(power(arr1e(50:70,:),2),1,'omitnan')),'DisplayName','1 cycle');
e9 = errorbar(depth_pmma,sum(arr9(50:70,:)),sqrt(sum(power(arr9e(50:70,:),2),1,'omitnan')),'DisplayName','2 cycle');
e2 = errorbar(depth_pmma,sum(arr2(50:70,:)),sqrt(sum(power(arr2e(50:70,:),2),1,'omitnan')),'DisplayName','3 cycle');
e10 = errorbar(depth_pmma,sum(arr10(50:70,:)),sqrt(sum(power(arr10e(50:70,:),2),1,'omitnan')),'DisplayName','4 cycle');
e3 = errorbar(depth_pmma,sum(arr3(50:70,:)),sqrt(sum(power(arr3e(50:70,:),2),1,'omitnan')),'DisplayName','7 cycle ');
e4 = errorbar(depth_pmma,sum(arr4(50:70,:)),sqrt(sum(power(arr4e(50:70,:),2),1,'omitnan')),'DisplayName','10 cycle');
e5 = errorbar(depth_pmma,sum(arr5(50:70,:)),sqrt(sum(power(arr5e(50:70,:),2),1,'omitnan')),'DisplayName','30 cycle');
e6 = errorbar(depth_pmma,sum(arr6(50:70,:)),sqrt(sum(power(arr6e(50:70,:),2),1,'omitnan')),'DisplayName','70 cycle ');
e7 = errorbar(depth_pmma,sum(arr7(50:70,:)),sqrt(sum(power(arr7e(50:70,:),2),1,'omitnan')),'DisplayName','100 cycle');
e8 = errorbar(depth_pmma,sum(arr8(50:70,:)),sqrt(sum(power(arr8e(50:70,:),2),1,'omitnan')),'DisplayName','250 cycle, max');
hold off
xlabel('Depth in PMMA (mm)');
ylabel('Number of decays');
set(gca, 'YScale', 'log');
l = legend; set(l, 'Interpreter', 'none');
ax = gca;
ax.FontSize = 14;
ax.XLim = [10,80];
e1.LineStyle = 'none';e1.Marker = 'o';e2.LineStyle = 'none';e2.Marker = 'o';e3.LineStyle = 'none';e3.Marker = 'o';
e4.LineStyle = 'none';e4.Marker = 'o';e5.LineStyle = 'none';e5.Marker = 'o';e6.LineStyle = 'none';e6.Marker = 'o';
e7.LineStyle = 'none';e7.Marker = 'o';e8.LineStyle = 'none';e8.Marker = 'o';e9.LineStyle = 'none';e9.Marker = 'o';
e10.LineStyle = 'none';e10.Marker = 'o';


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
%return;
data = [data1 data2 data3 data4 data5 data6 data7 data8]
%writematrix(data,'C10_014_time_variation.csv');
data2 = [data9 data10];
%writematrix(data2,'C10_014_time_variation_2.csv');

return;
figure;
title('File C10_014, 40 mm slice, reconstucted for random selections of 10 cycles, sensitivity corrected, all events','Interpreter', 'none');
hold on
errorbar(depth_pmma,sum(arr4(50:70,:)),sqrt(sum(power(arr4e(50:70,:),2),1,'omitnan')),'DisplayName','10 cycles selected in a row');
errorbar(depth_pmma,sum(rarr4(50:70,:)),sqrt(sum(power(rarr4e(50:70,:),2),1,'omitnan')),'DisplayName','10 cycles selected rand on slope');
errorbar(depth_pmma,sum(rarr5(50:70,:)),sqrt(sum(power(rarr5e(50:70,:),2),1,'omitnan')),'DisplayName','10 cycles selected rand on slope and plato');
errorbar(depth_pmma,sum(rarr6(50:70,:)),sqrt(sum(power(rarr6e(50:70,:),2),1,'omitnan')),'DisplayName','10 cycles selected rand on plato');
hold off
xlabel('Depth in PMMA (mm)');
ylabel('Intensity (counts)');
set(gca, 'YScale', 'log');
l = legend; set(l, 'Interpreter', 'none');

datar4 = [depth_pmma',sum(rarr4(50:70,:))',sqrt(sum(power(rarr4e(50:70,:),2),1,'omitnan'))'];
datar5 = [depth_pmma',sum(rarr5(50:70,:))',sqrt(sum(power(rarr5e(50:70,:),2),1,'omitnan'))'];
datar6 = [depth_pmma',sum(rarr6(50:70,:))',sqrt(sum(power(rarr6e(50:70,:),2),1,'omitnan'))'];

data = [data4 datar4 datar5 datar6];
%writematrix(data,'C10_014_rand_10spills.csv');
% 
% %%% spill off data 
% fig1 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_red_spilloff_image_10sec_corr.fig','invisible');
% arr1 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
% fig1e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_red_spilloff_image_10sec_corr_err.fig','invisible');
% arr1e = get(get(gca,'Children'),'CData');
% fig2 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_red_spilloff_image_100sec_corr.fig','invisible');
% arr2 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
% fig2e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_red_spilloff_image_100sec_corr_err.fig','invisible');
% arr2e = get(get(gca,'Children'),'CData');
% fig3 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_red_spilloff_image_600sec_corr.fig','invisible');
% arr3 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
% fig3e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_red_spilloff_image_600sec_corr_err.fig','invisible');
% arr3e = get(get(gca,'Children'),'CData');
% depth_pmma = [-79.7:2:159.3]; % scale for x axis in mm
% 
% figure;
% title('File C10_014, 40 mm slice, reconstucted for different irradiation time, sensitivity corrected, only interspill events','Interpreter', 'none');
% hold on
% errorbar(depth_pmma,sum(arr1(50:70,:)),sqrt(sum(power(arr1e(50:70,:),2),1,'omitnan')),'DisplayName','10 sec');
% errorbar(depth_pmma,sum(arr2(50:70,:)),sqrt(sum(power(arr2e(50:70,:),2),1,'omitnan')),'DisplayName','100 sec');
% errorbar(depth_pmma,sum(arr3(50:70,:)),sqrt(sum(power(arr3e(50:70,:),2),1,'omitnan')),'DisplayName','600 sec');
% hold off
% xlabel('Depth in PMMA (mm)');
% ylabel('Intensity (counts)');
% set(gca, 'YScale', 'log');
% l = legend; set(l, 'Interpreter', 'none');