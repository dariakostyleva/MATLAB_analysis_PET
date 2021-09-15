% This script performs sensitivity correction based on 2 mm binned data
% Author: Daria K.

fig_7 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_007_red_image.fig','invisible');
image_7 = get(get(gca,'Children'),'CData');
fig_8 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_008_red_image.fig','invisible');
image_8 = get(get(gca,'Children'),'CData');
fig_9 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_009_red_image.fig','invisible');
image_9 = get(get(gca,'Children'),'CData');
fig_10 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0010_red_image.fig','invisible');
image_10 = get(get(gca,'Children'),'CData');
fig_11 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0011_red_image.fig','invisible');
image_11 = get(get(gca,'Children'),'CData');
fig_O16 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O16_015_red_image.fig','invisible');
image_O16 = get(get(gca,'Children'),'CData'); % getting data from figure as an array

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

fig_59 = openfig('Q:\Documents\PET\MATLAB_figures_PET\68ge_calib059_red_image.fig','invisible');
image_59 = get(get(gca,'Children'),'CData');

proj_col_7 = sum(image_7, 1); % projection on beam axis with sum over columns
proj_col_8 = sum(image_8, 1);
proj_col_9 = sum(image_9, 1);
proj_col_10 = sum(image_10, 1);
proj_col_11 = sum(image_11, 1);

proj_col_41 = sum(image_41, 2); % projection on beam axis with sum over columns
proj_col_42 = sum(image_42, 2);
proj_col_43 = sum(image_43, 2);
proj_col_44 = sum(image_44, 2);
proj_col_45 = sum(image_45, 2);

figure('Name','Projections of perdendicular sources','NumberTitle','off');
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

figure('Name','Projections of parallel sources','NumberTitle','off');
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

xx = [-119:2:119];
yy = [-119:2:119];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% ii) Building 2d matrix based on five files %%%%%%%% 
%%%%%%       Source placed parallel to beam       %%%%%%%%
proj_file007 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_007_red_proj_2mm.txt');
proj_file008 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_008_red_proj_2mm.txt');
proj_file009 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_009_red_proj_2mm.txt');
proj_file0010 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0010_red_proj_2mm.txt');
proj_file0011 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0011_red_proj_2mm.txt');
%%%%%%     Source placed perpendicular to beam    %%%%%%%%
proj_file0041 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0041_red_proj_2mm.txt');
proj_file0042 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0042_red_proj_2mm.txt');
proj_file0043 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0043_red_proj_2mm.txt');
proj_file0044 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0044_red_proj_2mm.txt');
proj_file0045 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\june21_Ge68_source_0045_red_proj_2mm.txt');

proj_file0057 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\68ge_calib057_red_proj_2mm.txt');
proj_file0058 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\68ge_calib058_red_proj_2mm.txt');
proj_file0059 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\68ge_calib059_red_proj_2mm.txt');
proj_file0060 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\68ge_calib060_red_proj_2mm.txt');
proj_file0061 = importdata('Q:\Documents\PET\MATLAB_analysis_PET\68ge_calib061_red_proj_2mm.txt');

figure('Name','Slices','NumberTitle','off');
subplot(2,2,1);
hold on;
% plot(proj_file0041,'DisplayName','Source is 0.0 cm, file 41');
% plot(proj_file0042,'DisplayName','Source is +2.5 cm, file 41');
% plot(proj_file0043,'DisplayName','Source is +5.0 cm, file 43');
% plot(proj_file0044,'DisplayName','Source is -2.5 cm, file 44');
% plot(proj_file0045,'DisplayName','Source is -5.0 cm, file 45');
plot(proj_file0059,'DisplayName','Source is 0.0 cm, file 59');
plot(proj_file0060,'DisplayName','Source is +2.5 cm, file 60');
plot(proj_file0061,'DisplayName','Source is +5.0 cm, file 61');
plot(proj_file0058,'DisplayName','Source is -2.5 cm, file 58');
plot(proj_file0057,'DisplayName','Source is -5.0 cm, file 57');
hold off;
xlabel('Number of bins');
ylabel('Counts per 2 mm bin');
xticks([0:10:120]);
legend;

subplot(2,2,2);
hold on;
plot(proj_file007,'DisplayName','Source is 0.0 cm, file 7');
plot(proj_file008,'DisplayName','Source is +2.5 cm, file 8');
plot(proj_file009,'DisplayName','Source is +5.0 cm, file 9');
plot(proj_file0010,'DisplayName','Source is -2.5 cm, file 10');
plot(proj_file0011,'DisplayName','Source is -5.0 cm, file 11');
hold off;
xlabel('Number of bins');
ylabel('Counts per 2 mm bin');
xticks([0:10:120]);
legend;

subplot(2,2,3);
hold on;
plot(proj_file007,'DisplayName','Source is 0.0 cm, file 7');
plot(proj_file008,'DisplayName','Source is +2.5 cm, file 8');
plot(proj_file009,'DisplayName','Source is +5.0 cm, file 9');
plot(proj_file0010,'DisplayName','Source is -2.5 cm, file 10');
plot(proj_file0011,'DisplayName','Source is -5.0 cm, file 11');
plot(proj_file0059,'--','DisplayName','Source is 0.0 cm, file 59');
plot(proj_file0060,'--','DisplayName','Source is +2.5 cm, file 60');
plot(proj_file0061,'--','DisplayName','Source is +5.0 cm, file 61');
plot(proj_file0058,'--','DisplayName','Source is -2.5 cm, file 58');
plot(proj_file0057,'--','DisplayName','Source is -5.0 cm, file 57');
hold off;
xlabel('Number of bins');
ylabel('Counts per 2 mm bin');
xticks([0:10:120]);
legend;


% combining files into an array
combined_parall = zeros(5, 120); 
combined_perpendic = zeros(120, 5);
combined_parall(1,:) = proj_file009;
combined_parall(2,:) = proj_file008;
combined_parall(3,:) = proj_file007;
combined_parall(4,:) = proj_file0010;
combined_parall(5,:) = proj_file0011; 

% combined_perpendic(:,1) = proj_file0043;
% combined_perpendic(:,2) = proj_file0042;
% combined_perpendic(:,3) = proj_file0041;
% combined_perpendic(:,4) = proj_file0044;
% combined_perpendic(:,5) = proj_file0045;

combined_perpendic(:,1) = proj_file0061;
combined_perpendic(:,2) = proj_file0060;
combined_perpendic(:,3) = proj_file0059;
combined_perpendic(:,4) = proj_file0058;
combined_perpendic(:,5) = proj_file0057;

% scale in respect with maximum number of counts in center FOV
% combined_parall = combined_parall/max(proj_file007); 
% combined_perpendic = combined_perpendic/max(proj_file0059);
source_activ = 13e6;
combined_parall = combined_parall/max(source_activ); 
combined_perpendic = combined_perpendic/max(source_activ);

comb_merged_no_int = combined_perpendic*combined_parall;
%comb_merged_no_int = combined_parall;

figure('Name','Sensitivity maps NO interpolation','NumberTitle','off');
subplot(2,2,1)
surf(comb_merged_no_int);
subplot(2,2,2)
surf(combined_perpendic);
subplot(2,2,3)
surf(combined_parall);

figure('Name','Images with sensitivity maps NO interpolation','NumberTitle','off');

subplot(3,2,1);
imagesc(xx,yy,image_7./comb_merged_no_int);
title('Corrected image of the source placed parallel, file 7');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
set(gca,'ColorScale','log');

subplot(3,2,2);
hold on;
plot(xx,rescale(image_7(61,:)),'DisplayName','Slice of uncorrected image of the source placed parallel, file 7');
plot(xx,rescale(comb_merged_no_int(61,:)),'DisplayName','Slice of correction map');
plot(xx,rescale(image_7(61,:)./comb_merged_no_int(61,:)),'DisplayName','Slice of corrected image of the source placed parallel, file 7');
hold off;
xlabel('X (mm)');
ylabel('Counts');
set(gca,'ColorScale','log');
legend;

subplot(3,2,3);
imagesc(xx,yy,image_59./comb_merged_no_int);
title('Corrected image of the source placed perdendicular, file 59');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
set(gca,'ColorScale','log');

subplot(3,2,4);
hold on;
plot(xx,rescale(image_59(:,62)),'DisplayName','Slice of uncorrected image of the source placed perdendicular, file 59');
plot(xx,rescale(comb_merged_no_int(:,62)),'DisplayName','Slice of correction map');
plot(xx,rescale(image_59(:,62)./comb_merged_no_int(:,62)),'DisplayName','Slice of corrected image of the source placed perpendicular, file 59');
hold off;
xlabel('X (mm)');
ylabel('Counts');
set(gca,'ColorScale','log');
legend;

subplot(3,2,5);
corr_img = imagesc(xx,yy,image_O16./comb_merged_no_int);
title('Corrected image of O16, file 15');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
set(gca,'ColorScale','log');

subplot(3,2,6);
factor = 44130/1800.01; % number of counts in the peak over measurement time
hold on;
plot(xx,rescale(image_O16(61,:),0,factor),'DisplayName','Slice of uncorrected 16O image, file 15');
plot(xx,rescale(image_O16(61,:)./comb_merged_no_int(61,:),0,factor),'DisplayName','Slice of corrected 16O image, file 15');
% file with image_O16 has length of 1800.01 seconds 
hold off;
xlabel('X (mm)');
ylabel('Counts per second');
legend;


figure('Name','Image corrected with its own projection','NumberTitle','off');
hold on;
plot(rescale(image_41(:,62)./proj_file0041));
plot(rescale(proj_file0041));
hold off;

figure;
subplot(2,2,1)
imagesc(xx,yy,image_7);
set(gca,'ColorScale','log');
subplot(2,2,2)
imagesc(xx,yy,comb_merged_no_int);
set(gca,'ColorScale','log');
subplot(2,2,3)
imagesc(xx,yy,image_7./comb_merged_no_int);
set(gca,'ColorScale','log');
subplot(2,2,4)
imagesc(xx,yy,image_7./comb_merged_no_int);

filename = char('sensitivity_corr_matrix.txt');
writematrix(comb_merged_no_int,filename);

%%%%% If interpolation is used %%%%

% x coordinates of sampling points, values in mm
%xs1 = [62, 87, 112, 137, 162]; for gridded inerpolant
xs1 = [-50, -25, 0, 25, 50];
% middle point is the reference, it is bin 56, thus 56*2=112 mm
% files were taken with 25 mm step, thus 112+25=137 mm, 137+25=162 mm
% and 112-25=87 mm and 62 mm, correspondingly

% x and y coordinates of sampling points, values in mm
%[Xs1,Ys1] = ndgrid(xs1,linspace(1,240,120)); for gridded inerpolant
%[Xs1,Ys1] = meshgrid(linspace(1,240,120),xs1);
[Xs1,Ys1] = meshgrid([-119:2:119],xs1);
% we have 112 bins each 2 mm, thus total FOV is 224 mm

% grid for coordinates of query points
%[Xq1,Yq1] = ndgrid(2:2:240);
%[Xq1,Yq1] = ndgrid(linspace(1,240,120));
[Xq1,Yq1] = ndgrid(linspace(-119,119,120));

% linear interpolation of 5x56 array into 56x56 array, plus linear
% extrapolation outside the range
% F1 = griddedInterpolant(Xs1,Ys1,comb_scaled,'linear');
% comb_scaled = F1(Xq1,Yq1);

combined_parall_int = interp2(Xs1,Ys1,combined_parall,Xq1,Yq1,'nearest');
[Xs1,Ys1] = meshgrid(xs1,linspace(-119,119,120));
combined_perpendic_int = interp2(Xs1,Ys1,combined_perpendic,Xq1,Yq1,'nearest');
comb_merged_int = combined_parall_int.*combined_perpendic_int;

figure('Name','Sensitivity maps WITH interpolation','NumberTitle','off');
subplot(2,2,1);
surf(comb_merged_int);

subplot(2,2,2);
hold on;
%plot(xx,rescale(image_7(61,:)),'DisplayName','Proj of uncorrected image');
%plot(xx,rescale(image_7(61,:)./comb_merged_int(61,:)),'DisplayName','Proj of corrected image, no smooth');
plot(xx,rescale(image_7(61,:)),'DisplayName','Proj of uncorrected image');
plot(xx,comb_merged_int(61,:),'DisplayName','Proj of correction map');
corrected_slice = comb_merged_int(61,:);
corrected_slice(isnan(corrected_slice))=1;
plot(xx,rescale(image_7(61,:)./corrected_slice),'DisplayName','Proj of corrected image, no smooth');
hold off;
xlabel('X (mm)');
ylabel('Counts');
set(gca,'ColorScale','log');
legend;

subplot(2,2,3);
corr_img = imagesc(xx,yy,image_O16./comb_merged_int);
title('Corrected image using matrix from combined data');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
set(gca,'ColorScale','log');

subplot(2,2,4);
hold on;
plot(xx,rescale(image_O16(61,:)),'DisplayName','Projection of uncorrected image of 16O');
plot(xx,rescale(image_O16(61,:)./comb_merged_int(61,:)),'DisplayName','Projection of corrected image of 16O');
hold off;
xlabel('X (mm)');
ylabel('Counts');
legend;

return;
% 
% %comb_map_2d_interp = comb_map_2d;
% corrected_image = image_9./comb_merged_int;
% corrected_image(isnan(corrected_image))=0;
% 
% % % linear interpolation of 56x56 array into 120x120 array with final pixelation
% % [Xs2,Ys2] = ndgrid(1:1:56);
% % [Xq2,Yq2] = ndgrid([linspace(1,56,120)]);
% % F2 = griddedInterpolant(Xs2,Ys2,comb_map_2d);
% % comb_map_2d_interp = F2(Xq2,Yq2); % this is final sensitivity map!
% 
% subplot(2,3,2);
% surf(comb_scaled);
% title('Projections interpolated within pm5 and extrapolated outside');
% xlim([0 120]);
% ylim([0 120]);
% subplot(2,3,3);
% surf(comb_map_2d_interp);
% title('Projections interpolated within pm5 and extrapolated outside in 2d');
% xlim([0 120]);
% ylim([0 120]);
% 
% figure('Name','Combined correction','NumberTitle','off');
% subplot(2,3,1);
% imagesc(xx,yy,image_9);
% title('Uncorrected image');
% axis square;
% axis xy;
% ax.XLim = [-120,120];
% ax.YLim = [-120,120];
% xticks([-120:20:120]);
% yticks([-120:20:120]);
% xlabel('X (mm)');
% ylabel('Y (mm)');
% 
% subplot(2,3,2);
% corr_img = imagesc(xx,yy,corrected_image);
% title('Corrected image using matrix from combined data');
% axis square;
% axis xy;
% ax.XLim = [-120,120];
% ax.YLim = [-120,120];
% xticks([-120:20:120]);
% yticks([-120:20:120]);
% xlabel('X (mm)');
% ylabel('Y (mm)');
% %set(gca,'ColorScale','log');
% 
% subplot(2,3,5);
% hold on;
% plot(xx,rescale(sum(image_9, 1)),'DisplayName','Proj of uncorrected image');
% plot(xx,rescale(sum(corrected_image, 1,'omitnan')),'DisplayName','Proj of corrected image, no smooth');
% hold off;
% xlabel('X (mm)');
% ylabel('Counts');
% set(gca,'ColorScale','log');
% legend;
% 
% subplot(2,3,3);
% corr_img = imagesc(xx,yy,image_O16./comb_map_2d_interp);
% title('Corrected image using matrix from combined data');
% axis square;
% axis xy;
% ax.XLim = [-120,120];
% ax.YLim = [-120,120];
% xticks([-120:20:120]);
% yticks([-120:20:120]);
% xlabel('X (mm)');
% ylabel('Y (mm)');
% %set(gca,'ColorScale','log');
% 
% subplot(2,3,6);
% hold on;
% plot(xx,rescale(sum(image_O16, 1)),'DisplayName','Projection of uncorrected image of 16O');
% plot(xx,rescale(sum(image_O16./comb_map_2d_interp, 1,'omitnan')),'DisplayName','Projection of corrected image of 16O');
% hold off;
% xlabel('X (mm)');
% ylabel('Counts');
% set(gca,'ColorScale','log');
% legend;

