%%%%%%%%%%%%%%%%%% Script for putting profiles for presenation

%%%%%%%%%%%%%%%%%%     Carbons lower energy, EXPECTED RANGE PMMA 39.3 mm    %%%%%%%%%%%%%%%%%%%
%fig_C10a = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_001_figs\C10_001_red_image_248c_corr.fig','invisible');
fig_C10a = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_corr.fig','invisible');
arr_C10a = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C10ae = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_014_figs\C10_014_red_image_corr_err.fig','invisible');
%fig_C10ae = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_001_figs\C10_001_red_image_248c_corr_err.fig','invisible');
arr_C10ae = get(get(gca,'Children'),'CData');

fig_C10m = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_015_figs\C10_015_red_image_corr','invisible');
arr_C10m = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C10me = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_015_figs\C10_015_red_image_corr_err.fig','invisible');
arr_C10me = get(get(gca,'Children'),'CData');

fig_C11a = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_518c_corr.fig','invisible');
arr_C11a = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C11ae = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_518c_corr_err.fig','invisible');
arr_C11ae = get(get(gca,'Children'),'CData');
fig_C11a_unc = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_figs\C11_012_red_spilloff_image_518c.fig','invisible');
arr_C11a_unc = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C11a_unc_old = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_012_red_spilloff_old_image.fig','invisible');
arr_C11a_unc_old = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_C12a = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_017_figs\C12_017_red_spilloff_image_212c_corr.fig','invisible');
arr_C12a = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C12ae = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_017_figs\C12_017_red_spilloff_image_212c_corr_err.fig','invisible');
arr_C12ae = get(get(gca,'Children'),'CData');
fig_C12a_unc = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_017_figs\C12_017_red_spilloff_image_212c.fig','invisible');
arr_C12a_unc = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_C12a_unc_old = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_017_red_spilloff_old_image.fig','invisible');
arr_C12a_unc_old = get(get(gca,'Children'),'CData'); % getting data from figure as an array


%%%%%%%%%%%%%%%%%%     Carbons higher energy, EXPECTED RANGE PMMA 102.6 mm    %%%%%%%%%%%%%%%%%%%
fig_C10ah = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_001_figs\C10_001_red_image_248c_corr.fig','invisible');
arr_C10ah = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_C10mh = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_003_figs\C10_003_red_image_248c_corr','invisible');
arr_C10mh = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_C11ah = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\C11_007_red_spilloff_image_503c_corr.fig','invisible');
arr_C11ah = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C11ah_unc = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\C11_007_red_spilloff_image_503c.fig','invisible');
arr_C11ah_unc = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C11ah_unc_old = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_red_spilloff_old_image.fig','invisible');
arr_C11ah_unc_old = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_C11mh = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_008_figs\C11_008_red_image_corr.fig','invisible');
arr_C11mh = get(get(gca,'Children'),'CData'); % getting data from figure as an array

fig_C12ah = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_923c_corr.fig','invisible');
arr_C12ah = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C12ah_unc = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_923c.fig','invisible');
arr_C12ah_unc = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C12ah_old = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_red_spilloff_old_image.fig','invisible');
arr_C12ah_old = get(get(gca,'Children'),'CData'); % getting data from figure as an array

%%
fig_Ge = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0012_red_image_corr.fig','invisible');
arr_Ge = get(get(gca,'Children'),'CData'); % getting data from figure as an array



xx = [-119:2:119];
yy = [-119:2:119];
depth_pmma_le = [-79.7:2:159.3]; % scale for x axis in mm lower energy
depth_pmma_he = [-16.4:2:222.6]; % scale for x axis in mm higher energy
depth_pmma_C10_14_le = [-76.4:2:162.6]; % scale for x axis in mm lower energy IC forgotten
depth_pmma_C12_18_he = [-49:2:190]
%depth_pmma_C12_18_he_old = [-34:2:173];
set(0, 'DefaultLineLineWidth', 1.5);


figure;
subplot(2,1,1);
hold on
% errorbar(depth_pmma,sum(arr_C10a(50:70,:),'omitnan'),sqrt(sum(power(arr_C10ae(50:70,:),2),1,'omitnan')),'DisplayName','C10');
% errorbar(depth_pmma,sum(arr_C11a(50:70,:),'omitnan'),sqrt(sum(power(arr_C11ae(50:70,:),2),1,'omitnan')),'DisplayName','C11');
% errorbar(depth_pmma,sum(arr_C12a(50:70,:),'omitnan'),sqrt(sum(power(arr_C12ae(50:70,:),2),1,'omitnan')),'DisplayName','C12');
%plot(depth_pmma_C10_14,rescale(sum(arr_C10a(40:80,:),'omitnan')),'DisplayName','C10 achro corr');
%plot(depth_pmma,rescale(sum(arr_C10a(40:80,:),'omitnan')),'--','DisplayName','C10 achro old');
% plot(depth_pmma_le,rescale(sum(arr_C10m(40:80,:),'omitnan')),'-o','DisplayName','C10');
% plot(depth_pmma_le,rescale(sum(arr_C11a(40:80,:),'omitnan')),'-o','DisplayName','C11');
% plot(depth_pmma_le,rescale(sum(arr_C12a(40:80,:),'omitnan')),'-o','DisplayName','C12');
%plot(depth_pmma_le,sum(arr_C10m(40:80,:))./max(sum(arr_C10m(40:80,:))),'-o','DisplayName','C10');
%plot(depth_pmma_le,sum(arr_C11a(40:80,:))./max(sum(arr_C11a(40:80,:))),'-o','DisplayName','C11');
%plot(depth_pmma_le,sum(arr_C12a(40:80,:))./max(sum(arr_C12a(40:80,:))),'-o','DisplayName','C12');

plot(depth_pmma_le,sum(arr_C11a_unc(40:80,:))./max(sum(arr_C11a_unc(40:80,:))),'-o','DisplayName','curved recon C11 uncorr');
plot(depth_pmma_le,sum(arr_C11a_unc_old(40:80,:))./max(sum(arr_C11a_unc_old(40:80,:))),'-o','DisplayName','flat recon C11 uncorr');
plot(depth_pmma_le,sum(arr_C12a_unc(40:80,:))./max(sum(arr_C12a_unc(40:80,:))),'-o','DisplayName','C12 uncorr');
plot(depth_pmma_le,sum(arr_C12a_unc_old(40:80,:))./max(sum(arr_C12a_unc_old(40:80,:))),'-o','DisplayName','flat recon C12 uncorr');

hold off;
%plot(depth_PMMA_bp_C12,rescale(dose_C12),'DisplayName','C12 dose');
%plot(wc_C12_depth,rescale(wc_C12_dose),'DisplayName','C12 WC');
ax = gca;
ax.FontSize = 14;
%ax.XLim = [-5,130];
ax.YLim = [0,1.1];
xlabel('Depth in PMMA (mm)');
ylabel('Coincidence events (a.u.)');
legend
%set(gca, 'YScale', 'log')
%clear all;
%return;

subplot(2,1,2);
hold on
%plot(depth_pmma_he,sum(arr_C10ah(40:80,:))./max(sum(arr_C10ah(40:80,:))),'-o','DisplayName','C10');
plot(depth_pmma_he,sum(arr_C11ah_unc(40:80,:))./max(sum(arr_C11ah_unc(40:80,:))),'-o','DisplayName','curved recon C11 uncorr');
plot(depth_pmma_he,sum(arr_C11ah_unc_old(40:80,:))./max(sum(arr_C11ah_unc_old(40:80,:))),'-o','DisplayName','flat recon C11 uncorr');
% plot(depth_pmma_he,rescale(sum(arr_C10ah(40:80,:),'omitnan')),'-o','DisplayName','C10');
% plot(depth_pmma_he,rescale(sum(arr_C11ah(40:80,:),'omitnan')),'-o','DisplayName','C11 achro');
%plot(depth_pmma_he,rescale(sum(arr_C11mh(40:80,:),'omitnan')),'-o','DisplayName','C11 mono');
%plot(depth_pmma_C12_18_he,rescale(sum(arr_C12ah(40:80,:),'omitnan')),'-o','DisplayName','C12');
%plot(depth_pmma_C12_18_he,sum(arr_C12ah(40:80,:))./max(sum(arr_C12ah(40:80,:))),'-o','DisplayName','C12');
plot(depth_pmma_C12_18_he,sum(arr_C12ah_unc(40:80,:))./max(sum(arr_C12ah_unc(40:80,:))),'-o','DisplayName','curved recon C12 uncorr');
plot(depth_pmma_C12_18_he,sum(arr_C12ah_old(40:80,:))./max(sum(arr_C12ah_old(40:80,:))),'-o','DisplayName','flat recon C12 uncorr');
%plot(depth_PMMA_bp_C12,rescale(dose_C12),'DisplayName','C12 dose');
%plot(wc_C12_depth,rescale(wc_C12_dose),'DisplayName','C12 WC');
hold off;
ax = gca;
ax.FontSize = 14;
%ax.XLim = [-5,130];
ax.YLim = [0,1.1];
xlabel('Depth in PMMA (mm)');
ylabel('Coincidence events (a.u.)');
legend
%set(gca, 'YScale', 'log')

data_C10_le = [depth_pmma_le',rescale(sum(arr_C10m(40:80,:),'omitnan'))'];
data_C11_le = [depth_pmma_le',rescale(sum(arr_C11a(40:80,:),'omitnan'))'];
data_C12_le = [depth_pmma_le',rescale(sum(arr_C12a(40:80,:),'omitnan'))'];
data_C10_he = [depth_pmma_he',rescale(sum(arr_C10ah(40:80,:),'omitnan'))'];
data_C11_he = [depth_pmma_he',rescale(sum(arr_C11ah(40:80,:),'omitnan'))'];
data_C12_he = [depth_pmma_C12_18_he',rescale(sum(arr_C12ah(40:80,:),'omitnan'))'];

%%
figure;
hold on;
plot(depth_pmma_C12_18_he,sum(arr_C12ah_unc(40:80,:))./max(sum(arr_C12ah_unc(40:80,:))),'-o','DisplayName','curved recon C12 uncorr');
plot(depth_pmma_C12_18_he,sum(arr_C12ah_old(40:80,:))./max(sum(arr_C12ah_old(40:80,:))),'-o','DisplayName','flat recon C12 uncorr');
legend;


figure;
plot(depth_pmma_C12_18_he, sum(arr_Ge(40:80,:)),'-o','DisplayName','Ge line source, PMMA pin 2');
return;
sum_C12ah = sum(arr_C12ah(40:80,:));
sum_C12ah_unc = sum(arr_C12ah_unc(40:80,:));

figure;
hold on;
plot(depth_pmma_C12_18_he,sum(arr_C12ah(40:80,:))./sum_C12ah(60),'-o','DisplayName','C12');
plot(depth_pmma_C12_18_he,sum(arr_C12ah_unc(40:80,:))./sum_C12ah_unc(60),'-o','DisplayName','C12 uncorr');

% for Hans and Emma

figure;
hold on;
plot(depth_pmma_le,sum(arr_C10m(40:80,:)),'-o','DisplayName','C10');
plot(depth_pmma_le,sum(arr_C11a(40:80,:)),'-o','DisplayName','C11');
plot(depth_pmma_le,sum(arr_C12a(40:80,:)),'-o','DisplayName','C12');
hold off;


return;
figure
subplot(2,2,1)
%surf(map)
subplot(2,2,2)
surf(arr_C12ah_unc)
subplot(2,2,3)
surf(arr_C12ah)


data = [data_C10_le data_C11_le data_C12_le data_C10_he data_C11_he data_C12_he];
writematrix(data,'activity_prof.xlsx');



