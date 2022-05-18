% *** this script creates histogram of time stamp and IFC histo *** %
z3=load('D:\PET_data_Feb_2021\C10_014_red.mat');
events3=z3.z; 
nevents3 = length(events3);
tt3 = events3(nevents3-1,6);
%writematrix(events3(:,6),'C10_014_TS.csv');
bins = 100;
binning3 = round(tt3/bins);
ifc_hist3 = load("hist_0255_C10_014_100msec_bins.txt");

[h_c,h_e] = histcounts(events3(:,6),binning3);
h_e(length(h_e)) = [];
h_ee = h_e(1:1366);
h_cc = h_c(1:1366);

figure;
subplot(2,1,1);
h3 = histogram(events3(:,6),binning3,'DisplayStyle','stairs','DisplayName','C10_014_red');
l = legend; set(l, 'Interpreter', 'none');
subplot(2,1,2);
stairs(ifc_hist3(:,1),ifc_hist3(:,2),'DisplayName','hist_0255_C10_014_100msec_bins');
l = legend; set(l, 'Interpreter', 'none');

figure;
subplot(2,1,1);
stairs(h_e,h_c,'DisplayName','PET data');
subplot(2,1,2);

f1 = fit(h_e(48:336).',h_c(48:336).','y0+a*x','StartPoint',[0 0]);
f2 = fit(h_e(601:1001).',h_c(601:1001).','y1+a1*x','StartPoint',[0 0]);
f3 = fit(h_e(1001:length(h_e)).',h_c(1001:length(h_c)).','y2+a2*x','StartPoint',[0 0]);
fsigm = fit(h_e(1:1001).',h_c(1:1001).', 'y0+a/(1+exp(-(x-x0)/b))^c');
%f = fit(h_e(1:601).',h_c(1:601).','y0+a*x^(n+m)','Lower',[-Inf -Inf -Inf -Inf],'Upper',[Inf Inf 0.2 0.3],'StartPoint',[0 0 0 0]);
cf1 = coeffvalues(f1)
cf2 = coeffvalues(f2)
cf3 = coeffvalues(f3)
plot(f1,h_e(48:336),h_c(48:336));
hold on;
plot(f2,h_e(601:1001),h_c(601:1001));
plot(f3,h_e(1001:length(h_e)),h_c(1001:length(h_c)));

figure;
plot(fsigm,h_e(1:1001),h_c(1:1001));

