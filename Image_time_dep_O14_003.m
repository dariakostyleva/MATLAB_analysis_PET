% This script draws profiles of corrected images with certain time steps 

fig1 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_figs\O14_003_red_spilloff_image_1c_corr.fig','invisible');
arr1 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig1e = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_figs\O14_003_red_spilloff_image_1c_corr_err.fig','invisible');
arr1e = get(get(gca,'Children'),'CData');
fig2 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_figs\O14_003_red_spilloff_image_2c_corr.fig','invisible');
arr2 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig2e = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_figs\O14_003_red_spilloff_image_2c_corr_err.fig','invisible');
arr2e = get(get(gca,'Children'),'CData');
fig3 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_figs\O14_003_red_spilloff_image_3c_corr.fig','invisible');
arr3 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig3e = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_figs\O14_003_red_spilloff_image_3c_corr_err.fig','invisible');
arr3e = get(get(gca,'Children'),'CData');
fig4 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_figs\O14_003_red_spilloff_image_4c_corr.fig','invisible');
arr4 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig4e = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_figs\O14_003_red_spilloff_image_4c_corr_err.fig','invisible');
arr4e = get(get(gca,'Children'),'CData');
fig7 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_figs\O14_003_red_spilloff_image_7c_corr.fig','invisible');
arr7 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig7e = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_figs\O14_003_red_spilloff_image_7c_corr_err.fig','invisible');
arr7e = get(get(gca,'Children'),'CData');
fig10 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_figs\O14_003_red_spilloff_image_10c_corr.fig','invisible');
arr10 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig10e = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_figs\O14_003_red_spilloff_image_10c_corr_err.fig','invisible');
arr10e = get(get(gca,'Children'),'CData');
fig30 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_figs\O14_003_red_spilloff_image_30c_corr.fig','invisible');
arr30 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig30e = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_figs\O14_003_red_spilloff_image_30c_corr_err.fig','invisible');
arr30e = get(get(gca,'Children'),'CData');
fig70 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_figs\O14_003_red_spilloff_image_70c_corr.fig','invisible');
arr70 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig70e = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_figs\O14_003_red_spilloff_image_70c_corr_err.fig','invisible');
arr70e = get(get(gca,'Children'),'CData');
fig100 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_figs\O14_003_red_spilloff_image_100c_corr.fig','invisible');
arr100 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig100e = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_figs\O14_003_red_spilloff_image_100c_corr_err.fig','invisible');
arr100e = get(get(gca,'Children'),'CData');
figall = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_figs\O14_003_red_spilloff_image_500c_corr.fig','invisible');
arrall = get(get(gca,'Children'),'CData'); % getting data from figure as an array
figalle = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_figs\O14_003_red_spilloff_image_500c_corr_err.fig','invisible');
arralle = get(get(gca,'Children'),'CData');

depth_pmma = [-49:2:190]; % scale for x axis in mm higher energy, pin 2
ncycle = 500; % total number of cycles in a file

% generating string headers for table
h_all = strcat(num2str(ncycle),' cycle, full beam-on period');
h_all_2 = strcat(num2str(ncycle),' cycle, Depth in PMMA (mm)');
h_all_3 = strcat(num2str(ncycle),' cycle, Counts');
h_all_4 = strcat(num2str(ncycle),' cycle, Error');

figure;
title('File O14_003, 40 mm slice, reconstucted for different irradiation time, sensitivity corrected, SPILLOFF events','Interpreter', 'none');
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
errorbar(depth_pmma,sum(arrall(50:70,:)),sqrt(sum(power(arralle(50:70,:),2),1,'omitnan')),'DisplayName',h_all);
hold off
xlabel('Depth in PMMA (mm)');
ylabel('Intensity (counts)');
set(gca, 'YScale', 'log');
l = legend; set(l, 'Interpreter', 'none');

data1 = table(depth_pmma',sum(arr1(50:70,:))',sqrt(sum(power(arr1e(50:70,:),2),1,'omitnan'))', 'VariableNames', {'1 cycle, Depth in PMMA (mm)','1 cycle, Counts','1 cycle, Error'});
data2 = table(depth_pmma',sum(arr2(50:70,:))',sqrt(sum(power(arr2e(50:70,:),2),1,'omitnan'))', 'VariableNames', {'2 cycle, Depth in PMMA (mm)','2 cycle, Counts','2 cycle, Error'});
data3 = table(depth_pmma',sum(arr3(50:70,:))',sqrt(sum(power(arr3e(50:70,:),2),1,'omitnan'))', 'VariableNames', {'3 cycle, Depth in PMMA (mm)','3 cycle, Counts','3 cycle, Error'});
data4 = table(depth_pmma',sum(arr4(50:70,:))',sqrt(sum(power(arr4e(50:70,:),2),1,'omitnan'))', 'VariableNames', {'4 cycle, Depth in PMMA (mm)','4 cycle, Counts','4 cycle, Error'});
data7 = table(depth_pmma',sum(arr7(50:70,:))',sqrt(sum(power(arr7e(50:70,:),2),1,'omitnan'))', 'VariableNames', {'7 cycle, Depth in PMMA (mm)','7 cycle, Counts','7 cycle, Error'});
data10 = table(depth_pmma',sum(arr10(50:70,:))',sqrt(sum(power(arr10e(50:70,:),2),1,'omitnan'))', 'VariableNames', {'10 cycle, Depth in PMMA (mm)','10 cycle, Counts','10 cycle, Error'});
data30 = table(depth_pmma',sum(arr30(50:70,:))',sqrt(sum(power(arr30e(50:70,:),2),1,'omitnan'))', 'VariableNames', {'30 cycle, Depth in PMMA (mm)','30 cycle, Counts','30 cycle, Error'});
data70 = table(depth_pmma',sum(arr70(50:70,:))',sqrt(sum(power(arr70e(50:70,:),2),1,'omitnan'))', 'VariableNames', {'70 cycle, Depth in PMMA (mm)','70 cycle, Counts','70 cycle, Error'});
data100 = table(depth_pmma',sum(arr100(50:70,:))',sqrt(sum(power(arr100e(50:70,:),2),1,'omitnan'))', 'VariableNames', {'100 cycle, Depth in PMMA (mm)','100 cycle, Counts','100 cycle, Error'});
dataall = table(depth_pmma',sum(arrall(50:70,:))',sqrt(sum(power(arralle(50:70,:),2),1,'omitnan'))', 'VariableNames', {h_all_2, h_all_3, h_all_4});
data = [data1 data2 data3 data4 data7 data10 data30 data70 data100 dataall];
return;
writetable(data,'O14_003_time_variation.xls', 'WriteVariableNames', true);