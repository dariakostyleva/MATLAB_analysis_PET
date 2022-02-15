%%% Pin 3_1 is PMMA position 137.42 mm from braket for Carbon higher energ with 102 mm range %%%
% This script: 
% 1. loads the evaluated point source data for specific PMMA position
% 2. performs interpolation thus makes sensitivity map in [counts/sec/kBq]
% 3. divides image [counts/sec] by the sensitivity map
% Resulting corrected images are in [kBq].
%%%%


range = [-119:2:119];
image_C10 = zeros(120,120);
image_C11 = zeros(120,120);
image_C12 = zeros(120,120);

%%% Load the point source data
load('sens_pin3_1_mod.mat'); % with one row of extrap values

%%% Interpolate
% grid of query points for interpolation
[xq,yq] = meshgrid(linspace(-119,119,120),linspace(-119,119,120));
% ar(:,1) is x [mm], ar(:,2) is y [mm], ar(:,4) is sensitivity [counts/sec/kBq]
map = griddata(ar(:,1),ar(:,2),ar(:,4),xq,yq);

%%% open images to be corrected
% C10 achro
%fig_C10 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_002_red_image.fig','invisible');
fig_C10 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_001_red_image.fig','invisible');
arr_C10 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
%time_C10 = 2399.502; % file duration in [sec]
time_C10 = 2399.578; % file duration in [sec]
image_C10 = arr_C10/time_C10; % image in [counts/sec]
corr_image_C10 = image_C10./map; % image in [kBq]
total_C10 = sum(corr_image_C10*1000*time_C10,'all','omitnan')
close all;

% C11 
openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_red_image.fig','invisible');
arr_C11 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
time_C11 = 3600.073; % file duration in [sec]
image_C11 = arr_C11/time_C11; % image in [counts/sec]
corr_image_C11 = image_C11./map; % image in [kBq]
total_C11 = sum(corr_image_C11*1000*time_C11,'all','omitnan')
close all;
%%
h(1) = figure('Name','Sensitivity map for 10,11C','NumberTitle','off');
mesh(xq,yq,map);
hold on;
scatter3(ar(:,1),ar(:,2),ar(:,4),'MarkerFaceColor',[0 .75 .75]);
hold off;
xlabel('X (mm)');
ylabel('Y (mm)');
zlabel('Intensity (counts/sec/kBq)');
ax = gca;
ax.FontSize = 14;
title('Sensitivity map, PMMA starts at -102.6 mm in X','Interpreter', 'none');

clear ar;
%%

% C12 achro special case
load('sens_pin2_mod2.mat');
map2 = griddata(ar(:,1),ar(:,2),ar(:,4),xq,yq);
fig_C12 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_red_image.fig','invisible');
arr_C12 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
time_C12 = 5399.904; % file duration in [sec]
image_C12 = arr_C12/time_C12; % image in [counts/sec]
corr_image_C12 = image_C12./map2; % image in [kBq]
total_C12 = sum(corr_image_C12*1000*time_C12,'all','omitnan')


h(2) = figure('Name','Sensitivity map for 12C','NumberTitle','off');
title(' Map for 12C ');
mesh(xq,yq,map2);
hold on;
scatter3(ar(:,1),ar(:,2),ar(:,4),'MarkerFaceColor',[0 .75 .75]);
hold off;
xlabel('X (mm)');
ylabel('Y (mm)');
zlabel('Intensity (counts/sec/kBq)');
ax = gca;
ax.FontSize = 14;
title('Sensitivity map, PMMA starts at -70 mm in X','Interpreter', 'none');

%%
h(3) = figure('Name','Original vs corrected images','NumberTitle','off');
sgtitle('Original vs corrected images','Interpreter', 'none');
subplot(3,2,1);
imagesc(range,range,image_C10);
bar = colorbar;
bar.Label.String = 'Intensity (counts/sec)';
title('image_C10','Interpreter', 'none');
xlabel('X (mm)');
ylabel('Y (mm)');
set(gca,'ColorScale','log');
%
subplot(3,2,2);
corr_image = imagesc(range,range,corr_image_C10);
xlabel('X (mm)');
ylabel('Y (mm)');
title('corr_image_C10','Interpreter', 'none');
set(gca,'ColorScale','log');
bar = colorbar;
bar.Label.String = 'Activity (kBq)';
%
subplot(3,2,3);
imagesc(range,range,image_C11);
xlabel('X (mm)');
ylabel('Y (mm)');
title('image_C11','Interpreter', 'none');
set(gca,'ColorScale','log');
bar = colorbar;
bar.Label.String = 'Intensity (counts/sec)';
%
subplot(3,2,4);
corr_image = imagesc(range,range,corr_image_C11);
xlabel('X (mm)');
ylabel('Y (mm)');
title('corr_image_C11','Interpreter', 'none');
set(gca,'ColorScale','log');
bar = colorbar;
bar.Label.String = 'Activity (kBq)';
%
subplot(3,2,5);
imagesc(range,range,image_C12);
xlabel('X (mm)');
ylabel('Y (mm)');
title('image_C12','Interpreter', 'none');
set(gca,'ColorScale','log');
bar = colorbar;
bar.Label.String = 'Intensity (counts/sec)';
%
subplot(3,2,6);
corr_image = imagesc(range,range,corr_image_C12);
xlabel('X (mm)');
ylabel('Y (mm)');
title('corr_image_C12','Interpreter', 'none');
set(gca,'ColorScale','log');
bar = colorbar;
bar.Label.String = 'Activity (kBq)';

%%
h(4) = figure('Name','Sciles of original vs corrected images','NumberTitle','off');
subplot(3,1,1);
title('Comparison of slices along beam C10');
hold on;
plot(range,rescale(sum(corr_image_C10(50:70,:))),'DisplayName','C10 corrected, central slice 40 mm');
plot(range,rescale(sum(image_C10(50:70,:))),'DisplayName','C10 orig, central slice 40 mm');
hold off;
xlabel('X (mm)');
ylabel('Intensity (a.u.)');
legend;
%
subplot(3,1,2);
title('Comparison of slices along beam C11');
hold on;
plot(range,rescale(sum(corr_image_C11(50:70,:))),'DisplayName','C11 corrected, central slice 40 mm');
plot(range,rescale(sum(image_C11(50:70,:))),'DisplayName','C11 orig, central slice 40 mm');
hold off;
xlabel('X (mm)');
ylabel('Intensity (a.u.)');
legend;
%
subplot(3,1,3);
title('Comparison of slices along beam C12');
hold on;
plot(range,rescale(sum(corr_image_C12(50:70,:))),'DisplayName','C12 corrected, central slice 40 mm');
plot(range,rescale(sum(image_C12(50:70,:))),'DisplayName','C12 orig, central slice 40 mm');
hold off;
xlabel('X (mm)');
ylabel('Intensity (a.u.)');
legend; 

%%
h(5) = figure('Name','Sciles of original vs corrected images','NumberTitle','off');
subplot(3,1,1);
title('Comparison of slices perpendicular beam C10');
hold on;
plot(range,rescale(sum(corr_image_C10(:,60:80),2)),'DisplayName','C10 corrected, slice 40 mm');
plot(range,rescale(sum(image_C10(:,60:80),2)),'DisplayName','C10 orig, slice 40 mm');
hold off;
xlabel('X (mm)');
ylabel('Intensity (a.u.)');
legend;
%
subplot(3,1,2);
title('Comparison of slices perpendicular beam C11');
hold on;
plot(range,rescale(sum(corr_image_C11(:,60:80),2)),'DisplayName','C11 corrected, slice 40 mm');
plot(range,rescale(sum(image_C11(:,60:80),2)),'DisplayName','C11 orig, slice 40 mm');
hold off;
xlabel('X (mm)');
ylabel('Intensity (a.u.)');
legend;
%
subplot(3,1,3);
title('Comparison of slices perpendicular beam C12');
hold on;
plot(range,rescale(sum(corr_image_C12(:,60:80),2)),'DisplayName','C12 corrected, slice 40 mm');
plot(range,rescale(sum(image_C12(:,60:80),2)),'DisplayName','C12 orig, slice 40 mm');
hold off;
xlabel('X (mm)');
ylabel('Intensity (a.u.)');
legend;

%%
h(6) = figure;
sgtitle('Expected range ~102 mm range of carbons, achromatic mode of FRS')
subplot(2,1,1)
hold on;
plot([-16.4:2:222.6],sum(corr_image_C10(50:70,:)),'DisplayName','C10 corrected, central slice 40 mm');
plot([-16.4:2:222.6],sum(corr_image_C11(50:70,:)),'DisplayName','C11 corrected, central slice 40 mm');
plot([-49:2:190],sum(corr_image_C12(50:70,:)),'DisplayName','C12 corrected, central slice 40 mm');
hold off;
xlabel('Depth in PMMA (mm)');
ylabel('Activity (kBq)');
legend;
%
subplot(2,1,2)
hold on;
plot([-16.4:2:222.6],rescale(sum(corr_image_C10(50:70,:))),'DisplayName','C10 corrected, central slice 40 mm');
plot([-16.4:2:222.6],rescale(sum(corr_image_C11(50:70,:))),'DisplayName','C11 corrected, central slice 40 mm');
plot([-49:2:190],rescale(sum(corr_image_C12(50:70,:))),'DisplayName','C12 corrected, central slice 40 mm');
hold off;
xlabel('Depth in PMMA (mm)');
ylabel('Scaled (a.u.)');
legend;
return;
%% saving all figures into single .fig
savefig(h,'Q:\Documents\PET\MATLAB_figures_PET\Sens_corr_carbons_higher_energ.fig');
close(h);

return;
%% DEBUG
mesh(xq,yq,corr_image_C10)
xlabel('X (mm)');
ylabel('Y (mm)');
zlabel('Activity [kBq]');
%set(gca,'ColorScale','log');
colorbar;
total_act_kBq = sum(corr_image_C10,'all', 'omitnan')
% for i = 1:120
%     mesh(range,corr_image_C10(i,:));
%     %plot3(X(i,:),i+ones(N,1),Z(i,:))
% end
%%
figure;
plot(range,rescale(sum(corr_image_C10(60:63,:))),'DisplayName','C10 corr');
%plot(range,rescale(sum(image_C10(55:65,:))),'DisplayName','C10 ');
a = sum(corr_image_C10(60:63,:));

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
%saveas(corr_image, 'Q:\Documents\PET\MATLAB_figures_PET\C10_001_red_image_corr.fig')