% *** this script creates histogram of time stamp and IFC histo *** %
z1=load('D:\PET_data_June_2021\O14_003_red.mat');
z2=load('D:\PET_data_June_2021\O14_016_red.mat');
z3=load('D:\PET_data_June_2021\O15_001_red.mat');
z4=load('D:\PET_data_June_2021\O15_008_red.mat');
z5=load('D:\PET_data_June_2021\O16_005_red.mat');
z6=load('D:\PET_data_June_2021\O16_015_red.mat');

ifc_hist1 = load("hist_0238_O14_003_100msec_bins.txt");
ifc_hist2 = load("hist_0275_O14_016_100msec_bins.txt");
ifc_hist3 = load("hist_0236_O15_001_100msec_bins.txt");
ifc_hist4 = load("hist_0243_O15_008_100msec_bins.txt");
ifc_hist5 = load("hist_0240_O16_005_100msec_bins.txt");
ifc_hist6 = load("hist_0272_O16_015_100msec_bins.txt");

events1=z1.z; events2=z2.z; events3=z3.z; events4=z4.z; events5=z5.z; events6=z6.z;
nevents1 = length(events1); nevents2 = length(events2); nevents3 = length(events3); nevents4 = length(events4);
nevents5 = length(events5); nevents6 = length(events6);
tt1 = events1(nevents1-1,6); tt2 = events2(nevents2-1,6); tt3 = events3(nevents3-1,6); tt4 = events4(nevents4-1,6);
tt5 = events5(nevents5-1,6); tt6 = events6(nevents6-1,6);

bins = 100*0.001;
binning1 = round(tt1*0.001/bins); binning2 = round(tt2*0.001/bins); binning3 = round(tt3*0.001/bins); binning4 = round(tt4*0.001/bins);
binning5 = round(tt5*0.001/bins); binning6 = round(tt6*0.001/bins);

% O14 histograms
figure;
subplot(2,2,1);
histogram(events1(:,6)*0.001,binning1,'DisplayStyle','stairs','DisplayName','O14_003_red');
l = legend; set(l, 'Interpreter', 'none');
xlabel('Time (sec)');
xlim([0 1300]);
subplot(2,2,3);
stairs(ifc_hist1(:,1),ifc_hist1(:,2),'DisplayName','hist_0238_O14_003_100msec_bins');
l = legend; set(l, 'Interpreter', 'none');
xlabel('Time (sec)');
xlim([0 1300]);
subplot(2,2,2);
histogram(events2(:,6)*0.001,binning2,'DisplayStyle','stairs','DisplayName','O14_016_red');
l = legend; set(l, 'Interpreter', 'none');
xlabel('Time (sec)');
xlim([0 1300]);
subplot(2,2,4);
stairs(ifc_hist2(:,1),ifc_hist2(:,2),'DisplayName','hist_0275_O14_016_100msec_bins');
l = legend; set(l, 'Interpreter', 'none');
xlabel('Time (sec)');
xlim([0 1300]);

% O15 histograms
figure;
subplot(2,2,1);
histogram(events3(:,6)*0.001,binning3,'DisplayStyle','stairs','DisplayName','O15_001_red');
l = legend; set(l, 'Interpreter', 'none');
xlabel('Time (sec)');
xlim([0 400]);
subplot(2,2,3);
stairs(ifc_hist3(:,1),ifc_hist3(:,2),'DisplayName','hist_0236_O15_001_100msec_bins');
l = legend; set(l, 'Interpreter', 'none');
xlabel('Time (sec)');
xlim([0 400]);
subplot(2,2,2);
histogram(events4(:,6)*0.001,binning4,'DisplayStyle','stairs','DisplayName','O15_008_red');
l = legend; set(l, 'Interpreter', 'none');
xlabel('Time (sec)');
xlim([0 600]);
subplot(2,2,4);
stairs(ifc_hist4(:,1),ifc_hist4(:,2),'DisplayName','hist_0243_O15_008_100msec_bins');
l = legend; set(l, 'Interpreter', 'none');
xlabel('Time (sec)');
xlim([0 600]);

% O16 histograms
figure;
subplot(2,2,1);
histogram(events5(:,6)*0.001,binning5,'DisplayStyle','stairs','DisplayName','O16_005_red');
l = legend; set(l, 'Interpreter', 'none');
xlabel('Time (sec)');
xlim([0 1800]);
subplot(2,2,3);
stairs(ifc_hist5(:,1),ifc_hist5(:,2),'DisplayName','hist_0240_O16_005_100msec_bins');
l = legend; set(l, 'Interpreter', 'none');
xlabel('Time (sec)');
xlim([0 1800]);
subplot(2,2,2);
histogram(events6(:,6)*0.001,binning6,'DisplayStyle','stairs','DisplayName','O16_015_red');
l = legend; set(l, 'Interpreter', 'none');
xlabel('Time (sec)');
xlim([0 600]);
subplot(2,2,4);
stairs(ifc_hist6(:,1),ifc_hist6(:,2),'DisplayName','hist_0272_O16_015_100msec_bins');
l = legend; set(l, 'Interpreter', 'none');
xlabel('Time (sec)');
xlim([0 600]);