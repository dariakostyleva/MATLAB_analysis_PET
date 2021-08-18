% This script build prjections (later profiles) of Oxygen data along the
% beam axis
% Author: Daria K

fig_O15 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O15_001_red_image.fig');
arr_O15 = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_O14 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_red_image.fig');
arr_O14 = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_O16 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O16_005_red_image.fig');
arr_O16 = get(get(gca,'Children'),'CData'); % getting data from figure as an array

figure('Name','Proj Oxygen 102 mm','NumberTitle','off');
%set(gca,'position',[100,300,1100,550])

xx = [-119:2:119];
yy = [-119:2:119];

verProj = sum(arr_O15, 2);
horProj_O15 = sum(arr_O15, 1);
horProj_O14 = sum(arr_O14, 1);
horProj_O16 = sum(arr_O16, 1);

horProf_O15 = arr_O15(60,:);
horProf_O14 = arr_O14(60,:);
horProf_O16 = arr_O16(60,:);

subplot(2,2,1);
plot(xx,horProj_O15,'DisplayName','O15');
title('Projection along beam from left to right')
xlabel('Projection (mm), FOV at 0');
ylabel('Counts');
full_horProj = findobj(gca,'Type','line');
legend;

subplot(2,2,2);
plot(yy,verProj,'DisplayName','O15');
title('Projection perpendicular to beam, beam comes into viewer')
xlabel('Projection (mm), FOV at 0');
ylabel('Counts');
legend;

subplot(2,2,3);
plot([-49:2:190],rescale(horProj_O15),'DisplayName','O15');
hold on;
plot([-49:2:190],rescale(horProj_O14),'DisplayName','O14');
hold on;
plot([-49:2:190],rescale(horProj_O16),'DisplayName','O16');
hold off;
title('Projection along beam from left to right, ~ 102 mm range of Oxygens in PMMA, achromatic mode of FRS')
xlabel('Depth in PMMA (mm)');
ylabel('Relative counts');
full_horProj = findobj(gca,'Type','line');
xticks([-20:10:220]);
xlim([0 140]);
ylim([0 1.2]);
legend;

subplot(2,2,4);
plot([-49:2:190],rescale(horProf_O15),'DisplayName','O15');
hold on;
plot([-49:2:190],rescale(horProf_O14),'DisplayName','O14');
hold on;
plot([-49:2:190],rescale(horProf_O16),'DisplayName','O16');
hold off;
title('Profile along beam, slice 2 mm in center, ~ 102 mm range of Oxygens in PMMA, achromatic mode of FRS')
xlabel('Depth in PMMA (mm)');
ylabel('Relative counts');
xticks([-20:10:220]);
xlim([0 140]);
ylim([0 1.2]);
legend;



