%% Figures for paper

fig_C10a = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_001_figs\C10_001_red_image_248c_corr.fig','invisible');
arr_C10a = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C10ae = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_001_figs\C10_001_red_image_248c_corr_err.fig','invisible');
arr_C10ae = get(get(gca,'Children'),'CData');

fig_C10m = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_003_figs\C10_003_red_image_248c_corr','invisible');
arr_C10m = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C10me = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_003_figs\C10_003_red_image_248c_corr_err.fig','invisible');
arr_C10me = get(get(gca,'Children'),'CData');

fig_C11a = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\C11_007_red_spilloff_image_503c_corr.fig','invisible');
arr_C11a = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C11ae = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\C11_007_red_spilloff_image_503c_corr_err.fig','invisible');
arr_C11ae = get(get(gca,'Children'),'CData');

fig_C12a = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_923c_corr.fig','invisible');
arr_C12a = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C12ae = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_923c_corr_err.fig','invisible');
arr_C12ae = get(get(gca,'Children'),'CData');

fig_C10a_le = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_corr.fig','invisible');
arr_C10a_le = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C10ae_le = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_corr_err.fig','invisible');
arr_C10ae_le = get(get(gca,'Children'),'CData');

fig_C10m_le = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_015_figs\C10_015_red_image_corr','invisible');
arr_C10m_le = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C10me_le = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_015_figs\C10_015_red_image_corr_err.fig','invisible');
arr_C10me_le = get(get(gca,'Children'),'CData');

fig_C11a_le = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_518c_corr.fig','invisible');
arr_C11a_le = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C11ae_le = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_518c_corr_err.fig','invisible');
arr_C11ae_le = get(get(gca,'Children'),'CData');

fig_C12a_le = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_017_figs\C12_017_red_spilloff_image_212c_corr.fig','invisible');
arr_C12a_le = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C12ae_le = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_017_figs\C12_017_red_spilloff_image_212c_corr_err.fig','invisible');
arr_C12ae_le = get(get(gca,'Children'),'CData');

xx = [-119:2:119];
yy = [-119:2:119];
depth_pmma = [-16.4:2:222.6]; % scale for x axis in mm
set(0, 'DefaultLineLineWidth', 1.5);

figure;
subplot(4,2,1);
imagesc(xx,yy,arr_C10a);
%axis square;
axis xy;
xticks([-120:20:50]);
%yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
a = colorbar;
zlabel = ylabel(a,'Coincidence events','FontSize',14);
set(gca,'ColorScale','linear');
ax = gca;
ax.FontSize = 14;
ax.XLim = [-120,50];
ax.YLim = [-40,40];
line([-103 -103],[40 -40],'Color','white','LineStyle','-')
grid on;

subplot(4,2,2);
imagesc(xx,yy,arr_C11a);
axis xy;
xlabel('X (mm)');
ylabel('Y (mm)');
a = colorbar;
zlabel = ylabel(a,'Coincidence events','FontSize',14);
set(gca,'ColorScale','linear');
ax = gca;
ax.FontSize = 14;
xticks([-120:20:50]);
ax.XLim = [-120,50];
ax.YLim = [-40,40];
line([-103 -103],[40 -40],'Color','white','LineStyle','-')
grid on;

subplot(4,2,3);
imagesc(xx,yy,arr_C12a);
axis xy;
xlabel('X (mm)');
ylabel('Y (mm)');
a = colorbar;
zlabel = ylabel(a,'Coincidence events','FontSize',14);
set(gca,'ColorScale','linear');
ax = gca;
ax.FontSize = 14;
xticks([-120:20:50]);
ax.XLim = [-120,50];
ax.YLim = [-40,40];
line([-70 -70],[40 -40],'Color','white','LineStyle','-')
grid on;


subplot(4,2,5);
imagesc(xx,yy,arr_C10a_le);
%axis square;
axis xy;
xticks([-120:20:50]);
yticks([-100:20:100]);
%yticks([-120:20:120]);
xlabel('X (mm)');
ylabel('Y (mm)');
a = colorbar;
zlabel = ylabel(a,'Coincidence events','FontSize',14);
set(gca,'ColorScale','linear');
ax = gca;
ax.FontSize = 14;
ax.XLim = [-50,50];
ax.YLim = [-50,50];
line([-39.3 -39.3],[50 -50],'Color','white','LineStyle','-')
grid on;

subplot(4,2,6);
imagesc(xx,yy,arr_C11a_le);
axis xy;
xlabel('X (mm)');
ylabel('Y (mm)');
a = colorbar;
zlabel = ylabel(a,'Coincidence events','FontSize',14);
set(gca,'ColorScale','linear');
ax = gca;
ax.FontSize = 14;
xticks([-120:20:50]);
yticks([-100:20:100]);
ax.XLim = [-50,50];
ax.YLim = [-50,50];
line([-39.3 -39.3],[50 -50],'Color','white','LineStyle','-')
grid on;

subplot(4,2,7);
imagesc(xx,yy,arr_C12a_le);
axis xy;
xlabel('X (mm)');
ylabel('Y (mm)');
a = colorbar;
zlabel = ylabel(a,'Coincidence events','FontSize',14);
set(gca,'ColorScale','linear');
ax = gca;
ax.FontSize = 14;
xticks([-120:20:50]);
yticks([-100:20:100]);
ax.XLim = [-50,50];
ax.YLim = [-50,50];
line([-39.3 -39.3],[50 -50],'Color','white','LineStyle','-')
grid on;
