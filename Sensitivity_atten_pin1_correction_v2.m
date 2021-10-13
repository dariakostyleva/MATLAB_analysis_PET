% This script performs sensitivity AND attenuation correction based on 2 mm binned data
% and 5 files in parallel( PMMA on pin 1) using interpolation
% Author: Daria K.

% source data parallel
fig_17 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0017_red_image.fig','invisible');
image_17 = get(get(gca,'Children'),'CData');
fig_18 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0018_red_image.fig','invisible');
image_18 = get(get(gca,'Children'),'CData');
fig_19 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0019_red_image.fig','invisible');
image_19 = get(get(gca,'Children'),'CData');
fig_20 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0020_red_image.fig','invisible');
image_20 = get(get(gca,'Children'),'CData');
fig_21 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0021_red_image.fig','invisible');
image_21 = get(get(gca,'Children'),'CData');

% source data perpendicular
fig_41 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0041_red_image.fig','invisible');
image_41 = get(get(gca,'Children'),'CData');
fig_42 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0042_red_image.fig','invisible');
image_42 = get(get(gca,'Children'),'CData');
fig_43 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0043_red_image.fig','invisible');
image_43 = get(get(gca,'Children'),'CData');
fig_44 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0044_red_image.fig','invisible');
image_44 = get(get(gca,'Children'),'CData');
fig_45 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0045_red_image.fig','invisible');
image_45 = get(get(gca,'Children'),'CData');
%%% or 
fig_57 = openfig('Q:\Documents\PET\MATLAB_figures_PET\68ge_calib057_red_image.fig','invisible');
image_57 = get(get(gca,'Children'),'CData');
fig_58 = openfig('Q:\Documents\PET\MATLAB_figures_PET\68ge_calib058_red_image','invisible');
image_58 = get(get(gca,'Children'),'CData');
fig_59 = openfig('Q:\Documents\PET\MATLAB_figures_PET\68ge_calib059_red_image','invisible');
image_59 = get(get(gca,'Children'),'CData');
fig_60 = openfig('Q:\Documents\PET\MATLAB_figures_PET\68ge_calib060_red_image.fig','invisible');
image_60 = get(get(gca,'Children'),'CData');
fig_61 = openfig('Q:\Documents\PET\MATLAB_figures_PET\68ge_calib061_red_image.fig','invisible');
image_61 = get(get(gca,'Children'),'CData');

% beam data with PMMA position on pin 2
fig_O15 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O15_008_red_image.fig');
image_O15 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_O14 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_016_red_image.fig');
image_O14 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_O16 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O16_015_red_image.fig');
image_O16 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
time_fileO15 = 1200.046;
time_fileO14 = 2343.966;
time_fileO16 = 1800.01;

%%%%%%       Slice of 2 mm of the source placed parallel to beam       %%%%%%%%
proj_file17 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0017_red_proj_2mm.txt');
proj_file18 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0018_red_proj_2mm.txt');
proj_file19 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0019_red_proj_2mm.txt');
proj_file20 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0020_red_proj_2mm.txt');
proj_file21 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0021_red_proj_2mm.txt');
time_file17 = 125.189;
time_file18 = 151.936;
time_file19 = 192.209;
time_file20 = 152.49;
time_file21 = 196.76;
%%%%%%      Slice of 2 mm of the source placed perdendic to beam       %%%%%%%%
proj_file41 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0041_red_proj_2mm.txt');
proj_file42 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0042_red_proj_2mm.txt');
proj_file43 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0043_red_proj_2mm.txt');
proj_file44 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0044_red_proj_2mm.txt');
proj_file45 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0045_red_proj_2mm.txt');
time_file41 = 200.949;
time_file42 = 235.727;
time_file43 = 316.095;
time_file44 = 232.427;
time_file45 = 286.423;
                             %%%% or %%%%%
proj_file57 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\68ge_calib057_red_proj_2mm.txt');
proj_file58 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\68ge_calib058_red_proj_2mm.txt');
proj_file59 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\68ge_calib059_red_proj_2mm.txt');
proj_file60 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\68ge_calib060_red_proj_2mm.txt');
proj_file61 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\68ge_calib061_red_proj_2mm.txt'); 
time_file57 = 195.336;
time_file58 = 156.814;
time_file59 = 137.295;
time_file60 = 160.05;
time_file61 = 216.034;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

proj_col_17 = sum(image_17, 1); % projection on beam axis with sum over columns
proj_col_18 = sum(image_18, 1);
proj_col_19 = sum(image_19, 1);
proj_col_20 = sum(image_20, 1);
proj_col_21 = sum(image_21, 1);

proj_col_41 = sum(image_41, 2); % projection on beam axis with sum over columns
proj_col_42 = sum(image_42, 2);
proj_col_43 = sum(image_43, 2);
proj_col_44 = sum(image_44, 2);
proj_col_45 = sum(image_45, 2);

proj_col_57 = sum(image_41, 2); % projection on beam axis with sum over columns
proj_col_58 = sum(image_42, 2);
proj_col_59 = sum(image_43, 2);
proj_col_60 = sum(image_44, 2);
proj_col_61 = sum(image_45, 2);

figure('Name','Sources placed perp and parall','NumberTitle','off');
subplot(3,2,1);
title('Projections, June data');
hold on;
plot(proj_col_17,'DisplayName','Source is 0.0 cm, file 17');
plot(proj_col_18,'DisplayName','Source is +2.5 cm, file 18');
plot(proj_col_19,'DisplayName','Source is +5.0 cm, file 19');
plot(proj_col_20,'DisplayName','Source is -2.5 cm, file 20');
plot(proj_col_21,'DisplayName','Source is -5.0 cm, file 21');
hold off;
xlabel('Number of bins');
ylabel('Counts per 2 mm bin');
xticks([0:10:120]);
legend;

subplot(3,2,2);
title('Slices of 2 mm, June data');
hold on;
plot(proj_file17,'DisplayName','Source is 0.0 cm, file 17');
plot(proj_file18,'DisplayName','Source is +2.5 cm, file 18');
plot(proj_file19,'DisplayName','Source is +5.0 cm, file 19');
plot(proj_file20,'DisplayName','Source is -2.5 cm, file 20');
plot(proj_file21,'DisplayName','Source is -5.0 cm, file 21');
hold off;
xlabel('Number of bins');
ylabel('Counts per 2 mm bin');
xticks([0:10:120]);
legend;

subplot(3,2,3);
title('Projections, June data');
hold on;
plot(proj_col_41,'DisplayName','Source is 0.0 cm, file 41');
plot(proj_col_42,'DisplayName','Source is +2.5 cm, file 42');
plot(proj_col_43,'DisplayName','Source is +5.0 cm, file 43');
plot(proj_col_44,'DisplayName','Source is -2.5 cm, file 44');
plot(proj_col_45,'DisplayName','Source is -5.0 cm, file 45');
hold off;
xlabel('Number of bins');
ylabel('Counts per 2 mm bin');
xticks([0:10:120]);
legend;

subplot(3,2,4);
title('Slices of 2 mm, June data');
hold on;
plot(proj_file41,'DisplayName','Source is 0.0 cm, file 41');
plot(proj_file42,'DisplayName','Source is +2.5 cm, file 42');
plot(proj_file43,'DisplayName','Source is +5.0 cm, file 43');
plot(proj_file44,'DisplayName','Source is -2.5 cm, file 44');
plot(proj_file45,'DisplayName','Source is -5.0 cm, file 45');
hold off;
xlabel('Number of bins');
ylabel('Counts per 2 mm bin');
xticks([0:10:120]);
legend;

subplot(3,2,5);
title('Projections, February data');
hold on;
plot(proj_col_57,'DisplayName','Source is 0.0 cm, file 57');
plot(proj_col_58,'DisplayName','Source is +2.5 cm, file 58');
plot(proj_col_59,'DisplayName','Source is +5.0 cm, file 59');
plot(proj_col_60,'DisplayName','Source is -2.5 cm, file 60');
plot(proj_col_61,'DisplayName','Source is -5.0 cm, file 61');
hold off;
xlabel('Number of bins');
ylabel('Counts per 2 mm bin');
xticks([0:10:120]);
legend;

subplot(3,2,6);
title('Slices of 2 mm, February data');
hold on;
plot(proj_file57,'DisplayName','Source is 0.0 cm, file 57');
plot(proj_file58,'DisplayName','Source is +2.5 cm, file 58');
plot(proj_file59,'DisplayName','Source is +5.0 cm, file 59');
plot(proj_file60,'DisplayName','Source is -2.5 cm, file 60');
plot(proj_file61,'DisplayName','Source is -5.0 cm, file 61');
hold off;
xlabel('Number of bins');
ylabel('Counts per 2 mm bin');
xticks([0:10:120]);
legend;

%%% 68Ge line source %%% 
% values are calculated from nominal activity of 46.22 MBq
source_activ_Feb = 12.8; % MBq i.e. decays/sec on 26.02.2021
source_activ_Jun = 9.5; % MBq i.e. decays/sec 24.06.2021
source_length = 310/2; % mm length over bin width 
source_activ_Feb_rand = 12.8/source_length; % MBq/2mm i.e. activity per unit length
source_activ_Jun_rand = 9.5/source_length; % MBq/2mm i.e. activity per unit length

% scale in respect with source activity
% for this I need to go from counts to counts/sec in all projections
% so I divide by the file timelength first and source activity, result is
% in cps/MBq/2mm
combined_parall(1,:) = proj_file19/time_file19./source_activ_Jun_rand;
combined_parall(2,:) = proj_file18/time_file18./source_activ_Jun_rand;
combined_parall(3,:) = proj_file17/time_file17./source_activ_Jun_rand;
combined_parall(4,:) = proj_file20/time_file20./source_activ_Jun_rand;
combined_parall(5,:) = proj_file21/time_file21./source_activ_Jun_rand; 

% combined_perpendic(:,1) = proj_file43/time_file43./source_activ_Jun_rand;
% combined_perpendic(:,2) = proj_file42/time_file42./source_activ_Jun_rand;
% combined_perpendic(:,3) = proj_file41/time_file41./source_activ_Jun_rand;
% combined_perpendic(:,4) = proj_file44/time_file44./source_activ_Jun_rand;
% combined_perpendic(:,5) = proj_file45/time_file45./source_activ_Jun_rand;

combined_perpendic(:,1) = proj_file61/time_file61./source_activ_Feb_rand;
combined_perpendic(:,2) = proj_file60/time_file60./source_activ_Feb_rand;
combined_perpendic(:,3) = proj_file59/time_file59./source_activ_Feb_rand;
combined_perpendic(:,4) = proj_file58/time_file58./source_activ_Feb_rand;
combined_perpendic(:,5) = proj_file57/time_file57./source_activ_Feb_rand;

xs1 = [-50, -25, 0, 25, 50];
[Xs1,Ys1] = meshgrid([-119:2:119],xs1);
[Xq1,Yq1] = ndgrid(linspace(-119,119,120));
combined_parall_int = interp2(Xs1,Ys1,combined_parall,Xq1,Yq1); 
% extrapolation outside the range
[Xs2,Ys2] = ndgrid(xs1,linspace(-119,119,120)); %for gridded interpolant
[Xq2,Yq2] = ndgrid(linspace(-119,119,120));
F2 = griddedInterpolant(Xs2,Ys2,combined_parall,'linear','linear');
combined_parall_int_ext = F2(Xq2,Yq2); 

%comb_merged_no_int = combined_perpendic*combined_parall; % (cps/MBq)^2
% filename = char('Sensitivity_corr_atten_pin1_matrix.txt');
% writematrix(comb_merged_no_int,filename);

figure('Name','Sensitivity maps NO interpolation');
subplot(2,2,1);
surf(combined_parall_int_ext);
xlabel('X (mm)');
ylabel('Y (mm)');
zlabel('Absolute sensitivity squared (cps/MBq)^2 per 2 mm^2 bin');
title('Array constructed from parallel source placements and interpolated within pm50 mm and extr outside');
subplot(2,2,2);
surf(combined_perpendic);
xlabel('X (mm)');
ylabel('Y (mm)');
zlabel('Absolute sensitivity (cps/MBq) per 2 mm bin');
title('Array constructed from perpendicular source placements');
subplot(2,2,3);
surf(combined_parall);
xlabel('X (mm)');
ylabel('Y (mm)');
zlabel('Absolute sensitivity (cps/MBq) per 2 mm bin');
title('Array constructed from parallel source placements');

image_O16 = image_O16/time_fileO16; % cps
image_O15 = image_O15/time_fileO15;
image_O14 = image_O14/time_fileO14;

xx = [-119:2:119];
yy = [-119:2:119];

% %%% NOTE: my corrected image has units 10^6 MBq per 2mm bin
% %%% so for convenience I scale it to Bq by factor 10^12
factor = 10^12; % from 10^6 MBq to Bq

figure;
imagesc(xx,yy,combined_parall_int_ext);

figure('Name','Oxygen images with sensitivity maps NO interpolation','NumberTitle','off');
subplot(3,2,1);
corr_img = imagesc(xx,yy,image_O16./combined_parall_int_ext);
title('Corrected image of O16, file 5');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
set(gca,'ColorScale','log');
colorbar;
a = colorbar;
ylabel(a,'Activity (Bq) per 2 mm bin','FontSize',10.45,'Rotation',270);

subplot(3,2,2);
hold on;
plot(xx,rescale(image_O16(61,:)),'DisplayName','Slice of uncorrected 16O image, file 14');
plot(xx,rescale(image_O16(61,:)./combined_parall_int_ext(61,:)),'DisplayName','Slice of corrected 16O image, file 14');
% file with image_O16 has length of 1800.01 seconds 
hold off;
xlabel('X (mm)');
ylabel('Normalized counts (a.u.)');
legend;

subplot(3,2,3);
corr_img = imagesc(xx,yy,image_O15./combined_parall_int_ext);
title('Corrected image of O15, file 1');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
set(gca,'ColorScale','log');
colorbar;
a = colorbar;
ylabel(a,'Activity (Bq) per 2 mm bin','FontSize',10.45,'Rotation',270);

subplot(3,2,4);
hold on;
plot(xx,rescale(image_O15(61,:)),'DisplayName','Slice of uncorrected 15O image, file 8');
plot(xx,rescale(image_O15(61,:)./combined_parall_int_ext(61,:)),'DisplayName','Slice of corrected 15O image, file 8');
hold off;
xlabel('X (mm)');
ylabel('Normalized counts (a.u.)');
legend;

subplot(3,2,5);
corr_img = imagesc(xx,yy,image_O14./combined_parall_int_ext);
title('Corrected image of O14, file 3');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
set(gca,'ColorScale','log');
colorbar;
a = colorbar;
ylabel(a,'Activity (Bq) per 2 mm bin','FontSize',10.45,'Rotation',270);

subplot(3,2,6);
hold on;
plot(xx,rescale(image_O14(61,:)),'DisplayName','Slice of uncorrected 14O image, file 16');
plot(xx,rescale(image_O14(61,:)./combined_parall_int_ext(61,:)),'DisplayName','Slice of corrected 14O image, file 16');
% file with image_O16 has length of 1800.01 seconds 
hold off;
xlabel('X (mm)');
ylabel('Normalized counts (a.u.)');
legend;

