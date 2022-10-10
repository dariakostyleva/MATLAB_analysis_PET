% This script build prjections (later profiles) of Carbon data along the
% beam axis
% Author: Daria K

fig_C11 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_red_image.fig');
arr_C11 = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_C10 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_red_image.fig');
arr_C10 = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_C12 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_017_red_image.fig');
arr_C12 = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_Na22 = openfig('Q:\Documents\PET\MATLAB_figures_PET\Na22\Na22_sens_0661_red_image.fig');
arr_Na22 = get(get(gca,'Children'),'CData'); % getting data from figure as an array

figure('Name','Proj Carbon 39 mm','NumberTitle','off');
%set(gca,'position',[100,300,1100,550])

xx = [-119:2:119];
yy = [-119:2:119];

verProj = sum(arr_C11, 2);
horProj_C11 = sum(arr_C11, 1);
horProj_C10 = sum(arr_C10, 1);
horProj_C12 = sum(arr_C12, 1);
horProj_Na22 = sum(arr_Na22, 1);

horProf_C11 = arr_C11(60,:);
horProf_C10 = arr_C10(60,:);
horProf_C12 = arr_C12(60,:);

subplot(2,2,1);
plot(xx,rescale(horProj_C11),'DisplayName','C11');
hold on;
plot(xx,rescale(horProj_Na22),'DisplayName','Na22');
title('Projection along beam from left to right')
xlabel('Projection (mm), FOV at 0');
ylabel('Counts');
full_horProj = findobj(gca,'Type','line');
legend;

subplot(2,2,2);
plot(yy,verProj,'DisplayName','C11');
title('Projection perpendicular to beam, beam comes into viewer')
xlabel('Projection (mm), FOV at 0');
ylabel('Counts');
legend;

subplot(2,2,3);
plot([-79.7:2:159.3],rescale(horProj_C11),'DisplayName','C11');
hold on;
plot([-79.7:2:159.3],rescale(horProj_C10),'DisplayName','C10');
hold on;
plot([-79.7:2:159.3],rescale(horProj_C12),'DisplayName','C12');
hold off;
title('Projection along beam from left to right, ~ 39 mm range of Carbons in PMMA, C10,12 achro, C11 mono modes of FRS')
xlabel('Depth in PMMA (mm)');
ylabel('Relative counts');
full_horProj = findobj(gca,'Type','line');
xticks([-20:10:120]);
xlim([-20 120]);
ylim([0 1.2]);
legend;

subplot(2,2,4);
plot([-80.7:2:158.3],rescale(horProf_C11),'DisplayName','C11');
hold on;
plot([-80.7:2:158.3],rescale(horProf_C10),'DisplayName','C10');
hold on;
plot([-80.7:2:158.3],rescale(horProf_C12),'DisplayName','C12');
hold off;
title('Profile along beam 2mm slice, ~ 39 mm range of Carbons in PMMA, C10,12 achro, C11 mono modes of FRS')
xlabel('Depth in PMMA (mm)');
ylabel('Relative counts');
full_horProj = findobj(gca,'Type','line');
xticks([-20:10:120]);
xlim([-20 120]);
ylim([0 1.2]);
legend;

