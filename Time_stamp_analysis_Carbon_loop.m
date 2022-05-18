
%% removing spill-on data in a loop
z12=load('D:\PET_data_feb_2021\C11_008_red.mat');
%ifc_hist = load("hist_0248_C11_012_100msec_bins.txt");
spill_number_C11 = 535; % number of spills in file C11_008
cycle_C11 = 4800; % msec full cycle
spill_C11 = 2000; % msec spill on duration
sp_start_C11 = 2100; %  is ~ delay between frs and pet in ms
n_delete = 0;

events=z12.z; 
events_mod12 = events;
nevents = length(events); 
tt = events(nevents-1,6); % last time stamp ie total time of file in ms
clear z12; 
bins = 200; % msec per per
binning = round(tt/bins);

% loop looking for spill-on events and putting their ts to zero
for i=1:nevents
    for k = 0:spill_number_C11 
        if and(events(i,6) >= (sp_start_C11+cycle_C11*k), events(i,6) <= (sp_start_C11+cycle_C11*k+spill_C11))
            events_mod12(i,6) = 0;
            n_delete = n_delete + 1;
        end
    end
end

% removing spill-on events (with ts=0) from array
events_mod12 = sortrows(events_mod12,6);
events_mod12(1:n_delete,:)=[];
nevents_mod12 = length(events_mod12);
events_spilloff = events_mod12;

figure('Name','Time stamp','NumberTitle','off'); 
subplot(2,1,1);
hold on;
% h16 = histogram(events16(:,6),binning16,'DisplayStyle','stairs','DisplayName','O16');
% h15 = histogram(events15(:,6),binning15,'DisplayStyle','stairs','DisplayName','O15');
h = histogram(events(:,6),binning,'DisplayStyle','stairs','DisplayName','C11 012');
h_mod = histogram(events_mod12(:,6),binning,'DisplayStyle','stairs','DisplayName','C11 012 masked');
%stairs(ifc_hist(:,1)*1000.-15000,ifc_hist(:,2)/2000,'DisplayName','IFC data');
hold off;
legend;

% retrieving data from histogram with removed spill-ons
[hmod_c,hmod_e] = histcounts(events_mod12(:,6),binning);
hmod_e(length(hmod_e)) = [];

subplot(2,1,2);
plot(hmod_e,hmod_c);
return;
save('D:\PET_data_feb_2021\C11_008_red_spilloff.mat','events_spilloff','-v7.3');

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


