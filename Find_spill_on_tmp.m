% find spill on vs spill off events
% tot=load('D:\PET_data_feb_2021\C11_012_red.mat');
% off=load('D:\PET_data_feb_2021\C11_012_red_spilloff.mat');
% on=load('D:\PET_data_feb_2021\C11_012_red_spillon.mat');
% 
% events_tot=tot.z; 
% events_off=off.events_spilloff; 
% events_on=on.events_spillon; 
% disp('percentage of spill-off events = ')
% length(events_off)/length(events_tot)*100
% disp('percentage of spill-on events = ')
% length(events_on)/length(events_tot)*100
% 
% fig_C11_off = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_red_spilloff_image_corr.fig','invisible');
% arr_C11_off = get(get(gca,'Children'),'CData'); 
% fig_C11_on = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_red_spillon_image_corr.fig','invisible');
% arr_C11_on = get(get(gca,'Children'),'CData');
% fig_C11 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_red_image_corr.fig','invisible');
% arr_C11 = get(get(gca,'Children'),'CData');

fig_C11_off = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_red_spilloff_image.fig','invisible');
arr_C11_off = get(get(gca,'Children'),'CData'); 
fig_C11_on = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_red_spillon_image.fig','invisible');
arr_C11_on = get(get(gca,'Children'),'CData');



range = [-119:2:119];


figure('Name','Sciles of spill on/off images of same file','NumberTitle','off');
title('Comparison of spill on/off slices along beam C11_007');
subplot(2,2,1);
hold on;
%plot(range,sum(arr_C11(50:70,:),'omitnan'),'DisplayName','C11 uncorr, central slice 40 mm, ALL');
plot(range,sum(arr_C11_on(50:70,:),'omitnan'),'DisplayName','C11 uncorr, central slice 40 mm, spill ON');
plot(range,sum(arr_C11_off(50:70,:),'omitnan'),'DisplayName','C11 uncorr, central slice 40 mm, spill OFF');
hold off;
set(gca, 'YScale', 'log');
xlabel('X (mm)');
ylabel('Intensity (a.u.)');
legend;

subplot(2,2,2);
hold on;
%plot(range,rescale(sum(arr_C11(50:70,:))),'DisplayName','C11 uncorrected, central slice 40 mm, ALL');
plot(range,rescale(sum(arr_C11_on(50:70,:),'omitnan')),'DisplayName','C11 uncorr, central slice 40 mm, spill ON');
plot(range,rescale(sum(arr_C11_off(50:70,:),'omitnan')),'DisplayName','C11 uncorr, central slice 40 mm, spill OFF');
hold off;
set(gca, 'YScale', 'log');
xlabel('X (mm)');
ylabel('Intensity (a.u.)');
legend;

% subplot(2,2,3);
% hold on;
% plot(range,sum(arr_C11_on(50:70,:),'omitnan')./sum(arr_C11(50:70,:),'omitnan'),'DisplayName','C11 uncorr, ratio spill on/all');
% plot(range,sum(arr_C11_off(50:70,:),'omitnan')./sum(arr_C11(50:70,:),'omitnan'),'DisplayName','C11 uncorr, ratio spill off/all');
% plot(range,sum(arr_C11_on(50:70,:),'omitnan')./sum(arr_C11_off(50:70,:),'omitnan'),'DisplayName','unC11 corr, ratio spill on/off');
% %plot(range,sum(arr_C11_off(50:70,:)),'DisplayName','C11 uncorrected, central slice 40 mm, spill OFF');
% hold off;
% set(gca, 'YScale', 'log');
% xlabel('X (mm)');
% ylabel('Intensity (a.u.)');
% legend;
