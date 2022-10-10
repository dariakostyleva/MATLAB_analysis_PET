%%%% 
% Script divides the image by corresponding correction map 
% obtained by using Sens_corr_map.m and saves it as *_corr.fig
% Error bars are calculated and saved as _corr_err.fig
% 
%%%%


%%% Load image to be corrected
filepath = 'Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\';  
name = 'C12_018_red_spilloff_image_100c'; 
ext = '.fig';
fig_image_name = append(filepath,name,ext);
openfig(fig_image_name,'invisible');
image = get(get(gca,'Children'),'CData'); % getting data from figure as an array, in [counts]

%%% Divide image by map
fprintf('In file %s \n there are %d uncorr events \n',fig_image_name,sum(image,'all','omitnan'));

%%% Calculate error bars 
err_image = sqrt(image);

range = [-119:2:119];
%%% Save errors 
cerr = imagesc(range,range,err_image);
figname_err = strcat(filepath,name,'_err.fig');
saveas(cerr, figname_err);
