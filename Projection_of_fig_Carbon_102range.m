% This script build prjections (later profiles) of Carbon data along the
% beam axis
% Author: Daria K

fig_C11 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_red_image.fig');
arr_C11 = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_C10 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_002_red_image.fig');
arr_C10 = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_C12 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_red_image.fig');
arr_C12 = get(get(gca,'Children'),'CData'); % getting data from figure as an array

figure('Name','Proj Carbon 102 mm','NumberTitle','off');
%set(gca,'position',[100,300,1100,550])

xx = [-119:2:119];
yy = [-119:2:119];

verProj = sum(arr_C11, 2);
horProj_C11 = sum(arr_C11, 1);
horProj_C10 = sum(arr_C10, 1);
horProj_C12 = sum(arr_C12, 1);

horProf_C11 = arr_C11(60,:);
horProf_C10 = arr_C10(60,:);
horProf_C12 = arr_C12(60,:);

subplot(2,2,1);
plot(xx,horProj_C11,'DisplayName','C11');
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
plot([-16.42:2:222.58],rescale(horProj_C11),'DisplayName','C11');
hold on;
plot([-16.42:2:222.58],rescale(horProj_C10),'DisplayName','C10');
hold on;
plot([-49:2:190],rescale(horProj_C12),'DisplayName','C12');
hold off;
title('Projection along beam from left to right, ~ 102 mm range of Carbons in PMMA, achromatic mode of FRS')
xlabel('Depth in PMMA (mm)');
ylabel('Relative counts');
%full_horProj = findobj(gca,'Type','line');
xticks([-20:10:220]);
xlim([0 140]);
ylim([0 1.2]);
legend;

subplot(2,2,4);
plot([-16.4:2:222.6],rescale(horProf_C11),'DisplayName','C11');
hold on;
plot([-16.4:2:222.6],rescale(horProf_C10),'DisplayName','C10');
hold on;
plot([-49:2:190],rescale(horProf_C12),'DisplayName','C12');
hold off;
title('Profile along beam 2mm slice, ~ 102 mm range of Carbons in PMMA, achromatic mode of FRS')
xlabel('Depth in PMMA (mm)');
ylabel('Relative counts');
%full_horProj = findobj(gca,'Type','line');
xticks([-20:10:220]);
xlim([0 140]);
ylim([0 1.2]);
legend;

