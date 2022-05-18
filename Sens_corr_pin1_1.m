%%% Pin 1_1 is PMMA position 200.7 mm from braket for Carbon lower energ with 39 mm range %%%
% This script: 
% 1. divides image [counts] by the abs sensitivity map [dimensionless]
% 2. Resulting corrected images are in [counts].
% 3. Errors of image are sqrt(counts)/map
%%%%

range = [-119:2:119];
%%% Load the sensitivity map
map = load('sens_corr_map_pin_1_1.mat'); % map is dimensionless
map = map.map;
filepath = 'Q:\Documents\PET\MATLAB_figures_PET\C12_017_figs\';  
%name = 'C10_014_red_image_4c'; 
%name = 'C11_012_red_spillon_image_4c'; 
name = 'C12_017_red_image_70c'; 
ext = '.fig';
fig_image_name = append(filepath,name,ext);
openfig(fig_image_name,'invisible');
image = get(get(gca,'Children'),'CData'); % getting data from figure as an array, in [counts]
corr_image = image./map; % corrected image in [counts]
fprintf('In file %s \n there are %d decays \n',fig_image_name,sum(corr_image,'all','omitnan'));
cimage = imagesc(range,range,corr_image);
figname = strcat(filepath,name,'_corr.fig');
saveas(cimage, figname);
err_counts = sqrt(image);
err_image = err_counts./map;
cerr = imagesc(range,range,err_image);
figname_err = strcat(filepath,name,'_corr_err.fig');
saveas(cerr, figname_err);

return;

depth_pmma = [-79.7:2:159.3]; % scale for x axis in mm
image_C10 = zeros(120,120);
image_C11 = zeros(120,120);
image_C12 = zeros(120,120);

%%% 22Na source info 
% from literature its branching ratio is 90.30(9) percent
br = 0.9030; 
e_br = 0.0009;

%%% Interpolate
% % grid of query points for interpolation
% [xq,yq] = meshgrid(linspace(-119,119,120),linspace(-119,119,120));
% pin1_1.ar(:,4) = pin1_1.ar(:,4)*10^(-3)/br; % making sensitivity dimensionless plus corr on br ratio
% pin1_1.ar(:,7) = sqrt(pin1_1.ar(:,7).^2 + e_br^2)*10^(-3); % making abs error on sensitivity dimensionless plus corr on br ratio
% %err_map = max(ar(:,7));
% map = griddata(pin1_1.ar(:,1),pin1_1.ar(:,2),pin1_1.ar(:,4),xq,yq); % map is dimensionless
% %err_map = griddata(pin1_1.ar(:,1),pin1_1.ar(:,2),pin1_1.ar(:,7),xq,yq); % abs error bar map is dimensionless 

% C11 MONO spill off 
fig_C11 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_red_spilloff_image_10sec.fig','invisible');
%time_C11 = 3600.077; % file duration in [sec]
%image_C11 = arr_C11/time_C11; % image in [counts/sec]
arr_C11 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
image_C11 = arr_C11; % image in [counts]
corr_image_C11 = image_C11./map; % image in [counts]
total_C11 = sum(corr_image_C11,'all','omitnan')
cimage_C11 = imagesc(range,range,corr_image_C11)
saveas(cimage_C11, 'Q:\Documents\PET\MATLAB_figures_PET\C11_012_red_spilloff_image_10sec_corr.fig');
close all;
err_counts_C11 = sqrt(arr_C11);
err_image_C11 = err_counts_C11./map;
cerr_C11 = imagesc(range,range,err_image_C11);
saveas(cerr_C11, 'Q:\Documents\PET\MATLAB_figures_PET\C11_012_red_spilloff_image_10sec_corr_err.fig');
return;

%%% open images to be corrected
% C10 achro spill off 
%fig_C10 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_red_image.fig','invisible');
fig_C10 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_red_spilloff_image.fig','invisible');
arr_C10 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
%time_C10 = 1200.035; % file duration in [sec]
%image_C10 = arr_C10/time_C10; % image in [counts/sec]
image_C10 = arr_C10; % image in [counts]
corr_image_C10 = image_C10./map; % image in [counts]
total_C10 = sum(corr_image_C10,'all','omitnan')
cimage_C10 = imagesc(range,range,corr_image_C10)
%saveas(cimage_C10, 'Q:\Documents\PET\MATLAB_figures_PET\C10_014_red_image_corr.fig');
close all;

% C12 achro spill off
fig_C12 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_017_red_spilloff_image.fig','invisible');
%fig_C12 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_017_red_image.fig','invisible');
%time_C12 = 3599.567; % file duration in [sec]
%image_C12 = arr_C12/time_C12; % image in [counts/sec]
arr_C12 = get(get(gca,'Children'),'CData'); % getting data from figure as an array
image_C12 = arr_C12; % image in [counts]
corr_image_C12 = image_C12./map; % image in [counts]
total_C12 = sum(corr_image_C12,'all','omitnan')
cimage_C12 = imagesc(range,range,corr_image_C12)
%saveas(cimage_C12,'Q:\Documents\PET\MATLAB_figures_PET\C12_017_red_image_corr.fig');
close all;


%% ERROR calculation and propagation

err_counts_C10 = sqrt(arr_C10);
err_counts_C11 = sqrt(arr_C11);
err_counts_C12 = sqrt(arr_C12);
% if adding systematic error coming from source measurements
%err_image_C10 = sqrt( power(err_map./map,2) + power(err_counts_C10./arr_C10,2) ).*corr_image_C10;
%err_image_C11 = sqrt( power(err_map./map,2) + power(err_counts_C11./arr_C11,2) ).*corr_image_C11;
%err_image_C12 = sqrt( power(err_map./map,2) + power(err_counts_C12./arr_C12,2) ).*corr_image_C12;
% if only statistical error is included
err_image_C10 = err_counts_C10./map;
err_image_C11 = err_counts_C11./map;
err_image_C12 = err_counts_C12./map;


%%
% Start ploting

%plotting errors
figure;
subplot(3,1,1);
errorbar(depth_pmma,sum(corr_image_C10(50:70,:)),sqrt(sum(power(err_image_C10(50:70,:),2),1,'omitnan')),'DisplayName','C10 corr, stat errors, central slice 40 mm');
xlabel('Depth in PMMA (mm)');
ylabel('Intensity (counts)');
legend;
subplot(3,1,2);
errorbar(depth_pmma,sum(corr_image_C11(50:70,:)),sqrt(sum(power(err_image_C11(50:70,:),2),1,'omitnan')),'DisplayName','C11 corr, stat errors, central slice 40 mm');
xlabel('Depth in PMMA (mm)');
ylabel('Intensity (counts)');
legend;
subplot(3,1,3);
errorbar(depth_pmma,sum(corr_image_C12(50:70,:)),sqrt(sum(power(err_image_C12(50:70,:),2),1,'omitnan')),'DisplayName','C12 corr, stat errors, central slice 40 mm');
xlabel('Depth in PMMA (mm)');
ylabel('Intensity (counts)');
legend;
return;
C10_data = [depth_pmma',sum(corr_image_C10(50:70,:))',sqrt(sum(power(err_image_C10(50:70,:),2),1,'omitnan'))'];
writematrix(C10_data,'C10_lower_en_peak_corr_no_syst.csv');
C12_data = [depth_pmma',sum(corr_image_C12(50:70,:))',sqrt(sum(power(err_image_C12(50:70,:),2),1,'omitnan'))'];
writematrix(C12_data,'C12_lower_en_peak_corr.csv');
C11_data = [depth_pmma',sum(corr_image_C11(50:70,:))',sqrt(sum(power(err_image_C11(50:70,:),2),1,'omitnan'))'];
writematrix(C11_data,'C11_lower_en_peak_corr.csv');
return;
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
h(2) = figure('Name','Original vs corrected images','NumberTitle','off');
sgtitle('Original vs corrected images','Interpreter', 'none');
subplot(3,2,1);
imagesc(range,range,image_C10);
bar = colorbar;
bar.Label.String = 'Intensity (counts)';
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
bar.Label.String = 'Intensity (counts)';
%
subplot(3,2,3);
imagesc(range,range,image_C11);
xlabel('X (mm)');
ylabel('Y (mm)');
title('image_C11','Interpreter', 'none');
set(gca,'ColorScale','log');
bar = colorbar;
bar.Label.String = 'Intensity (counts)';
%
subplot(3,2,4);
corr_image = imagesc(range,range,corr_image_C11);
xlabel('X (mm)');
ylabel('Y (mm)');
title('corr_image_C11','Interpreter', 'none');
set(gca,'ColorScale','log');
bar = colorbar;
bar.Label.String = 'Intensity (counts)';
%
subplot(3,2,5);
imagesc(range,range,image_C12);
xlabel('X (mm)');
ylabel('Y (mm)');
title('image_C12','Interpreter', 'none');
set(gca,'ColorScale','log');
bar = colorbar;
bar.Label.String = 'Intensity (counts)';
%
subplot(3,2,6);
corr_image = imagesc(range,range,corr_image_C12);
xlabel('X (mm)');
ylabel('Y (mm)');
title('corr_image_C12','Interpreter', 'none');
set(gca,'ColorScale','log');
bar = colorbar;
bar.Label.String = 'Intensity (counts)';

%%
h(3) = figure('Name','Sciles of original vs corrected images','NumberTitle','off');
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
plot(depth_pmma,sum(corr_image_C10(50:70,:)),'DisplayName','C10 corrected, central slice 40 mm');
plot(depth_pmma,sum(corr_image_C11(50:70,:)),'DisplayName','C11 corrected, central slice 40 mm');
plot(depth_pmma,sum(corr_image_C12(50:70,:)),'DisplayName','C12 corrected, central slice 40 mm');
hold off;
xlabel('Depth in PMMA (mm)');
ylabel('Intensity (counts)');
legend;
%
subplot(2,1,2);
hold on;
plot(depth_pmma,rescale(sum(corr_image_C10(50:70,:))),'DisplayName','C10 corrected, central slice 40 mm');
plot(depth_pmma,rescale(sum(corr_image_C11(50:70,:))),'DisplayName','C11 corrected, central slice 40 mm');
plot(depth_pmma,rescale(sum(corr_image_C12(50:70,:))),'DisplayName','C12 corrected, central slice 40 mm');
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