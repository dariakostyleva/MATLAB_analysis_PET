%datafile_red = load()

%%%%
%%%% Change loop such that it compares PET ts with FRS ts with counts in IC
%%%% histogram for that ts. If IC counts > 0 in the bin corresp to time stamp, 
%%%% then event is removed.
%%%% 
tic;
z12=load('D:\PET_data_June_2021\O16_005_red.mat');
%z12=load('D:\PET_data_June_2021\O16_015_red.mat');
ifc_hist = load("hist_0240_O16_005_200msec_bins.txt");

spill = 1000;

% case dependent variables:
% O14_003
% cycle = 2500; % june 2021
% ifc_shifted = ifc_hist(:,1)*1000.-3000;
% pet_shift = 2200;
% thresh = 5; % threshold for IFC counts
% spill_number = 4; % number of spills to remove in loop
% shift = -5800; % shift required to remove some spills in loop

% O14_016
% cycle = 2300; % june 2021
% ifc_shifted = ifc_hist(:,1)*1000.-2400;
% pet_shift = 1100;
% thresh = 5; % threshold for IFC counts
% spill_number = 4; % number of spills to remove in loop
% shift = -5800; % shift required to remove some spills in loop

% O15_001
% cycle = 2400; % june 2021
% ifc_shifted = ifc_hist(:,1)*1000.-8200;
% pet_shift = 3400;
% thresh = 5; % threshold for IFC counts
% spill_number = 1; % number of spills to remove in loop
% shift = -4000; % shift required to remove some spills in loop 

% O15_008
% cycle = 2300; % june 2021
% ifc_shifted = ifc_hist(:,1)*1000.-5000;
% pet_shift = 5200;
% thresh = 5; % threshold for IFC counts
% spill_number = 5; % number of spills to remove in loop
% shift = -5800; % shift required to remove some spills in loop 

% O16_015
% cycle = 2300; % june 2021
% ifc_shifted = ifc_hist(:,1)*1000.+800;
% pet_shift = 700;
% thresh = 5; % threshold for IFC counts
% spill_number = 227; % number of spills to remove in loop
% shift = -525800; % shift required to remove some spills in loop 

% O16_005
cycle = 2300; % june 2021
ifc_shifted = ifc_hist(:,1)*1000.-5400;
pet_shift = 700;
thresh = 5; % threshold for IFC counts
spill_number = 680; % number of spills to remove in loop
shift = -1608600; % shift required to remove some spills in loop

ifc_int = ifc_hist(:,2);
events=z12.z; 
%events=z12.events_spilloff;
nevents = length(events); 
tt = events(nevents-1,6); % last time stamp ie total time of file in ms
clear z12; 
bins = 200; % msec per bin
binning = round(tt/bins); 
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
stairs(ifc_shifted,ifc_int,'DisplayName','IFC data NON-calibrated, cal factor is about 40 ','Color','#D95319');
xlim([-90000 4000000])
xlabel('Time (msec)');
ylabel('Intensity (counts per 200 msec)');
legend;
subplot(3,1,3);
stairs(h_e,h_c,'DisplayName','PET data');
hold on;
stairs(ifc_shifted,ifc_int/100,'DisplayName','IFC data/5000 ');
%stairs(ifc_shifted,ifc_int,'DisplayName','IFC data/5000 ');
xlim([-90000 4000000])
xlabel('Time (msec)');
ylabel('Intensity (PET counts)');
legend('AutoUpdate','off')
for k = 0:777
    l = line([k*cycle+pet_shift k*cycle+pet_shift],[0 5000],'Color','#77AC30','LineStyle','--');
end
%return; 

%% removing spill-on data using comparison with IFC histo
n_spillon = 0;
events_mod = events;
%nevents = 2000000;
for i=1:nevents

    if mod(i,100000) == 0
        disp(i);
    end
    
    %%% uncomment if you want to quit after comparison with IFC
    if(events(i,6) >= ifc_shifted(length(ifc_shifted)))
       break;
    end


    %%% conditions for O16_005 file
%     if and(events(i,6) >= 275000, events(i,6)<= 344800)
%         cycle = 2400;
%     elseif and(events(i,6) >= 275000, events(i,6)<= 344800)
%         cycle = 2400;
%     
%     elseif and(events(i,6) >= 309800, events(i,6)<=  371000)
%         cycle = 2400;
%         spill = 1100;
%   
%     elseif and(events(i,6) >= 408400, events(i,6)<= 482800)
%         cycle = 2400;
%         spill = 1100;
%         
%     elseif and(events(i,6) >= 551000, events(i,6)<= 621000)
%         cycle = 2400;
%         
%     elseif and(events(i,6) >= 693400, events(i,6)<= 749600)
%         cycle = 2400;
%         
%     elseif and(events(i,6) >= 818000, events(i,6)<= 883000)
%         cycle = 2400;
%         
%     elseif and(events(i,6) >= 946800, events(i,6)<= 1007000)
%         cycle = 2400;
%         
%     elseif and(events(i,6) >= 1078000, events(i,6)<= 1141000)
%         cycle = 2400;
%         
%     elseif and(events(i,6) >= 1209000, events(i,6)<= 1274000)
%         cycle = 2400;
%         
%     elseif and(events(i,6) >= 1347000, events(i,6)<= 1403000)
%         cycle = 2400;
%     else
%         cycle = 2300;
%         spill = 1000;
%     end
    %%% end of conditions for O16_005 file
    
    %%% uncomment this if some spills to be deleted in a loop after
    %%% comparison with IFC
%     if(events(i,6) >= (ifc_shifted(length(ifc_shifted))+shift))
%         for k = 1:spill_number 
%             if and(events(i,6) >= (ifc_shifted(length(ifc_shifted))+shift-spill+cycle*k), events(i,6) <= (ifc_shifted(length(ifc_shifted))+shift+cycle*k))
%                 events_mod(i,7) = 1;
%                 n_spillon = n_spillon + 1;
%                 break;
%             end
%         end
%     end
    
    %%% uncomment if spills to be deleted in comparison with IFC
    for k=2:length(ifc_hist)
       %k
       if and(events(i,6) >= ifc_shifted(k-1),and(events(i,6) <= ifc_shifted(k),ifc_int(k)>thresh)) 
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
h = histogram(events(:,6),binning,'DisplayStyle','stairs','DisplayName','Data');
h_mod = histogram(events_spilloff(:,6),binning,'DisplayName','Data spill off');
stairs(ifc_shifted,ifc_int/1000,'DisplayName','IFC data');
%stairs(ifc_shifted,ifc_int,'DisplayName','IFC data');
hold off;
legend;

return;
%%
save('D:\PET_data_June_2021\O16_005_red_spilloff.mat','events_spilloff','-v7.3');
save('D:\PET_data_June_2021\O16_005_red_spillon.mat','events_spillon','-v7.3');
toc
return;
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
