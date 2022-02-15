%%% This script compares mono and achro modes of FRS
%%% PMMA position is 200.7 mm from braket for Carbon lower energ with 39 mm range %%%

br = 0.906; % branching ratio for positron emission of 22Na
range = [-119:2:119];    % scaling for 0,0 at FOV middle
depth = [-79.7:2:159.3]; % scaling for depth in PMMA
image_C10_a = zeros(120,120);
image_C10_m = zeros(120,120);

%%% Load the point source data
%load('sens_pin1_1.mat');
load('sens_pin1_1_mod.mat'); % with one row of extrap values

%%% Interpolate
% grid of query points for interpolation
[xq,yq] = meshgrid(linspace(-119,119,120),linspace(-119,119,120));
% ar(:,1) is x [mm], ar(:,2) is y [mm], ar(:,4) is sensitivity [counts/sec/kBq]
ar(:,4) = ar(:,4)*10^(-3)/br; % absolute sensitivity incl br correction
map = griddata(ar(:,1),ar(:,2),ar(:,4),xq,yq); % map is dimensionless

%%% open images to be corrected
% C10 achro
fig_C10_a = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_red_image.fig','invisible');
arr_C10_a = get(get(gca,'Children'),'CData'); % getting data from figure as an array
time_C10_a = 1200.035; % file duration in [sec]
%image_C10 = arr_C10/time_C10; % image in [counts/sec]
image_C10_a = arr_C10_a; % image in [counts]
corr_image_C10_a = image_C10_a./map; % image in [counts]
total_C10_a = sum(corr_image_C10_a,'all','omitnan')
close all;

% C10 achro
fig_C10_m = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_015_red_image.fig','invisible');
arr_C10_m = get(get(gca,'Children'),'CData'); % getting data from figure as an array
time_C10_m = 1199.94; % file duration in [sec]
%image_C10 = arr_C10/time_C10; % image in [counts/sec]
image_C10_m = arr_C10_m; % image in [counts]
corr_image_C10_m = image_C10_m./map; % image in [counts]
total_C10_m = sum(corr_image_C10_m,'all','omitnan')
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
zlabel('Sensitivity');
ax = gca;
ax.FontSize = 14;
title('Sensitivity map, PMMA starts at -39.3 mm in X','Interpreter', 'none');

%%
h(2) = figure('Name','Corrected images','NumberTitle','off');

subplot(1,2,1);
corr_image = imagesc(range,range,corr_image_C10_a);
xlabel('X (mm)');
ylabel('Y (mm)');
title('corr_image_C10_achro','Interpreter', 'none');
set(gca,'ColorScale','log');
bar = colorbar;
bar.Label.String = 'Intensity (counts)';
axis square;
axis xy;
ax = gca;
ax.FontSize = 30;
ax.XLim = [-100,100];
ax.YLim = [-100,100];
xticks([-120:20:120]);
yticks([-120:20:120]);
ax.TickDir = 'out';
ax.TickLength = [0.02 0.02];
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.GridLineStyle = '--';
ax.GridAlphaMode = 'manual';
ax.GridAlpha = 0.5;
ax.GridColorMode = 'manual';
ax.GridColor = 'white';

%
subplot(1,2,2);
corr_image = imagesc(range,range,corr_image_C10_m);
xlabel('X (mm)');
ylabel('Y (mm)');
title('corr_image_C10_mono','Interpreter', 'none');
set(gca,'ColorScale','log');
bar = colorbar;
bar.Label.String = 'Intensity (counts)';
axis square;
axis xy;
ax = gca;
ax.FontSize = 30;
ax.XLim = [-100,100];
ax.YLim = [-100,100];
xticks([-120:20:120]);
yticks([-120:20:120]);
ax.TickDir = 'out';
ax.TickLength = [0.02 0.02];
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.GridLineStyle = '--';
ax.GridAlphaMode = 'manual';
ax.GridAlpha = 0.5;
ax.GridColorMode = 'manual';
ax.GridColor = 'white';

return;
%%
h(3) = figure('Name','Sciles of original vs corrected images','NumberTitle','off');
subplot(2,1,1);
title('Comparison of slices along beam C10');
hold on;
%plot([-79.7:2:159.3],rescale(sum(corr_image_C10_a(50:70,:))),'DisplayName','C10 corrected, central slice 40 mm, achro');
plot([-79.7:2:159.3],rescale(sum(corr_image_C10_a(55:75,:))),'DisplayName','C10 corrected, central slice 40 mm, achro');
plot([-79.7:2:159.3],rescale(sum(corr_image_C10_m(40:80,:))),'DisplayName','C10 corrected, central slice 40 mm, mono');
hold off;
xlabel('Depth in PMMA (mm)');
ylabel('Intensity (counts)');
legend;

subplot(2,1,2);
title('Comparison of slices perpendicular beam C10');
hold on;
plot(range,rescale(sum(corr_image_C10_a(:,60:80),2)),'DisplayName','C10 corrected, slice 40 mm, achro');
plot(range,rescale(sum(corr_image_C10_m(:,60:80),2)),'DisplayName','C10 corrected, slice 40 mm, mono');
hold off;
xlabel('X (mm)');
ylabel('Intensity (a.u.)');
legend;
return;
%%
h(4) = figure('Name','Sciles of original vs corrected images','NumberTitle','off');
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
h(5) = figure;
sgtitle('Expected range ~39 mm range of carbons, achro mode of FRS for 10,12C, mono for 11C');
subplot(2,1,1);
hold on;
plot([-79.7:2:159.3],sum(corr_image_C10(50:70,:)),'DisplayName','C10 corrected, central slice 40 mm');
plot([-79.7:2:159.3],sum(corr_image_C11(50:70,:)),'DisplayName','C11 corrected, central slice 40 mm');
plot([-79.7:2:159.3],sum(corr_image_C12(50:70,:)),'DisplayName','C12 corrected, central slice 40 mm');
hold off;
xlabel('Depth in PMMA (mm)');
ylabel('Intensity (counts)');
legend;
%
subplot(2,1,2);
hold on;
plot([-79.7:2:159.3],rescale(sum(corr_image_C10(50:70,:))),'DisplayName','C10 corrected, central slice 40 mm');
plot([-79.7:2:159.3],rescale(sum(corr_image_C11(50:70,:))),'DisplayName','C11 corrected, central slice 40 mm');
plot([-79.7:2:159.3],rescale(sum(corr_image_C12(50:70,:))),'DisplayName','C12 corrected, central slice 40 mm');
hold off;
xlabel('Depth in PMMA (mm)');
ylabel('Scaled (a.u.)');
legend;

return;
%% saving all figures into single .fig
savefig(h,'Q:\Documents\PET\MATLAB_figures_PET\Sens_corr_carbons_lower_energ.fig');
close(h);

return;
%% DEBUG
mesh(xq,yq,corr_image_C10)
xlabel('X (mm)');
ylabel('Y (mm)');
zlabel('Intensity [counts]');
%set(gca,'ColorScale','log');
colorbar;
total_act_counts = sum(corr_image_C10,'all', 'omitnan')
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