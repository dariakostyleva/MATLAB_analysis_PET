% This script performs sensitivity correction. 
% Author: Daria K.

fig_41 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0041_red_image.fig');
image_41 = get(get(gca,'Children'),'CData');
fig_42 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0042_red_image.fig');
image_42 = get(get(gca,'Children'),'CData');
fig_43 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0043_red_image.fig');
image_43 = get(get(gca,'Children'),'CData');
fig_44 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0044_red_image.fig');
image_44 = get(get(gca,'Children'),'CData');
fig_45 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0045_red_image.fig');
image_45 = get(get(gca,'Children'),'CData');

proj_col_41 = sum(image_41, 2); % projection on beam axis with sum over columns
proj_col_42 = sum(image_42, 2);
proj_col_43 = sum(image_43, 2);
proj_col_44 = sum(image_44, 2);
proj_col_45 = sum(image_45, 2);

figure('Name','Projections','NumberTitle','off');
subplot(2,1,1);
hold on;
plot(proj_col_41,'DisplayName','Source is 0.0 cm');
plot(proj_col_42,'DisplayName','Source is +2.5 cm');
plot(proj_col_43,'DisplayName','Source is +5.0 cm');
plot(proj_col_44,'DisplayName','Source is -2.5 cm');
plot(proj_col_45,'DisplayName','Source is -5.0 cm');
hold off;
xlabel('Number of bins');
ylabel('Counts per 2 mm bin');
xticks([0:10:120]);
legend;

subplot(2,1,2);
proj_col_41 = proj_col_41/max(proj_col_41); % projection on beam axis with sum over columns
proj_col_42 = proj_col_42/max(proj_col_42);
proj_col_43 = proj_col_43/max(proj_col_43);
proj_col_44 = proj_col_44/max(proj_col_44);
proj_col_45 = proj_col_45/max(proj_col_45);
hold on;
plot(proj_col_41,'DisplayName','Source is 0.0 cm');
% plot(proj_col_42,'DisplayName','Source is +2.5 cm');
% plot(proj_col_43,'DisplayName','Source is +5.0 cm');
% plot(proj_col_44,'DisplayName','Source is -2.5 cm');
% plot(proj_col_45,'DisplayName','Source is -5.0 cm');
hold off;
xlabel('Number of bins');
ylabel('Counts per 2 mm bin');
xticks([0:10:120]);
legend;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% i) Building 2d matrix based on one file %%%%%%%% 

figure('Name','Correction','NumberTitle','off');
proj_file0041 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0041_red_proj.txt');
% ratio between number of counts to the maximum number of counts, so that
% "big" numbers in the center remiain almost the same and small numbers on
% the edges grow up.
% however, we have bumps which should be accounted for?
proj_file0041 = proj_file0041.';
proj_scaled = proj_file0041/max(proj_file0041); 
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
orig_img = imagesc(xx,yy,image_41);
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
corr_img = imagesc(xx,yy,image_41./map_2d_interp_smooth);
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
corr_img = imagesc(xx,yy,image_41./map_2d_interp);
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
corr_proj = sum(image_41./map_2d_interp_smooth, 2);
xx = [-119:2:119];
plot(xx,rescale(corr_proj),'DisplayName','Proj of corrected image, smooth with span 5');
hold on;
plot(xx,rescale(sum(image_41, 2)),'DisplayName','Proj of uncorrected image');
plot(xx,rescale(sum(image_41./map_2d_interp, 2)),'DisplayName','Proj of corrected image, no smooth');
hold off;
xlabel('X (mm)');
ylabel('Counts');
set(gca,'ColorScale','log');
legend;
%%%%%%                                            %%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% ii) Building 2d matrix based on five files %%%%%%%% 
%%%%%%           Source placed VERTICALLY       %%%%%%%%
proj_file0041 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0041_red_proj.txt');
proj_file0042 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0042_red_proj.txt');
proj_file0043 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0043_red_proj.txt');
proj_file0044 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0044_red_proj.txt');
proj_file0045 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0045_red_proj.txt');

% combining files into array
combined = zeros(5, 56); 
combined(1,:) = proj_file0041.';
combined(2,:) = proj_file0042.';
combined(3,:) = proj_file0043.';
combined(4,:) = proj_file0044.';
combined(5,:) = proj_file0045.';
% scale in respect with maximum number of counts in center FOV
comb_scaled = combined/max(proj_file0041); 

figure('Name','Interpolation methods','NumberTitle','off');
subplot(2,3,1);
surf(comb_scaled);
title('Projections from 5 files scaled to max number of counts');
subplot(2,3,4);
ribbon(combined);
subplot(2,3,5);
ribbon(image_41);

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
subplot(2,2,1);
imagesc(xx,yy,image_41);
title('Uncorrected image');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');

subplot(2,2,2);
corr_img = imagesc(xx,yy,image_41./comb_map_2d_interp);
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

subplot(2,2,3);
hold on;
plot(xx,rescale(sum(image_41, 2)),'DisplayName','Proj of uncorrected image');
plot(xx,rescale(sum(image_41./comb_map_2d_interp, 2)),'DisplayName','Proj of corrected image, no smooth');
hold off;
xlabel('X (mm)');
ylabel('Counts');
set(gca,'ColorScale','log');
legend;









