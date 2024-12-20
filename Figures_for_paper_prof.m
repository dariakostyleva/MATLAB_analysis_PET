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

fig_C12a = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_017_figs\C12_017_red_spilloff_image_212c_corr.fig','invisible');
arr_C12a = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C12ae = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_017_figs\C12_017_red_spilloff_image_212c_corr_err.fig','invisible');
arr_C12ae = get(get(gca,'Children'),'CData');
fig_C12a_unc = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_017_figs\C12_017_red_spilloff_image_212c.fig','invisible');
arr_C12a_unc = get(get(gca,'Children'),'CData'); % getting data from figure as an array

%%%%%%%%%%%%%%%%%%     Carbons higher energy, EXPECTED RANGE PMMA 102.6 mm    %%%%%%%%%%%%%%%%%%%
fig_C10ah = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_001_figs\C10_001_red_image_248c_corr.fig','invisible');
arr_C10ah = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C10aeh = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_001_figs\C10_001_red_image_248c_corr_err.fig','invisible');
arr_C10aeh = get(get(gca,'Children'),'CData');

fig_C10mh = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_003_figs\C10_003_red_image_248c_corr','invisible');
arr_C10mh = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C10meh = openfig('Q:\Documents\PET\MATLAB_figures_PET\C10_003_figs\C10_003_red_image_248c_corr_err.fig','invisible');
arr_C10meh = get(get(gca,'Children'),'CData');

fig_C11ah = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\C11_007_red_spilloff_image_503c_corr.fig','invisible');
arr_C11ah = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C11aeh = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_007_figs\C11_007_red_spilloff_image_503c_corr_err.fig','invisible');
arr_C11aeh = get(get(gca,'Children'),'CData');

fig_C11mh = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_008_figs\C11_008_red_image_corr.fig','invisible');
arr_C11mh = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C11meh = openfig('Q:\Documents\PET\MATLAB_figures_PET\C11_008_figs\C11_008_red_image_corr_err.fig','invisible');
arr_C11meh = get(get(gca,'Children'),'CData');

fig_C12ah = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_923c_corr.fig','invisible');
arr_C12ah = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C12ah_unc = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_923c.fig','invisible');
arr_C12ah_unc = get(get(gca,'Children'),'CData'); % getting data from figure as an array
fig_C12aeh = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_923c_corr_err.fig','invisible');
arr_C12aeh = get(get(gca,'Children'),'CData');


xx = [-119:2:119];
yy = [-119:2:119];
depth_pmma_le = [-79.7:2:159.3]; % scale for x axis in mm lower energy
depth_pmma_he = [-16.4:2:222.6]; % scale for x axis in mm higher energy
depth_pmma_C10_14_le = [-76.4:2:162.6]; % scale for x axis in mm lower energy IC forgotten
depth_pmma_C12_18_he = [-49:2:190];
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
plot(depth_pmma_le,sum(arr_C10m(40:80,:))./max(sum(arr_C10m(40:80,:))),'-o','DisplayName','C10');
plot(depth_pmma_le,sum(arr_C11a(40:80,:))./max(sum(arr_C11a(40:80,:))),'-o','DisplayName','C11');
plot(depth_pmma_le,sum(arr_C12a(40:80,:))./max(sum(arr_C12a(40:80,:))),'-o','DisplayName','C12');
plot(depth_pmma_le,sum(arr_C12a_unc(40:80,:))./max(sum(arr_C12a_unc(40:80,:))),'-o','DisplayName','C12 uncorr');
plot(depth_pmma_le,sum(arr_C11a_unc(40:80,:))./max(sum(arr_C11a_unc(40:80,:))),'-o','DisplayName','C11 uncorr');


hold off;
%plot(depth_PMMA_bp_C12,rescale(dose_C12),'DisplayName','C12 dose');
%plot(wc_C12_depth,rescale(wc_C12_dose),'DisplayName','C12 WC');
ax = gca;
ax.FontSize = 14;
ax.XLim = [-5,130];
ax.YLim = [0,1.1];
xlabel('Depth in PMMA (mm)');
ylabel('Coincidence events (a.u.)');
legend
%clear all;
%return;

subplot(2,1,2);
hold on
plot(depth_pmma_he,sum(arr_C10ah(40:80,:))./max(sum(arr_C10ah(40:80,:))),'-o','DisplayName','C10');
plot(depth_pmma_he,sum(arr_C11ah(40:80,:))./max(sum(arr_C11ah(40:80,:))),'-o','DisplayName','C11');
% plot(depth_pmma_he,rescale(sum(arr_C10ah(40:80,:),'omitnan')),'-o','DisplayName','C10');
% plot(depth_pmma_he,rescale(sum(arr_C11ah(40:80,:),'omitnan')),'-o','DisplayName','C11 achro');
%plot(depth_pmma_he,rescale(sum(arr_C11mh(40:80,:),'omitnan')),'-o','DisplayName','C11 mono');
%plot(depth_pmma_C12_18_he,rescale(sum(arr_C12ah(40:80,:),'omitnan')),'-o','DisplayName','C12');
plot(depth_pmma_C12_18_he,sum(arr_C12ah(40:80,:))./max(sum(arr_C12ah(40:80,:))),'-o','DisplayName','C12');
plot(depth_pmma_C12_18_he,sum(arr_C12ah_unc(40:80,:))./max(sum(arr_C12ah_unc(40:80,:))),'-o','DisplayName','C12 uncorr');

%plot(depth_PMMA_bp_C12,rescale(dose_C12),'DisplayName','C12 dose');
%plot(wc_C12_depth,rescale(wc_C12_dose),'DisplayName','C12 WC');
hold off;
ax = gca;
ax.FontSize = 14;
ax.XLim = [-5,130];
ax.YLim = [0,1.1];
xlabel('Depth in PMMA (mm)');
ylabel('Coincidence events (a.u.)');
legend


figure;
hold on;
plot(depth_pmma_C12_18_he,sum(arr_C12ah(40:80,:))./sum(arr_C12ah(40:80,61)),'-o','DisplayName','C12 corr');
plot(depth_pmma_C12_18_he,sum(arr_C12ah_unc(40:80,:))./sum(arr_C12ah_unc(40:80,61)),'-o','DisplayName','C12 uncorr');
legend


return;
figure
subplot(2,1,1)
hold on
%plot(depth_pmma_he,sum(arr_C10ah(40:80,:))./max(sum(arr_C10ah(40:80,:))),'-o','DisplayName','C10 ./max');
%plot(depth_pmma_he,rescale(sum(arr_C10ah(40:80,:))),'-o','DisplayName','C10 rescale');
plot(depth_pmma_le,sum(arr_C12a(40:80,:))./max(sum(arr_C12a(40:80,:))),'-o','DisplayName','C12 ./max');
plot(depth_pmma_le,rescale(sum(arr_C12a(40:80,:))),'-o','DisplayName','C12 rescaled');
legend

subplot(2,1,2)
hold on
plot(depth_pmma_C12_18_he,sum(arr_C12ah(40:80,:),'omitnan')./max(sum(arr_C12ah(40:80,:))),'-o','DisplayName','C12 ./max');
plot(depth_pmma_C12_18_he,rescale(sum(arr_C12ah(40:80,:))),'-o','DisplayName','C12 rescaled');
plot(depth_pmma_C12_18_he,rescale(sum(arr_C12ah(40:80,:),'omitnan')),'-o','DisplayName','C12 rescaled omitnan');
legend

arr3 = sum(arr_C12ah(40:80,:))./max(sum(arr_C12ah(40:80,:)))
arr1 = (sum(arr_C12ah(40:80,:))-min(sum(arr_C12ah(40:80,:))))./(max(sum(arr_C12ah(40:80,:))) - min(sum(arr_C12ah(40:80,:))))
arr2 = (sum(arr_C12ah(40:80,:),'omitnan')-min(sum(arr_C12ah(40:80,:),'omitnan')))./(max(sum(arr_C12ah(40:80,:),'omitnan')) - min(sum(arr_C12ah(40:80,:),'omitnan')))

arr1 = arr1'
arr2 = arr2'

figure;
hold on
plot(depth_pmma_C12_18_he,arr1,'-o','DisplayName','formula from build-in rescaling in Matlab without Omitnan option')
plot(depth_pmma_C12_18_he,arr2,'-o','DisplayName','formula from build-in rescaling in Matlab with Omitnan option')
plot(depth_pmma_C12_18_he,arr3,'-o','DisplayName','dividing by maximum')
legend;

%%

figure;
hold on;
plot([-16.4:2:222.6],sum(arr_C11ah(40:80,:))./max(sum(arr_C11ah(40:80,:))),'-o','DisplayName','C11 ');
plot([-19.1:2:219.9],sum(arr_C11ah(40:80,:))./max(sum(arr_C11ah(40:80,:))),'-o','DisplayName','C11 shifted');
plot([-49:2:190],sum(arr_C12ah(40:80,:))./max(sum(arr_C12ah(40:80,:))),'-o','DisplayName','C12');
plot([-51.7:2:187.3],sum(arr_C12ah(40:80,:))./max(sum(arr_C12ah(40:80,:))),'-o','DisplayName','C12 shifted');
hold off;
ax = gca;
ax.XLim = [-10,110];
legend;



data = [depth_pmma_le',sum(arr_C10m(40:80,:))]

return;

data_C10_le = [depth_pmma_le',rescale(sum(arr_C10m(40:80,:),'omitnan'))'];
data_C11_le = [depth_pmma_le',rescale(sum(arr_C11a(40:80,:),'omitnan'))'];
data_C12_le = [depth_pmma_le',rescale(sum(arr_C12a(40:80,:),'omitnan'))'];
data_C10_he = [depth_pmma_he',rescale(sum(arr_C10ah(40:80,:),'omitnan'))'];
data_C11_he = [depth_pmma_he',rescale(sum(arr_C11ah(40:80,:),'omitnan'))'];
data_C12_he = [depth_pmma_C12_18_he',rescale(sum(arr_C12ah(40:80,:),'omitnan'))'];
return;
data = [data_C10_le data_C11_le data_C12_le data_C10_he data_C11_he data_C12_he];
writematrix(data,'activity_prof.xlsx');



