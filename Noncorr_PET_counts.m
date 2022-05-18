%% Script to find number of PET counts (non-corrected) for each combination 

fig = openfig('Q:\Documents\PET\MATLAB_figures_PET\C12_018_figs\C12_018_red_spilloff_image_1c.fig','invisible');
arr = get(get(gca,'Children'),'CData'); 

sum(sum(arr(40:80,:),'omitnan'))