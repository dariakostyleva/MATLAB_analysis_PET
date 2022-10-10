
%%% all data 
% This script draws profiles of corrected images with certain time steps 
fig1 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_1c.fig','invisible');
arr1 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig1e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_1c_err.fig','invisible');
arr1e = get(get(gca,'Children'),'CData');
fig2 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_3c.fig','invisible');
arr2 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig2e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_3c_err.fig','invisible');
arr2e = get(get(gca,'Children'),'CData');
fig3 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_7c.fig','invisible');
arr3 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig3e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_7c_err.fig','invisible');
arr3e = get(get(gca,'Children'),'CData');
fig4 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_10c.fig','invisible');
arr4 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig4e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_10c_err.fig','invisible');
arr4e = get(get(gca,'Children'),'CData');
fig5 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_30c.fig','invisible');
arr5 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig5e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_30c_err.fig','invisible');
arr5e = get(get(gca,'Children'),'CData');
fig6 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_70c.fig','invisible');
arr6 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig6e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_70c_err.fig','invisible');
arr6e = get(get(gca,'Children'),'CData');
fig7 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_100c.fig','invisible');
arr7 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig7e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_100c_err.fig','invisible');
arr7e = get(get(gca,'Children'),'CData');
fig8 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image.fig','invisible');
arr8 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig8e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_err.fig','invisible');
arr8e = get(get(gca,'Children'),'CData');
fig9 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_2c.fig','invisible');
arr9 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig9e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_2c_err.fig','invisible');
arr9e = get(get(gca,'Children'),'CData');
fig10 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_4c.fig','invisible');
arr10 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig10e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_4c_err.fig','invisible');
arr10e = get(get(gca,'Children'),'CData');
depth_pmma = [-76.4:2:162.6]; % scale for x axis in mm

figure;
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
ylabel('Number of counts');
set(gca, 'YScale', 'log');
l = legend; set(l, 'Interpreter', 'none');
ax = gca;
ax.FontSize = 14;
ax.XLim = [0,140];
%e1.LineStyle = 'none';e1.Marker = 'o';e2.LineStyle = 'none';e2.Marker = 'o';e3.LineStyle = 'none';e3.Marker = 'o';
%e4.LineStyle = 'none';e4.Marker = 'o';e5.LineStyle = 'none';e5.Marker = 'o';e6.LineStyle = 'none';e6.Marker = 'o';
%e7.LineStyle = 'none';e7.Marker = 'o';e8.LineStyle = 'none';e8.Marker = 'o';e9.LineStyle = 'none';e9.Marker = 'o';
%e10.LineStyle = 'none';e10.Marker = 'o';


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
data = [data1 data9 data2 data10 data3 data4 data5 data6 data7 data8]
writematrix(data,'C10_014_time_variation_uncorr.xls');

