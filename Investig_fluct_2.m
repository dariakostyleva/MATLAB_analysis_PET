%%%% script investigation fluctuations in images from DKFZ 68Ge line source

% images reconstructed as is
fig_kvi = openfig('Q:\Documents\PET\MATLAB_figures_PET\Na22\Na22_sens_0727_red_image.fig','invisible');
s_kvi= get(get(gca,'Children'),'CData');
fig_dkfz = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0022_red_image.fig','invisible');
s_dkfz= get(get(gca,'Children'),'CData');

% with gaps = 0
fig_kvi_ng = openfig('Q:\Documents\PET\MATLAB_figures_PET\Na22_sens_0727_red_image_nogap.fig','invisible');
s_kvi_ng= get(get(gca,'Children'),'CData');
fig_dkfz_ng = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0022_red_image_nogap.fig','invisible');
s_dkfz_ng= get(get(gca,'Children'),'CData');

% with fixed doi
fig_kvi_t = openfig('Q:\Documents\PET\MATLAB_figures_PET\Na22_sens_0727_red_image_no_trand.fig','invisible');
s_kvi_t= get(get(gca,'Children'),'CData');
fig_dkfz_t = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0022_red_image_no_trand.fig','invisible');
s_dkfz_t= get(get(gca,'Children'),'CData');

% fast recon
fig_kvi_f = openfig('Q:\Documents\PET\MATLAB_figures_PET\Na22_sens_0727_red_image_fast.fig','invisible');
s_kvi_f= get(get(gca,'Children'),'CData');
fig_dkfz_f = openfig('Q:\Documents\PET\MATLAB_figures_PET\june21_Ge68_source_0022_red_image_fast.fig','invisible');
s_dkfz_f= get(get(gca,'Children'),'CData');


time_kvi = 300.011; 
time_dkfz = 191.819;
x = [-119:2:119];
y = [-119:2:119];

figure;
subplot(2,2,1);
imagesc(x,y,s_kvi);
title('KVI Ge68 source, image from curve reconstrution');

subplot(2,2,2);
title('KVI Ge68 source, slice of 10 mm along beam direction');
hold on;
plot(x,rescale(sum(s_kvi(58:63,:))),'DisplayName','Curved recon');
plot(x,rescale(sum(s_kvi_ng(58:63,:))),'DisplayName','Curved recon with no gaps');
plot(x,rescale(sum(s_kvi_t(58:63,:))),'DisplayName','Curved recon with no DOI rand');
plot([-103:2:103],rescale(sum(s_kvi_f(50:55,:))),'DisplayName','Flat recon');
xlabel('(mm)');
hold off;
legend;

subplot(2,2,3);
imagesc(x,y,s_dkfz);
title('DKFZ Ge68 source, image from curve reconstruction');

subplot(2,2,4);
title('DKFZ Ge68 source, slice of 10 mm along beam direction');
hold on;
plot(x,rescale(sum(s_dkfz(58:63,:))),'DisplayName','Curved recon');
plot(x,rescale(sum(s_dkfz_ng(58:63,:))),'DisplayName','Curved recon with no gaps');
plot(x,rescale(sum(s_dkfz_t(58:63,:))),'DisplayName','Curved recon with no DOI rand');
plot([-103:2:103],rescale(sum(s_dkfz_f(50:55,:))),'DisplayName','Flat recon');
xlabel('(mm)');
hold off;
legend;

figure;
subplot(2,1,1);
title('Both sources, slice of 10 mm along beam direction. Curved recon');
hold on;
plot(x,rescale(sum(s_kvi(58:63,:))),'DisplayName','KVI source, curved recon');
plot(x,rescale(sum(s_dkfz(58:63,:))),'DisplayName','DKFZ source, curved recon');
%plot(triang(220),'DisplayName','Triangular function');
%xlim([-50 250]);
legend;
xlabel('(mm)');
hold off;

subplot(2,1,2);
title('Both sources, slice of 10 mm along beam direction. Flat recon');
hold on;
plot([-103:2:103],rescale(sum(s_kvi_f(50:55,:))),'DisplayName','KVI source, flat recon');
plot([-103:2:103],rescale(sum(s_dkfz_f(50:55,:))),'DisplayName','DKFZ source, flat recon');
%plot(triang(206),'DisplayName','Triangular function');
xlabel('(mm)');
%xlim([-50 250]);
legend;
hold off;





