
%%%%
%%%% Change loop such that it compares PET ts with FRS ts with counts in IC
%%%% histogram for that ts. If IC counts > 0 in the bin corresp to time stamp, 
%%%% then event is removed.
%%%% 
tic;

z12=load('D:\PET_data_feb_2021\C12_017_red.mat');
ifc_hist = load("hist_0259_C12_017_100msec_bins.txt");
ifc_shifted = ifc_hist(:,1)*1000.+1000;

% z12=load('D:\PET_data_June_2021\C12_018_red.mat');
% ifc_hist = load("hist_0277_C12_018_200msec_bins.txt");
% ifc_shifted = ifc_hist(:,1)*1000.-600;

ifc_int = ifc_hist(:,2);
events=z12.z; 
nevents = length(events); 
tt = events(nevents-1,6); % last time stamp ie total time of file in ms
clear z12; 
bins = 100; % msec per per
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
legend;
subplot(3,1,2);
stairs(ifc_shifted,ifc_int,'DisplayName','IFC data');
legend;
subplot(3,1,3);
stairs(h_e,h_c,'DisplayName','PET data');
hold on;
stairs(ifc_shifted,ifc_int/500,'DisplayName','IFC data');
legend;
%return;
%% removing spill-on data using comparison with IFC histo
n_spillon = 0;
events_mod = events;

spill_number = 24; % number of spills still written after ifc stopped writing
cycle = 4800; % msec full cycle
spill = 2100; % msec spill on duration

% spill_number = 0; % number of spills still written after ifc stopped writing
% cycle = 2300; % msec full cycle
% spill = 1100; % msec spill on duration

%nevents = 100000;
for i=1:nevents
    if mod(i,10000) == 0
        disp(i);
    end
    if(events(i,6) >= ifc_shifted(length(ifc_shifted))-2*cycle-11000)
        for k = 0:spill_number 
            if and(events(i,6) >= (ifc_shifted(length(ifc_shifted))-spill+cycle*k), events(i,6) <= (ifc_shifted(length(ifc_shifted))+cycle*k))
           %if and(events(i,6) >= (ifc_shifted(length(ifc_shifted))-4000+cycle*k), events(i,6) <= (ifc_shifted(length(ifc_shifted))-4000+cycle*k+spill))
                events_mod(i,7) = 1;
                n_spillon = n_spillon + 1;
                break;
            end
        end
    end
    for k=2:length(ifc_hist)
       if and(events(i,6) >= ifc_shifted(k-1),and(events(i,6) <= ifc_shifted(k),ifc_int(k)>0)) 
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
h = histogram(events(:,6),binning,'DisplayStyle','stairs','DisplayName','C12 017');
h_mod = histogram(events_spilloff(:,6),binning,'DisplayName','C12 017 spill off');
stairs(ifc_shifted,ifc_int/100,'DisplayName','IFC data');
hold off;
legend;

figure;
h_mod = histogram(events_spilloff(:,6),binning,'DisplayName','C12 017 spill off');
%return;
%%
save('D:\PET_data_feb_2021\C12_017_red_spilloff.mat','events_spilloff','-v7.3');
save('D:\PET_data_feb_2021\C12_017_red_spillon.mat','events_spillon','-v7.3');
% save('D:\PET_data_June_2021\C12_018_red_spilloff.mat','events_spilloff','-v7.3');
% save('D:\PET_data_June_2021\C12_018_red_spillon.mat','events_spillon','-v7.3');
toc

%% removing spill-on data in a loop
%z12=load('D:\PET_data_feb_2021\C11_012_red.mat');
%ifc_hist = load("hist_0248_C11_012_100msec_bins.txt");
% spill_number_C11 = 503; % number of spills in file C11_012
% cycle_C11 = 4800; % msec full cycle
% spill_C11 = 2000; % msec spill on duration
% sp_start_C11 = 1800; %  is ~ delay between frs and pet in ms
% events_mod12 = events;
% sum = events_mod12;
% n_delete = 0;
% 
% % loop looking for spill-on events and putting their ts to zero
% for i=1:nevents
%     for k = 0:spill_number_C11 
%         if and(events(i,6) >= (sp_start_C11+cycle_C11*k), events(i,6) <= (sp_start_C11+cycle_C11*k+spill_C11))
%             events_mod12(i,6) = 0;
%             n_delete = n_delete + 1;
%         end
%     end
% end
% 
% % removing spill-on events (with ts=0) from array
% events_mod12 = sortrows(events_mod12,6);
% events_mod12(1:n_delete,:)=[];
% nevents_mod12 = length(events_mod12);
% 
% figure('Name','Time stamp','NumberTitle','off'); 
% subplot(2,1,1);
% hold on;
% % h16 = histogram(events16(:,6),binning16,'DisplayStyle','stairs','DisplayName','O16');
% % h15 = histogram(events15(:,6),binning15,'DisplayStyle','stairs','DisplayName','O15');
% h = histogram(events(:,6),binning12,'DisplayStyle','stairs','DisplayName','C11 012');
% h_mod = histogram(events_mod12(:,6),binning12,'DisplayStyle','stairs','DisplayName','C11 012 masked');
% stairs(ifc_hist(:,1)*1000.-15000,ifc_hist(:,2)/2000,'DisplayName','IFC data');
% hold off;
% legend;
% 
% % retrieving data from histogram with removed spill-ons
% [hmod_c,hmod_e] = histcounts(events_mod12(:,6),binning12);
% hmod_e(length(hmod_e)) = [];
% 
% subplot(2,1,2);
% plot(hmod_e,hmod_c);

%%
% %% summing together all spill-offs after removing in a loop
% sum_spills = zeros(1,100); 
% 
% for i=1:binning12
%     % adding 1st element to sum from 1st spill off
%     if i <= 13
%         sum_spills(i) = hmod_c(i);
%     end
%     % adding further spill-offs to the 1st one
%     for k=0:200
%         if and(i >= 23 + 23*k,i <= 23 + 23*k +13)
%             sum_spills(i-23-23*k+1) = sum_spills(i-23-23*k+1) + hmod_c(i);
%         end
%     end
% end
% 
% figure;
% plot(hmod_e(1:100),sum_spills);
% 
% 
% %% fitting exponent
% fit_range = hmod_e(2:12);
% sum_spills_red = sum_spills(2:12);
% fx = fit(fit_range.',sum_spills_red.','exp1');
% cx = coeffvalues(fx);
% lambda = cx(2); 
% t12 = -log(2)/lambda; 
% 
% figure;
% plot(fx,fit_range,sum_spills_red);


