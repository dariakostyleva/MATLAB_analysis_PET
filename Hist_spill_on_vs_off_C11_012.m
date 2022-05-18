
fig_C11_off4 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_4c_corr.fig','invisible');
arr_C11_off4 = get(get(gca,'Children'),'CData'); 
fig_C11_on4 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spillon_image_4c_corr.fig','invisible');
arr_C11_on4 = get(get(gca,'Children'),'CData');
fig_C11_off3 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_3c_corr.fig','invisible');
arr_C11_off3 = get(get(gca,'Children'),'CData'); 
fig_C11_on3 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spillon_image_3c_corr.fig','invisible');
arr_C11_on3 = get(get(gca,'Children'),'CData');
fig_C11_off7 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_7c_corr.fig','invisible');
arr_C11_off7 = get(get(gca,'Children'),'CData'); 
fig_C11_on7 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spillon_image_7c_corr.fig','invisible');
arr_C11_on7 = get(get(gca,'Children'),'CData');

range = [-119:2:119];
depth_pmma = [-79.7:2:159.3];
figure('Name','Sciles of spill on/off images of same file','NumberTitle','off');
subplot(3,2,1);
hold on;
%plot(range,rescale(sum(arr_C11(50:70,:))),'DisplayName','C11 uncorrected, central slice 40 mm, ALL');
plot(depth_pmma,rescale(sum(arr_C11_on4(50:70,:),'omitnan')),'DisplayName','C11_012 corr, spill ON, 4 cycle');
plot(depth_pmma,rescale(sum(arr_C11_off4(50:70,:),'omitnan')),'DisplayName','C11_012 corr, spill OFF, 4 cycle');
hold off;
set(gca, 'YScale', 'log');
xlabel('X (mm)');
ylabel('Intensity (a.u.)');
l = legend; set(l, 'Interpreter', 'none');

subplot(3,2,2);
plot(depth_pmma,sum(arr_C11_on4(50:70,:),'omitnan')./sum(arr_C11_off4(50:70,:),'omitnan'),'DisplayName','C11_012 corr,  spill ON/ spill OFF, 4 cycle');

subplot(3,2,3);
hold on;
%plot(range,rescale(sum(arr_C11(50:70,:))),'DisplayName','C11 uncorrected, central slice 40 mm, ALL');
plot(depth_pmma,rescale(sum(arr_C11_on3(50:70,:),'omitnan')),'DisplayName','C11_012 corr, spill ON, 3 cycle');
plot(depth_pmma,rescale(sum(arr_C11_off3(50:70,:),'omitnan')),'DisplayName','C11_012 corr, spill OFF, 3 cycle');
hold off;
set(gca, 'YScale', 'log');
xlabel('X (mm)');
ylabel('Intensity (a.u.)');
l = legend; set(l, 'Interpreter', 'none');

subplot(3,2,4);
plot(depth_pmma,sum(arr_C11_on3(50:70,:),'omitnan')./sum(arr_C11_off3(50:70,:),'omitnan'),'DisplayName','C11_012 corr,  spill ON/ spill OFF, 3 cycle');

subplot(3,2,5);
hold on;
%plot(range,rescale(sum(arr_C11(50:70,:))),'DisplayName','C11 uncorrected, central slice 40 mm, ALL');
plot(depth_pmma,rescale(sum(arr_C11_on7(50:70,:),'omitnan')),'DisplayName','C11_012 corr, spill ON, 7 cycle');
plot(depth_pmma,rescale(sum(arr_C11_off7(50:70,:),'omitnan')),'DisplayName','C11_012 corr, spill OFF, 7 cycle');
hold off;
set(gca, 'YScale', 'log');
xlabel('X (mm)');
ylabel('Intensity (a.u.)');
l = legend; set(l, 'Interpreter', 'none');

subplot(3,2,6);
plot(depth_pmma,sum(arr_C11_on7(50:70,:),'omitnan')./sum(arr_C11_off7(50:70,:),'omitnan'),'DisplayName','C11_012 corr,  spill ON/ spill OFF, 7 cycle');
