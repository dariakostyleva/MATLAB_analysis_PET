% combines 2d matrix from 2d matrices of parallel and perdenpicular
% positions of sources
fig_41 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0041_red_image.fig');
image_41 = get(get(gca,'Children'),'CData');

fig_O16 = openfig('Q:\Documents\PET\MATLAB_figures_PET\O16_005_red_image.fig');
image_O16 = get(get(gca,'Children'),'CData'); % getting data from figure as an array

file_paral = load('map_from_parall.mat');
file_perp = load('map_from_perpendic.mat');

array_par = file_paral.comb_scaled;
array_per = file_perp.comb_scaled;

% linear interpolation of 56x56 array into 120x120 array with final pixelation
comb_map_2d = array_par.*array_per';
[Xs2,Ys2] = ndgrid(1:1:56);
[Xq2,Yq2] = ndgrid([linspace(1,56,120)]);
F2 = griddedInterpolant(Xs2,Ys2,comb_map_2d);
comb_map_2d_interp = F2(Xq2,Yq2); % this is final sensitivity map!

figure;
subplot(3,3,1);
surf(array_per);
title('');
xlim([0 56]);
ylim([0 56]);

subplot(3,3,2);
surf(array_par);
title('');
xlim([0 56]);
ylim([0 56]);

subplot(3,3,3);
surf(comb_map_2d_interp);
title('Projections interpolated within pm5 and extrapolated outside in 2d');
xlim([0 120]);
ylim([0 120]);

subplot(3,3,4);
xx = [-119:2:119];
yy = [-119:2:119];
corr_img = imagesc(xx,yy,image_41./comb_map_2d_interp);
title('Corrected image using matrix from combined data');
set(gca,'ColorScale','log');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');

subplot(3,3,5);
xx = [-119:2:119];
yy = [-119:2:119];
corr_img = imagesc(xx,yy,image_O16./comb_map_2d_interp);
title('Corrected image using matrix from combined data');
set(gca,'ColorScale','log');
axis square;
axis xy;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');

subplot(3,3,7);
hold on;
plot(xx,rescale(sum(image_41, 2)),'DisplayName','Projection of uncorrected image of source');
plot(xx,rescale(sum(image_41./comb_map_2d_interp, 2)),'DisplayName','Projection of corrected image of source');
hold off;
xlabel('X (mm)');
ylabel('Counts');
set(gca,'ColorScale','log');
legend;

subplot(3,3,8);
hold on;
plot(xx,rescale(sum(image_O16, 1)),'DisplayName','Projection of uncorrected image of 16O');
plot(xx,rescale(sum(image_O16./comb_map_2d_interp, 1)),'DisplayName','Projection of corrected image of 16O');
hold off;
xlabel('X (mm)');
ylabel('Counts');
set(gca,'ColorScale','log');
legend;
