% This script build prjections (later profiles) of Oxygen data along the
% beam axis
% Author: Daria K

fig_O15le = openfig('Q:\Documents\PET\MATLAB_figures_PET\O15_008_red_image_corr.fig','invisible');
arr_O15le = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_O14le = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_016_red_image_corr.fig','invisible');
arr_O14le = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_O16le = openfig('Q:\Documents\PET\MATLAB_figures_PET\O16_015_red_image_corr.fig','invisible');
arr_O16le = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_O16le_un = openfig('Q:\Documents\PET\MATLAB_figures_PET\O16_015_red_image.fig','invisible');
arr_O16le_un = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_O15he = openfig('Q:\Documents\PET\MATLAB_figures_PET\O15_001_red_image_corr.fig','invisible');
arr_O15he = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_O14he = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_003_red_image_corr.fig','invisible');
arr_O14he = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_O16he = openfig('Q:\Documents\PET\MATLAB_figures_PET\O16_005_red_image_corr.fig','invisible');
arr_O16he = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_O16he_un = openfig('Q:\Documents\PET\MATLAB_figures_PET\O16_005_red_image.fig','invisible');
arr_O16he_un = get(get(gca,'Children'),'CData'); % getting data from figure as an array

depth_pmma_le = [-84:2:155];
depth_pmma_he = [-49:2:190];

figure;
subplot(2,1,1);
hold on
plot(depth_pmma_le,sum(arr_O15le(40:80,:))./max(sum(arr_O15le(40:80,:))),'-o','DisplayName','O15 corr');
plot(depth_pmma_le,sum(arr_O14le(40:80,:))./max(sum(arr_O14le(40:80,:))),'-o','DisplayName','O14 corr');
plot(depth_pmma_le,sum(arr_O16le(40:80,:))./max(sum(arr_O16le(40:80,:))),'-o','DisplayName','O16 corr');
plot(depth_pmma_le,sum(arr_O16le_un(40:80,:))./max(sum(arr_O16le_un(40:80,:))),'-o','DisplayName','O16 uncorr');
hold off;
legend;

subplot(2,1,2);
hold on
plot(depth_pmma_he,sum(arr_O15he(40:80,:))./max(sum(arr_O15he(40:80,:))),'-o','DisplayName','O15 corr');
plot(depth_pmma_he,sum(arr_O14he(40:80,:))./max(sum(arr_O14he(40:80,:))),'-o','DisplayName','O14 corr');
plot(depth_pmma_he,sum(arr_O16he(40:80,:))./max(sum(arr_O16he(40:80,:))),'-o','DisplayName','O16 corr');
plot(depth_pmma_he,sum(arr_O16he_un(40:80,:))./max(sum(arr_O16he_un(40:80,:))),'-o','DisplayName','O16 uncorr');
hold off;
legend;



return;
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
plot([-84:2:155],rescale(horProj_O15),'DisplayName','O15');
hold on;
plot([-84:2:155],rescale(horProj_O14),'DisplayName','O14');
hold on;
plot([-84:2:155],rescale(horProj_O16),'DisplayName','O16');
hold off;
title('Projection along beam from left to right, ~ 39 mm range of Oxygens in PMMA, achromatic mode of FRS')
xlabel('Depth in PMMA (mm)');
ylabel('Relative counts');
full_horProj = findobj(gca,'Type','line');
xticks([-20:10:220]);
xlim([-20 120]);
ylim([0 1.2]);
legend;

subplot(2,2,4);
plot([-84:2:155],rescale(horProf_O15),'DisplayName','O15');
hold on;
plot([-84:2:155],rescale(horProf_O14),'DisplayName','O14');
hold on;
plot([-84:2:155],rescale(horProf_O16),'DisplayName','O16');
hold off;
title('Profile along beam, slice 2 mm in center, ~ 39 mm range of Oxygens in PMMA, achromatic mode of FRS')
xlabel('Depth in PMMA (mm)');
ylabel('Relative counts');
xticks([-20:10:220]);
xlim([-20 120]);
ylim([0 1.2]);
legend;



