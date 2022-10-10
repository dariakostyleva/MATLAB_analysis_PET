%%%% 
% Script divides the image by corresponding correction map 
% obtained by using Sens_corr_map.m and saves it as *_corr.fig
% Error bars are calculated and saved as _corr_err.fig
% 
%%%%

%%% Load the sensitivity map
map = load('sens_corr_map_pin_2.mat'); % map is dimensionless
map = map.map;

%%% Load image to be corrected
filepath = 'Q:\Documents\PET\MATLAB_figures_PET\';  
name = 'june21_Ge68_source_0012_red_image'; 
ext = '.fig';
fig_image_name = append(filepath,name,ext);
openfig(fig_image_name,'invisible');
image = get(get(gca,'Children'),'CData'); % getting data from figure as an array, in [counts]

%%% Divide image by map
corr_image = image./map; % corrected image in [counts]
fprintf('In file %s \n there are %d decays \n',fig_image_name,sum(corr_image,'all','omitnan'));
%return;

%%% Save image
range = [-119:2:119];
cimage = imagesc(range,range,corr_image);
figname = strcat(filepath,name,'_corr.fig');
saveas(cimage, figname);

%%% Calculate error bars 
err_counts = sqrt(image);
err_image = err_counts./map;

%%% Save errors 
cerr = imagesc(range,range,err_image);
figname_err = strcat(filepath,name,'_corr_err.fig');
saveas(cerr, figname_err);
