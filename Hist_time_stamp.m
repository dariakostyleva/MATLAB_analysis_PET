% *** this script creates histogram of time stamp and IFC histo *** %
z1=load('D:\PET_data_Feb_2021\C12_017_red.mat');
z2=load('D:\PET_data_Feb_2021\C11_012_red.mat');
z3=load('D:\PET_data_Feb_2021\C10_014_red.mat');
z4=load('D:\PET_data_June_2021\C12_018_red.mat');
z5=load('D:\PET_data_Feb_2021\C11_007_red.mat');
z6=load('D:\PET_data_Feb_2021\C10_001_red.mat');
events1=z1.z; events2=z2.z; events3=z3.z; events4=z4.z; events5=z5.z; events6=z6.z;
nevents1 = length(events1); nevents2 = length(events2); nevents3 = length(events3);
nevents4 = length(events4); nevents5 = length(events5); nevents6 = length(events6);
tt1 = events1(nevents1-1,6); tt2 = events2(nevents1-1,6); tt3 = events3(nevents3-1,6);
tt4 = events4(nevents4-1,6); tt5 = events5(nevents5-1,6); tt6 = events6(nevents6-1,6);
bins = 100;
binning1 = round(tt1/bins); binning2 = round(tt2/bins); binning3 = round(tt3/bins);
binning4 = round(tt4/bins); binning5 = round(tt5/bins); binning6 = round(tt6/bins);
ifc_hist1 = load("hist_0259_C12_017_100msec_bins.txt");
ifc_hist2 = load("hist_0248_C11_012_100msec_bins.txt");
ifc_hist3 = load("hist_0255_C10_014_100msec_bins.txt");
ifc_hist4 = load("hist_0277_C12_018_100msec_bins.txt");
ifc_hist5 = load("hist_0233_C11_007_100msec_bins.txt");
ifc_hist6 = load("hist_0219_C10_001_100msec_bins.txt");

figure;
subplot(6,2,1);
h1 = histogram(events1(:,6),binning1,'DisplayStyle','stairs','DisplayName','C12_017_red');
l = legend; set(l, 'Interpreter', 'none');
subplot(6,2,2);
stairs(ifc_hist1(:,1),ifc_hist1(:,2),'DisplayName','hist_0259_C12_017_100msec_bins');
l = legend; set(l, 'Interpreter', 'none');

subplot(6,2,3);
h2 = histogram(events2(:,6),binning2,'DisplayStyle','stairs','DisplayName','C11_012_red');
l = legend; set(l, 'Interpreter', 'none');
subplot(6,2,4);
stairs(ifc_hist2(:,1),ifc_hist2(:,2),'DisplayName','hist_0248_C11_012_100msec_bins');
l = legend; set(l, 'Interpreter', 'none');

subplot(6,2,5);
h3 = histogram(events3(:,6),binning3,'DisplayStyle','stairs','DisplayName','C10_014_red');
l = legend; set(l, 'Interpreter', 'none');
subplot(6,2,6);
stairs(ifc_hist3(:,1),ifc_hist3(:,2),'DisplayName','hist_0255_C10_014_100msec_bins');
l = legend; set(l, 'Interpreter', 'none');

subplot(6,2,7);
h4 = histogram(events4(:,6),binning4,'DisplayStyle','stairs','DisplayName','C12_018_red');
l = legend; set(l, 'Interpreter', 'none');
subplot(6,2,8);
stairs(ifc_hist4(:,1),ifc_hist4(:,2),'DisplayName','hist_0277_C12_018_100msec_bins');
l = legend; set(l, 'Interpreter', 'none');

subplot(6,2,9);
h5 = histogram(events5(:,6),binning5,'DisplayStyle','stairs','DisplayName','C11_007_red');
l = legend; set(l, 'Interpreter', 'none');
subplot(6,2,10);
stairs(ifc_hist5(:,1),ifc_hist5(:,2),'DisplayName','hist_0233_C11_007_100msec_bins');
l = legend; set(l, 'Interpreter', 'none');

subplot(6,2,11);
h6 = histogram(events6(:,6),binning6,'DisplayStyle','stairs','DisplayName','C10_001_red');
l = legend; set(l, 'Interpreter', 'none');
subplot(6,2,12);
stairs(ifc_hist6(:,1),ifc_hist6(:,2),'DisplayName','hist_0219_C10_001_100msec_bins');
l = legend; set(l, 'Interpreter', 'none');
