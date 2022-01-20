%%% Pin 1 is PMMA position for Oxygens lower energ with 39 mm range %%%
% This script: 
% 1. loads the evaluated point source data for specific PMMA position
% 2. performs interpolation thus makes sensitivity map in [counts/sec/kBq]
% 3. divides image [counts/sec] by the sensitivity map
% Resulting corrected images are in [kBq].
%%%%


range = [-119:2:119];
image_O15 = zeros(120,120);
image_O14 = zeros(120,120);
image_O16 = zeros(120,120);

%%% Load the point source data
%load('sens_pin1_mod.mat');
load('sens_pin1_mod2.mat'); % with one row of extrap values

%%% Interpolate
% grid of query points for interpolation
[xq,yq] = meshgrid(linspace(-119,119,120),linspace(-119,119,120));
% ar(:,1) is x [mm], ar(:,2) is y [mm], ar(:,4) is sensitivity [counts/sec/kBq]
map = griddata(ar(:,1),ar(:,2),ar(:,4),xq,yq);

%%% open images to be corrected
% O15
fig_O15 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O15_008_red_image.fig','invisible');
arr_O15 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
time_O15 = 1200.046; % file duration in [sec]
image_O15 = arr_O15/time_O15; % image in [counts/sec]
corr_image_O15 = image_O15./map; % image in [kBq]
close all;

% O14
openfig('Q:\Documents\PET\MATLAB_figures_PET\O14_016_red_image.fig','invisible');
arr_O14 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
time_O14 = 2343.966; % file duration in [sec]
image_O14 = arr_O14/time_O14; % image in [counts/sec]
corr_image_O14 = image_O14./map; % image in [kBq]
close all;

% O16
fig_O16 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O16_015_red_image.fig','invisible');
arr_O16 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
time_O16 = 1800.01; % file duration in [sec]
image_O16 = arr_O16/time_O16; % image in [counts/sec]
corr_image_O16 = image_O16./map; % image in [kBq]
close all;


%%
% Start ploting
h(1) = figure('Name','Sensitivity map','NumberTitle','off');
mesh(xq,yq,map);
hold on;
scatter3(ar(:,1),ar(:,2),ar(:,4),'MarkerFaceColor',[0 .75 .75]);
hold off;
xlabel('X (mm)');
ylabel('Y (mm)');
zlabel('Intensity (counts/sec/kBq)');
ax = gca;
ax.FontSize = 14;
title('Sensitivity map, PMMA starts at -35 mm in X','Interpreter', 'none');

%%
h(2) = figure('Name','Original vs corrected images','NumberTitle','off');
sgtitle('Original vs corrected images','Interpreter', 'none');
subplot(3,2,1);
imagesc(range,range,image_O15);
bar = colorbar;
bar.Label.String = 'Intensity (counts/sec)';
title('image_O15','Interpreter', 'none');
xlabel('X (mm)');
ylabel('Y (mm)');
set(gca,'ColorScale','log');
%
subplot(3,2,2);
corr_image = imagesc(range,range,corr_image_O15);
xlabel('X (mm)');
ylabel('Y (mm)');
title('corr_image_O15','Interpreter', 'none');
set(gca,'ColorScale','log');
bar = colorbar;
bar.Label.String = 'Activity (kBq)';
%
subplot(3,2,3);
imagesc(range,range,image_O14);
xlabel('X (mm)');
ylabel('Y (mm)');
title('image_O14','Interpreter', 'none');
set(gca,'ColorScale','log');
bar = colorbar;
bar.Label.String = 'Intensity (counts/sec)';
%
subplot(3,2,4);
corr_image = imagesc(range,range,corr_image_O14);
xlabel('X (mm)');
ylabel('Y (mm)');
title('corr_image_O14','Interpreter', 'none');
set(gca,'ColorScale','log');
bar = colorbar;
bar.Label.String = 'Activity (kBq)';
%
subplot(3,2,5);
imagesc(range,range,image_O16);
xlabel('X (mm)');
ylabel('Y (mm)');
title('image_O16','Interpreter', 'none');
set(gca,'ColorScale','log');
bar = colorbar;
bar.Label.String = 'Intensity (counts/sec)';
%
subplot(3,2,6);
corr_image = imagesc(range,range,corr_image_O16);
xlabel('X (mm)');
ylabel('Y (mm)');
title('corr_image_O16','Interpreter', 'none');
set(gca,'ColorScale','log');
bar = colorbar;
bar.Label.String = 'Activity (kBq)';

%%
h(3) = figure('Name','Sciles of original vs corrected images','NumberTitle','off');
subplot(3,1,1);
title('Comparison of slices along beam O15');
hold on;
plot(range,rescale(sum(corr_image_O15(50:70,:))),'DisplayName','O15 corrected, central slice 40 mm');
plot(range,rescale(sum(image_O15(50:70,:))),'DisplayName','O15 orig, central slice 40 mm');
hold off;
xlabel('X (mm)');
ylabel('Intensity (a.u.)');
legend;
%
subplot(3,1,2);
title('Comparison of slices along beam O14');
hold on;
plot(range,rescale(sum(corr_image_O14(50:70,:))),'DisplayName','O14 corrected, central slice 40 mm');
plot(range,rescale(sum(image_O14(50:70,:))),'DisplayName','O14 orig, central slice 40 mm');
hold off;
xlabel('X (mm)');
ylabel('Intensity (a.u.)');
legend;
%
subplot(3,1,3);
title('Comparison of slices along beam O16');
hold on;
plot(range,rescale(sum(corr_image_O16(50:70,:))),'DisplayName','O16 corrected, central slice 40 mm');
plot(range,rescale(sum(image_O16(50:70,:))),'DisplayName','O16 orig, central slice 40 mm');
hold off;
xlabel('X (mm)');
ylabel('Intensity (a.u.)');
legend; 

%%
h(4) = figure('Name','Sciles of original vs corrected images','NumberTitle','off');
subplot(3,1,1);
title('Comparison of slices perpendicular beam O15');
hold on;
plot(range,rescale(sum(corr_image_O15(:,60:80),2)),'DisplayName','O15 corrected, slice 40 mm');
plot(range,rescale(sum(image_O15(:,60:80),2)),'DisplayName','O15 orig, slice 40 mm');
hold off;
xlabel('X (mm)');
ylabel('Intensity (a.u.)');
legend;
%
subplot(3,1,2);
title('Comparison of slices perpendicular beam O14');
hold on;
plot(range,rescale(sum(corr_image_O14(:,60:80),2)),'DisplayName','O14 corrected, slice 40 mm');
plot(range,rescale(sum(image_O14(:,60:80),2)),'DisplayName','O14 orig, slice 40 mm');
hold off;
xlabel('X (mm)');
ylabel('Intensity (a.u.)');
legend;
%
subplot(3,1,3);
title('Comparison of slices perpendicular beam O16');
hold on;
plot(range,rescale(sum(corr_image_O16(:,60:80),2)),'DisplayName','O16 corrected, slice 40 mm');
plot(range,rescale(sum(image_O16(:,60:80),2)),'DisplayName','O16 orig, slice 40 mm');
hold off;
xlabel('X (mm)');
ylabel('Intensity (a.u.)');
legend;

%%
h(5) = figure;
sgtitle('Expected range ~39 mm range of oxygens, achromatic mode of FRS')
subplot(2,1,1);
hold on;
plot([-84:2:155],sum(corr_image_O15(50:70,:)),'DisplayName','O15 corrected, central slice 40 mm');
plot([-84:2:155],sum(corr_image_O14(50:70,:)),'DisplayName','O14 corrected, central slice 40 mm');
plot([-84:2:155],sum(corr_image_O16(50:70,:)),'DisplayName','O16 corrected, central slice 40 mm');
hold off;
xlabel('Depth in PMMA (mm)');
ylabel('Activity (kBq)');
legend;
%
subplot(2,1,2);
hold on;
plot([-84:2:155],rescale(sum(corr_image_O15(50:70,:))),'DisplayName','O15 corrected, central slice 40 mm');
plot([-84:2:155],rescale(sum(corr_image_O14(50:70,:))),'DisplayName','O14 corrected, central slice 40 mm');
plot([-84:2:155],rescale(sum(corr_image_O16(50:70,:))),'DisplayName','O16 corrected, central slice 40 mm');
hold off;
xlabel('Depth in PMMA (mm)');
ylabel('Scaled (a.u.)');
legend;

%% saving all figures into single .fig
savefig(h,'Q:\Documents\PET\MATLAB_figures_PET\Sens_corr_oxygens_lower_energ.fig');
close(h);

return;
%% DEBUG
mesh(xq,yq,corr_image_O15)
xlabel('X (mm)');
ylabel('Y (mm)');
zlabel('Activity [kBq]');
%set(gca,'ColorScale','log');
colorbar;
total_act_kBq = sum(corr_image_O15,'all', 'omitnan')
% for i = 1:120
%     mesh(range,corr_image_O15(i,:));
%     %plot3(X(i,:),i+ones(N,1),Z(i,:))
% end
%%
figure;
plot(range,rescale(sum(corr_image_O15(60:63,:))),'DisplayName','O15 corr');
%plot(range,rescale(sum(image_O15(55:65,:))),'DisplayName','O15 ');
a = sum(corr_image_O15(60:63,:));

for i = 1:60
	if (i == 1) 
		b(i) = a(i)+a(i+1)
	end
	b(i) = a(2*i-1)+a(2*i)	
end

figure;
hold on;
plot(-119:4:119,b,'DisplayName','rebinned');
plot(range,a,'DisplayName','orig');
legend;
%saveas(corr_image, 'Q:\Documents\PET\MATLAB_figures_PET\O15_001_red_image_corr.fig')