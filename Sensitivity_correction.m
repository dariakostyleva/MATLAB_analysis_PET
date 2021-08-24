% This script performs sensitivity correction. 
% Author: Daria K.

fig_7 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_007_red_image.fig');
image_7 = get(get(gca,'Children'),'CData');
fig_8 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_008_red_image.fig');
image_8 = get(get(gca,'Children'),'CData');
fig_9 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_009_red_image.fig');
image_9 = get(get(gca,'Children'),'CData');
fig_10 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0010_red_image.fig');
image_10 = get(get(gca,'Children'),'CData');
fig_11 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0011_red_image.fig');
image_11 = get(get(gca,'Children'),'CData');

proj_col_7 = sum(image_7, 1); % projection on beam axis with sum over columns
proj_col_8 = sum(image_8, 1);
proj_col_9 = sum(image_9, 1);
proj_col_10 = sum(image_10, 1);
proj_col_11 = sum(image_11, 1);

figure('Name','Projections ','NumberTitle','off');
subplot(2,2,1);
hold on;
plot(proj_col_7,'DisplayName','Source is 0.0 cm');
plot(proj_col_8,'DisplayName','Source is +2.5 cm');
plot(proj_col_9,'DisplayName','Source is +5.0 cm');
plot(proj_col_10,'DisplayName','Source is -2.5 cm');
plot(proj_col_11,'DisplayName','Source is -5.0 cm');
hold off;
xlabel('Number of bins');
ylabel('Counts');
xticks([0:10:120]);
legend;

subplot(2,2,2);
proj_col_7 = proj_col_7/max(proj_col_7); % projection on beam axis with sum over columns
proj_col_8 = proj_col_8/max(proj_col_8);
proj_col_9 = proj_col_9/max(proj_col_9);
proj_col_10 = proj_col_10/max(proj_col_10);
proj_col_11 = proj_col_11/max(proj_col_11);
hold on;
plot(proj_col_7,'DisplayName','Source is 0.0 cm');
plot(proj_col_8,'DisplayName','Source is +2.5 cm');
plot(proj_col_9,'DisplayName','Source is +5.0 cm');
plot(proj_col_10,'DisplayName','Source is -2.5 cm');
plot(proj_col_11,'DisplayName','Source is -5.0 cm');
hold off;
xlabel('Number of bins');
ylabel('Counts');
xticks([0:10:120]);
legend;

proj_7_txt = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_007_red_proj.txt');
% ratio between number of counts to the maximum number of counts, so that
% "big" numbers in the center remiain almost the same and small numbers on
% the edges grow up.
% however, we have bumps which should be accounted for?
proj_7 = proj_7_txt/max(proj_7_txt); 
proj_7 = smooth(proj_7);
sens_2d = ones(52,52).*proj_7;
sens_2d_1 = sens_2d.*sens_2d'; % element by element multiplication of matrix by its transposed version
[Xq,Yq] = meshgrid([linspace(1,52,120)]); %creates square coordinate grid (with 120 elements from 1 to 52)
sens_2d_2 = interp2([1:1:52],[1:1:52],sens_2d_1,Xq,Yq);

subplot(2,2,3);
corr_img = imagesc(image_7./sens_2d_2);

subplot(2,2,4);
corr_proj = sum(image_7./sens_2d_2, 1);
xx = [-119:2:119];
plot(xx,corr_proj);
%histogram(horProj)
%plot(horProj)
xlabel('X (mm)');
ylabel('Counts');
set(gca,'ColorScale','log');
title('Corrected image')

% Uniformity = importdata('Q:\Documents\PET\MATLAB_analysis_PET\UniformityNoSpikeAverage.txt');
% Uniformity = Uniformity/max(Uniformity);
% Uniformity2D = ones(52,52).*Uniformity;
% Uniformity2D = Uniformity2D.*Uniformity2D';
% [Xq,Yq] = meshgrid([linspace(1,52,208)]);
% Uniformity2D = interp2([1:1:52],[1:1:52],Uniformity2D,Xq,Yq);
% recon = recon./Uniformity2D;

