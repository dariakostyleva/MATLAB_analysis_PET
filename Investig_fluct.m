%%%% script investigation fluctuations in images from DKFZ 68Ge line source
fig_1 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0041_red_image.fig','invisible');
s_dkfz= get(get(gca,'Children'),'CData');
fig_2 = openfig('Q:\Documents\PET\MATLAB_figures_PET\gsi003_red_image.fig','invisible');
s_gron= get(get(gca,'Children'),'CData');
fig_3 = openfig('Q:\Documents\PET\MATLAB_figures_PET\68ge011_red_image.fig','invisible');
s_dkfz2= get(get(gca,'Children'),'CData');

fig_4 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_003_red_image.fig','invisible');
two_source= get(get(gca,'Children'),'CData');

fig_5 = openfig('Q:\Documents\PET\MATLAB_figures_PET\68ge_calib001_red_image.fig','invisible');
febr_source= get(get(gca,'Children'),'CData');
fig_6 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_007_red_image.fig','invisible');
june_source= get(get(gca,'Children'),'CData');
fig_7 = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_007_red_image_reconstr_old.fig','invisible');
june_source_old= get(get(gca,'Children'),'CData');

% fig_7 = openfig('Q:\Documents\PET\MATLAB_figures_PET\_red_image.fig','invisible');
% febr_source2= get(get(gca,'Children'),'CData');
% fig_8 = openfig('Q:\Documents\PET\MATLAB_figures_PET\68ge_calib059_red_image.fig','invisible');
% febr_source3= get(get(gca,'Children'),'CData');

time_s_gron = 64.496;
time_s_dkfz = 200.949;
x = [0:1:120];
y = [0:1:120];
figure;
subplot(2,3,1);
imagesc(x,y,s_dkfz);
subplot(2,3,2);
imagesc(x,y,s_gron);
subplot(2,3,3);
hold on;
plot(s_dkfz(:,61)/max(s_dkfz(:,61)));
plot(s_gron(:,61)/max(s_gron(:,61)));
%set(gca, 'YScale', 'log')
hold off;
subplot(2,3,4);
ft=fittype('a+b*x'); 
fit_dkfz = fit([65:1:120]',s_dkfz(65:120,61)/max(s_dkfz(65:120,61)),ft);
fit_gron = fit([65:1:120]',s_gron(65:120,61)/max(s_gron(65:120,61)),ft);
hold on;
plot([65:1:120],s_dkfz(65:120,61)/max(s_dkfz(65:120,61)),'DisplayName','DKFZ source');
%plot(fit_dkfz,[65:1:120],s_dkfz(65:120,61)/max(s_dkfz(65:120,61)));
plot([65:1:120]',s_gron(65:120,61)/max(s_gron(65:120,61)),'DisplayName','Groningen sources');
%plot(fit_gron,[65:1:120],s_gron(65:120,61)/max(s_gron(65:120,61)));
hold off;
legend;

subplot(2,3,5);
plot([65:1:120],s_dkfz(65:120,61)/max(s_dkfz(65:120,61)) - s_gron(65:120,61)/max(s_gron(65:120,61)),'DisplayName','Difference (DKFZ source - Groningen source)');
% hold on;
% plot(s_dkfz2(90,1:50)/max(s_dkfz2(90,1:50)),'DisplayName','DKHZ source diag');
% plot(s_gron(90,1:50)/max(s_gron(90,1:50)),'DisplayName','Groningen sources');
% %set(gca, 'YScale', 'log')
% hold off;
% legend

figure;
subplot(2,2,1);
imagesc(x,y,two_source);

subplot(2,2,2);
hold on;
plot(rescale(two_source(35,:)),'DisplayName','Slice 35');
plot(rescale(sum(two_source(30:40,:))),'DisplayName','Slices 30-40');
hold off;
legend;
% 
subplot(2,2,3);
hold on;
plot(rescale(two_source(85,:)),'DisplayName','Slice 85');
plot(rescale(sum(two_source(80:90,:))),'DisplayName','Slices 80-90');
hold off;
legend;

figure;
subplot(2,2,1);
imagesc(x,y,febr_source);

subplot(2,2,2);
imagesc(x,y,june_source);

subplot(2,2,3);
hold on;
plot(rescale(sum(febr_source(55:65,:))),'DisplayName','Slice, source with s/n ?');
plot(rescale(sum(june_source(55:65,:))),'DisplayName','Slice, source with s/n 26331');
plot(rescale(sum(june_source_old(55:65,:))),'DisplayName','Slice old, source with s/n 26331');
legend
hold off;

% figure;
% subplot(2,2,1);
% imagesc(x,y,febr_source);
% 
% subplot(2,2,2);
% imagesc(x,y,june_source);
% 
% subplot(2,2,3);
% hold on;
% plot(rescale(febr_source2(:,61)),'DisplayName','Slice, source with s/n ?');
% plot(rescale(febr_source3(:,61)),'DisplayName','Slice, source with s/n 26331');
% legend
% hold off;
% subplot(2,2,4);
% hold on;
% plot(two_source(35,:));
% plot(two_source(85,:));
% hold off;