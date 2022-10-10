%%% profiles sent to Giulio
%%% C11_007, C11_008 and C10_003

fig1 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_008_figs\C11_008_red_image_corr.fig','invisible');
arr1 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig1e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_008_figs\C11_008_red_image_corr_err.fig','invisible');
arr1e = get(get(gca,'Children'),'CData');

fig2 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\C11_007_red_image_corr.fig','invisible');
arr2 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig2e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\C11_007_red_image_corr_err.fig','invisible');
arr2e = get(get(gca,'Children'),'CData');

fig3 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_003_figs\C10_003_red_image_corr.fig','invisible');
arr3 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig3e = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_003_figs\C10_003_red_image_corr_err.fig','invisible');
arr3e = get(get(gca,'Children'),'CData');

depth_pmma = [-16.4:2:222.6]; % scale for x axis in mm

figure;
title('C10 mono, C11 achro, C11  mono, higher energy, PMMA, 40 mm slice sensitivity corrected, all events ','Interpreter', 'none');
hold on
errorbar(depth_pmma,sum(arr1(50:70,:)),sqrt(sum(power(arr1e(50:70,:),2),1,'omitnan')),'DisplayName','C11 mono');
errorbar(depth_pmma,sum(arr2(50:70,:)),sqrt(sum(power(arr2e(50:70,:),2),1,'omitnan')),'DisplayName','C11 achro');
errorbar(depth_pmma,sum(arr3(50:70,:)),sqrt(sum(power(arr3e(50:70,:),2),1,'omitnan')),'DisplayName','C10 mono');

%plot(depth_pmma,rescale(sum(arr1(40:80,:),'omitnan')),'-o','DisplayName','C11 mono');
%plot(depth_pmma,rescale(sum(arr2(40:80,:),'omitnan')),'-o','DisplayName','C11 achro');
%plot(depth_pmma,rescale(sum(arr3(40:80,:),'omitnan')),'-o','DisplayName','C10 mono');
hold off
xlabel('Depth in PMMA (mm)');
ylabel('Intensity (counts)');
%set(gca, 'YScale', 'log');
l = legend; set(l, 'Interpreter', 'none');
ax = gca;
ax.FontSize = 14;
ax.XLim = [0,180];

data1 = [depth_pmma',sum(arr1(50:70,:),'omitnan')',sqrt(sum(power(arr1e(50:70,:),2),1,'omitnan'))'];
data2 = [depth_pmma',sum(arr2(50:70,:),'omitnan')',sqrt(sum(power(arr2e(50:70,:),2),1,'omitnan'))'];
data3 = [depth_pmma',sum(arr3(50:70,:),'omitnan')',sqrt(sum(power(arr3e(50:70,:),2),1,'omitnan'))'];

%return;
data = [data1 data2 data3];
writematrix(data,'C11_C10_higher_energy_PMMA.xls');