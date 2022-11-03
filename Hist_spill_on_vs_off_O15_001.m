
fig_O15_off = openfig('Q:\Documents\PET\MATLAB_figures_PET\O15_001_red_spilloff_image.fig','invisible');
arr_O15_off = get(get(gca,'Children'),'CData'); 
fig_O15_on = openfig('Q:\Documents\PET\MATLAB_figures_PET\O15_001_red_spillon_image.fig','invisible');
arr_O15_on = get(get(gca,'Children'),'CData');


range = [-119:2:119];
depth_pmma = [-49:2:190];

f1 = fit(depth_pmma',(sum(arr_O15_on(40:80,:))./max(sum(arr_O15_on(40:80,:))))','gauss1', 'Exclude', depth_pmma < 103,'Exclude', depth_pmma > 115);
c1 = coeffvalues(f1);
sigma1 = c1(3);
FWHM_on = 2.35*sigma1
f2 = fit(depth_pmma',(sum(arr_O15_off(40:80,:))./max(sum(arr_O15_off(40:80,:))))','gauss1');
c2 = coeffvalues(f2);
sigma2 = c2(3);
FWHM_off = 2.35*sigma2

figure('Name','Sciles of spill on/off images of same file','NumberTitle','off');
hold on;
%plot(range,rescale(sum(arr_C11(50:70,:))),'DisplayName','C11 uncorrected, central slice 40 mm, ALL');
plot(depth_pmma,sum(arr_O15_on(40:80,:))./max(sum(arr_O15_on(40:80,:))),'DisplayName','O15_001 uncorr, spill ON');
plot(depth_pmma,sum(arr_O15_off(40:80,:))./max(sum(arr_O15_off(40:80,:))),'DisplayName','O15_001 uncorr, spill OFF');
%plot(f1,depth_pmma,sum(arr_O15_on(40:80,:))./max(sum(arr_O15_on(40:80,:))), depth_pmma > 115);
%plot(f2);
hold off;
%set(gca, 'YScale', 'log');
xlabel('X (mm)');
ylabel('Intensity (a.u.)');
l = legend; set(l, 'Interpreter', 'none');
