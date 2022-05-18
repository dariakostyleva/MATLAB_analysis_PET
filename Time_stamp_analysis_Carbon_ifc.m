%datafile_red = load()

%%%%
%%%% Change loop such that it compares PET ts with FRS ts with counts in IC
%%%% histogram for that ts. If IC counts > 0 in the bin corresp to time stamp, 
%%%% then event is removed.
%%%% 
tic;
% z12=load('D:\PET_data_feb_2021\C11_012_red.mat');
% ifc_hist = load("hist_0248_C11_012_200msec_bins.txt");
% ifc_shifted = ifc_hist(:,1)*1000.-15000;
% pet_shift = 2000;
% z12=load('D:\PET_data_feb_2021\C10_014_red.mat');
% ifc_hist = load("hist_0255_C10_014_200msec_bins.txt"); % in sec and ions per 100 msec bin
% ifc_shifted = ifc_hist(:,1)*1000.-12250; % conversion into msec and offset
% pet_shift = 0;
% z12=load('D:\PET_data_feb_2021\C12_017_red.mat');
% ifc_hist = load("hist_0259_C12_017_100msec_bins.txt");
% ifc_shifted = ifc_hist(:,1)*1000.+1000;
% pet_shift = 2900;
% z12=load('D:\PET_data_feb_2021\C10_001_red.mat');
% ifc_hist = load("hist_0219_C10_001_200msec_bins.txt");
% ifc_shifted = ifc_hist(:,1)*1000.+3500;
% pet_shift = 56400;
z12=load('D:\PET_data_feb_2021\C11_007_red.mat');
ifc_hist = load("hist_0233_C11_007_200msec_bins.txt");
ifc_shifted = ifc_hist(:,1)*1000.-1400;
pet_shift = 1500;
% z12=load('D:\PET_data_June_2021\C12_018_red.mat');
% ifc_hist = load("hist_0277_C12_018_200msec_bins.txt");
% ifc_shifted = ifc_hist(:,1)*1000.-600;
% pet_shift = 1300;

cycle = 4800; % febuary 2021
%cycle = 2300; % june 2021

ifc_int = ifc_hist(:,2);

events=z12.z; 
nevents = length(events); 
tt = events(nevents-1,6); % last time stamp ie total time of file in ms
clear z12; 
bins = 200; % msec per per
binning = round(tt/bins); 
% binning 100 ms per bin
% writematrix(events16(:,6),'O16_005_TS.csv');

% figure;
% stairs(ifc_hist(:,1),ifc_hist(:,2));

[h_c,h_e] = histcounts(events(:,6),binning);
h_e(length(h_e)) = [];

figure;
subplot(3,1,1);
stairs(h_e,h_c,'DisplayName','PET data');
xlabel('Time (msec)');
ylabel('Intensity (PET counts)');
xlim([-90000 4000000])
legend;
subplot(3,1,2);
stairs(ifc_shifted,ifc_int,'DisplayName','IFC data NON-calibrated, prelim cal factor is 30 ','Color','#D95319');
xlim([-90000 4000000])
xlabel('Time (msec)');
ylabel('Intensity (counts per 200 msec)');
legend;
subplot(3,1,3);
stairs(h_e,h_c,'DisplayName','PET data');
hold on;
stairs(ifc_shifted,ifc_int/100,'DisplayName','IFC data/5000 ');
xlim([-90000 4000000])
xlabel('Time (msec)');
ylabel('Intensity (PET counts)');
legend('AutoUpdate','off')

for k = 0:517
    l = line([k*cycle+pet_shift k*cycle+pet_shift],[0 1000],'Color','#77AC30','LineStyle','--');
end


figure;
subplot(2,1,1);
stairs(h_e,h_c,'DisplayName','PET');
hold on;
xlim([-100 47000])
xlabel('Time (msec)');
ylabel('Number of decays per 200 ms');
legend('AutoUpdate','off')
for k = 0:10
    l = line([k*cycle+pet_shift k*cycle+pet_shift],[0 1000],'Color','#77AC30','LineStyle','--');
end
ax = gca;
ax.FontSize = 14;

subplot(2,1,2);
stairs(ifc_shifted,ifc_int,'DisplayName','IC','Color','#D95319');
hold on;
xlim([-100 47000])
xlabel('Time (msec)');
ylabel('Number of implanted ions per 200 ms');
legend('AutoUpdate','off')
for k = 0:10
    l = line([k*cycle+pet_shift k*cycle+pet_shift],[0 350000],'Color','#77AC30','LineStyle','--');
end
ax = gca;
ax.FontSize = 14;
return;
%% removing spill-on data using comparison with IFC histo
n_spillon = 0;
events_mod = events;
%nevents = 2000000;
for i=1:nevents
    if mod(i,10000) == 0
        disp(i);
    end
    if(events(i,6) >= ifc_shifted(length(ifc_shifted)))
        break;
    end
    for k=2:length(ifc_hist)
       %k
       if and(events(i,6) >= ifc_shifted(k-1),and(events(i,6) <= ifc_shifted(k),ifc_int(k)>1)) 
          %events_mod12(i,6) = 0;
          events_mod(i,7) = 1;
          n_spillon = n_spillon + 1;
          break;
       end
    end    
end
%events_mod12 = sortrows(events_mod12,6);
events_mod = sortrows(events_mod,7,'descend');
events_spillon = events_mod(1:n_spillon,:);
events_mod(1:n_spillon,:) = [];
events_spilloff = events_mod;
%%
figure;
hold on;
h = histogram(events(:,6),binning,'DisplayStyle','stairs','DisplayName','C11 012');
%h_mod = histogram(events_spilloff(:,6),binning,'DisplayStyle','stairs','DisplayName','C11 012 masked 2');
h_mod = histogram(events_spilloff(:,6),binning,'DisplayName','C11 012 spill off');
stairs(ifc_shifted,ifc_int/1000,'DisplayName','IFC data');
hold off;
legend;

%%
save('D:\PET_data_feb_2021\C11_012_red_spilloff.mat','events_spilloff','-v7.3');
save('D:\PET_data_feb_2021\C11_012_red_spillon.mat','events_spillon','-v7.3');
toc
