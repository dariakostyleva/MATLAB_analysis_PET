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
fig_O16 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O16_015_red_image.fig');
image_O16 = get(get(gca,'Children'),'CData'); % getting data from figure as an array

proj_col_7 = sum(image_7, 1); % projection on beam axis with sum over columns
proj_col_8 = sum(image_8, 1);
proj_col_9 = sum(image_9, 1);
proj_col_10 = sum(image_10, 1);
proj_col_11 = sum(image_11, 1);

figure('Name','Projections','NumberTitle','off');
subplot(2,1,1);
hold on;
plot(proj_col_7,'DisplayName','Source is 0.0 cm');
plot(proj_col_8,'DisplayName','Source is +2.5 cm');
plot(proj_col_9,'DisplayName','Source is +5.0 cm');
plot(proj_col_10,'DisplayName','Source is -2.5 cm');
plot(proj_col_11,'DisplayName','Source is -5.0 cm');
hold off;
xlabel('Number of bins');
ylabel('Counts per 2 mm bin');
xticks([0:10:120]);
legend;

subplot(2,1,2);
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
ylabel('Counts per 2 mm bin');
xticks([0:10:120]);
legend;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% i) Building 2d matrix based on one file %%%%%%%% 

figure('Name','Correction','NumberTitle','off');
proj_file007 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_007_red_proj.txt');
% ratio between number of counts to the maximum number of counts, so that
% "big" numbers in the center remiain almost the same and small numbers on
% the edges grow up.
% however, we have bumps which should be accounted for?
proj_scaled = proj_file007/max(proj_file007); 
proj = smooth(proj_scaled);
map_2d = ones(56,56).*proj;
map_2d = map_2d.*map_2d'; % element by element multiplication of matrix by its transposed version
[Xq,Yq] = meshgrid([linspace(1,56,120)]); %creates square coordinate grid (with 120 elements from 1 to 56)
map_2d_interp_smooth = interp2([1:1:56],[1:1:56],map_2d,Xq,Yq);

proj = proj_scaled;
map_2d = ones(56,56).*proj;
map_2d = map_2d.*map_2d'; % element by element multiplication of matrix by its transposed version
[Xq,Yq] = meshgrid([linspace(1,56,120)]); %creates square coordinate grid (with 120 elements from 1 to 56)
map_2d_interp= interp2([1:1:56],[1:1:56],map_2d,Xq,Yq);

xx = [-119:2:119];
yy = [-119:2:119];

subplot(2,2,1);
orig_img = imagesc(xx,yy,image_7);
title('Uncorrected image');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
%set(gca,'ColorScale','log');

subplot(2,2,2);
corr_img = imagesc(xx,yy,image_7./map_2d_interp_smooth);
title('Corrected image with smooth');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
%set(gca,'ColorScale','log');

subplot(2,2,3);
corr_img = imagesc(xx,yy,image_7./map_2d_interp);
title('Corrected image no smooth');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
%set(gca,'ColorScale','log');

subplot(2,2,4);
corr_proj = sum(image_7./map_2d_interp_smooth, 1);
xx = [-119:2:119];
plot(xx,rescale(corr_proj),'DisplayName','Proj of corrected image, smooth with span 5');
hold on;
plot(xx,rescale(sum(image_7, 1)),'DisplayName','Proj of uncorrected image');
plot(xx,rescale(sum(image_7./map_2d_interp, 1)),'DisplayName','Proj of corrected image, no smooth');
hold off;
xlabel('X (mm)');
ylabel('Counts');
set(gca,'ColorScale','log');
legend;
%%%%%%                                            %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% ii) Building 2d matrix based on five files %%%%%%%% 
%%%%%%           Source placed HORIZONTALLY       %%%%%%%%
proj_file007 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_007_red_proj.txt');
proj_file008 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_008_red_proj.txt');
proj_file009 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_009_red_proj.txt');
proj_file0010 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0010_red_proj.txt');
proj_file0011 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0011_red_proj.txt');

% combining files into array
combined = zeros(5, 56); 
combined(1,:) = proj_file009;
combined(2,:) = proj_file008;
combined(3,:) = proj_file007;
combined(4,:) = proj_file0010;
combined(5,:) = proj_file0011;
% scale in respect with maximum number of counts in center FOV
comb_scaled = combined/max(proj_file007); 

figure('Name','Interpolation methods','NumberTitle','off');
subplot(2,3,1);
surf(comb_scaled);
title('Projections from 5 files scaled to max number of counts');
subplot(2,3,4);
ribbon(combined);
subplot(2,3,5);
ribbon(image_9);

% x coordinates of sampling points, values in mm
xs1 = [62, 87, 112, 137, 162];
% middle point is the reference, it is bin 28, thus 28*4=112 mm
% files were taken with 25 mm step, thus 112+25=137 mm, 137+25=162 mm
% and 112-25=87 mm and 62 mm, correspondingly

% y coordinates of sampling points, values in mm
[Xs1,Ys1] = ndgrid(xs1,4:4:224);
% we have 56 bins each 4 mm, thus total FOV is 224 mm

% grid for coordinates of query points
[Xq1,Yq1] = ndgrid(4:4:224);

% linear interpolation of 5x56 array into 56x56 array, plus linear
% extrapolation outside the range
F1 = griddedInterpolant(Xs1,Ys1,comb_scaled,'linear','linear');
comb_scaled = F1(Xq1,Yq1);

comb_map_2d = comb_scaled.*comb_scaled'; % element by element multiplication of matrix by its transposed version

% linear interpolation of 56x56 array into 120x120 array with final pixelation
[Xs2,Ys2] = ndgrid(1:1:56);
[Xq2,Yq2] = ndgrid([linspace(1,56,120)]);
F2 = griddedInterpolant(Xs2,Ys2,comb_map_2d);
comb_map_2d_interp = F2(Xq2,Yq2); % this is final sensitivity map!

subplot(2,3,2);
surf(comb_scaled);
title('Projections interpolated within pm5 and extrapolated outside');
xlim([0 56]);
ylim([0 56]);
subplot(2,3,3);
surf(comb_map_2d_interp);
title('Projections interpolated within pm5 and extrapolated outside in 2d');
xlim([0 120]);
ylim([0 120]);

figure('Name','Combined correction','NumberTitle','off');
subplot(2,3,1);
imagesc(xx,yy,image_9);
title('Uncorrected image');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');

subplot(2,3,2);
corr_img = imagesc(xx,yy,image_9./comb_map_2d_interp);
title('Corrected image using matrix from combined data');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
%set(gca,'ColorScale','log');

subplot(2,3,5);
hold on;
plot(xx,rescale(sum(image_9, 1)),'DisplayName','Proj of uncorrected image');
plot(xx,rescale(sum(image_9./comb_map_2d_interp, 1)),'DisplayName','Proj of corrected image, no smooth');
hold off;
xlabel('X (mm)');
ylabel('Counts');
set(gca,'ColorScale','log');
legend;

subplot(2,3,3);
corr_img = imagesc(xx,yy,image_O16./comb_map_2d_interp);
title('Corrected image using matrix from combined data');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
%set(gca,'ColorScale','log');

subplot(2,3,6);
hold on;
plot(xx,rescale(sum(image_O16, 1)),'DisplayName','Projection of uncorrected image of 16O');
plot(xx,rescale(sum(image_O16./comb_map_2d_interp, 1)),'DisplayName','Projection of uncorrected image of 16O');
hold off;
xlabel('X (mm)');
ylabel('Counts');
set(gca,'ColorScale','log');
legend;

