% *** this script creates histogram of time stamp and IFC histo *** %
z1=load('D:\PET_data_Feb_2021\C12_017_red_spilloff.mat');
z2=load('D:\PET_data_Feb_2021\C11_012_red_spilloff.mat');
z3=load('D:\PET_data_Feb_2021\C10_014_red_spilloff.mat');
z4=load('D:\PET_data_June_2021\C12_018_red_spilloff.mat');
z5=load('D:\PET_data_Feb_2021\C11_007_red_spilloff.mat');
z6=load('D:\PET_data_Feb_2021\C10_001_red_spilloff.mat');
events1=z1.events_spilloff; events2=z2.events_spilloff; events3=z3.events_spilloff; 
events4=z4.events_spilloff; events5=z5.events_spilloff; events6=z6.events_spilloff;
nevents1 = length(events1); nevents2 = length(events2); nevents3 = length(events3);
nevents4 = length(events4); nevents5 = length(events5); nevents6 = length(events6);
tt1 = events1(nevents1-1,6); tt2 = events2(nevents1,6); tt3 = events3(nevents3,6);
tt4 = events4(nevents4,6); tt5 = events5(nevents5-1,6); tt6 = events6(nevents6-1,6);
bins = 100;
binning1 = round(tt1/bins); binning2 = round(tt2/bins); binning3 = round(tt3/bins);
binning4 = round(tt4/bins); binning5 = round(tt5/bins); binning6 = round(tt6/bins);

figure;
subplot(6,1,1);
h1 = histogram(events1(:,6),binning1,'DisplayStyle','stairs','DisplayName','C12_017_red_spilloff');
l = legend; set(l, 'Interpreter', 'none');
subplot(6,1,2);
h2 = histogram(events2(:,6),binning2,'DisplayStyle','stairs','DisplayName','C11_012_red_spilloff');
l = legend; set(l, 'Interpreter', 'none');
subplot(6,1,3);
h3 = histogram(events3(:,6),binning3,'DisplayStyle','stairs','DisplayName','C10_014_red_spilloff');
l = legend; set(l, 'Interpreter', 'none');
subplot(6,1,4);
h4 = histogram(events4(:,6),binning4,'DisplayStyle','stairs','DisplayName','C12_018_red_spilloff');
l = legend; set(l, 'Interpreter', 'none');
subplot(6,1,5);
h5 = histogram(events5(:,6),binning5,'DisplayStyle','stairs','DisplayName','C11_007_red_spilloff');
l = legend; set(l, 'Interpreter', 'none');
subplot(6,1,6);
h6 = histogram(events6(:,6),binning6,'DisplayStyle','stairs','DisplayName','C10_001_red_spilloff');
l = legend; set(l, 'Interpreter', 'none');

