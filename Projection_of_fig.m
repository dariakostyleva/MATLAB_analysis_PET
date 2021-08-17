
fig_C11 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_red_image.fig')
arr_C11 = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_C10 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_002_red_image.fig')
arr_C10 = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_C12 = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_017_red_image.fig')
arr_C12 = get(get(gca,'Children'),'CData'); % getting data from figure as an array

figure('Name','Projections','NumberTitle','off');
%set(gca,'position',[100,300,1100,550])
x = [-119:2:119];
y = [-119:2:119];

subplot(3,2,1)
imagesc(x,y,arr_C11); % scales the image according to axis dimensions 
colorbar;
axis square;
axis xy;
ax = gca;
ax.FontSize = 14;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xlabel('X (mm)');
ylabel('Y (mm)');
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

xx = [-119:2:119];
yy = [-119:2:119];

verProj = sum(arr_C11, 2);
horProj_C11 = sum(arr_C11, 1);
horProj_C10 = sum(arr_C10, 1);
horProj_C12 = sum(arr_C12, 1);

subplot(3,2,3);
plot(xx,horProj_C11);
title('Projection along beam from left to right')
xlabel('Projection (mm), FOV at 0');
ylabel('Counts');
full_horProj = findobj(gca,'Type','line');

subplot(3,2,4);
plot(yy,verProj);
title('Projection perpendicular to beam, beam comes into viewer')
xlabel('Projection (mm), FOV at 0');
ylabel('Counts');

subplot(3,2,5);
plot([-16.4:2:222.6],rescale(horProj_C11));
hold on;
plot([-16.4:2:222.6],rescale(horProj_C10));
hold on;
plot([-17:2:222],rescale(horProj_C12));
hold off;
title('Projection along beam from left to right')
xlabel('Depth in PMMA (mm), ');
ylabel('Counts');
full_horProj = findobj(gca,'Type','line');
xticks([-20:10:220]);
xlim([0 140]);
ylim([0 1.2]);
