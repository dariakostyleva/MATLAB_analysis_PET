%datafile_red = load()

%%%%
%%%% Change loop such that it compares PET ts with FRS ts with counts in IC
%%%% histogram for that ts. If IC counts > 0 in the bin corresp to time stamp, 
%%%% then event is removed.
%%%% 

%z16=load('D:\PET_data_June_2021\O16_005_red.mat');
%z14=load('D:\PET_data_June_2021\O14_003_red.mat');
%z15=load('D:\PET_data_June_2021\O15_002_red.mat');
z16=load('D:\PET_data_June_2021\O16_015_red.mat');
z15=load('D:\PET_data_June_2021\O15_008_red.mat');
z14=load('D:\PET_data_June_2021\O14_016_red.mat');
events16=z16.z; events15=z15.z; events14=z14.z;
nevents16 = length(events16); nevents15 = length(events15); nevents14 = length(events14);
tt16 = events16(nevents16,6); % last time stamp ie total time of file in ms
tt15 = events15(nevents15-1,6); % last time stamp ie total time of file in ms
tt14 = events14(nevents14,6); % last time stamp ie total time of file in ms
clear z16; clear z15; clear z14;
bins = 100; % msec per per
binning16 = round(tt16/bins); binning15 = round(tt15/bins); binning14 = round(tt14/bins);
% binning 100 ms per bin
% writematrix(events15(:,6),'O15_002_TS.csv');
% writematrix(events16(:,6),'O16_005_TS.csv');
% writematrix(events14(:,6),'O14_003_TS.csv');
% return;

%%
%mask14 = [3.6 4.6 5.9 6.9 8.2 9.2 10.5 11.5 12.8 13.8 15.1 16.1 17.4 18.4 19.7 20.7 22 23 24.3 25.3 26.6 27.6];
spill_number_O14 = 472; % number of spills in file
cycle_O14 = 2300; % msec full cycle
spill_O14 = 1000; % msec spill on duration
sp_start_O14 = 3.6*spill_O14 - 2500; % 2500 is ~ delay between frs and pet in ms
events14_mod = events14;
sum14 = events14_mod;
n_delete = 0;

% loop looking for spill-on events and putting their ts to zero
for i=1:nevents14
    for k = 0:spill_number_O14 
        if and(events14(i,6) >= (sp_start_O14+cycle_O14*k), events14(i,6) <= (sp_start_O14+cycle_O14*k+spill_O14))
            events14_mod(i,6) = 0;
            n_delete = n_delete + 1;
        end
    end
end

% removing spill-on events (with ts=0) from array
events14_mod = sortrows(events14_mod,6);
events14_mod(1:n_delete,:)=[];
nevents14_mod = length(events14_mod);

figure('Name','Time stamp','NumberTitle','off'); 
subplot(2,1,1);
hold on;
% h16 = histogram(events16(:,6),binning16,'DisplayStyle','stairs','DisplayName','O16');
% h15 = histogram(events15(:,6),binning15,'DisplayStyle','stairs','DisplayName','O15');
h14 = histogram(events14(:,6),binning14,'DisplayStyle','stairs','DisplayName','O14');
h14_mod = histogram(events14_mod(:,6),binning14,'DisplayStyle','stairs','DisplayName','O14 masked');
hold off;
legend;

% retrieving data from histogram with removed spill-ons
[h14mod_c,h14mod_e] = histcounts(events14_mod(:,6),binning14);
h14mod_e(length(h14mod_e)) = [];

subplot(2,1,2);
plot(h14mod_e,h14mod_c);

%writematrix(h14mod_c','h14mod_c.csv');


% summing together all spill-offs
sum_spills = zeros(1,14); 

for i=1:binning14
    % adding 1st element to sum from 1st spill off
    if i <= 13
        sum_spills(i) = h14mod_c(i);
    end
    % adding further spill-offs to the 1st one
    for k=0:200
        if and(i >= 23 + 23*k,i <= 23 + 23*k +13)
            sum_spills(i-23-23*k+1) = sum_spills(i-23-23*k+1) + h14mod_c(i);
        end
    end
end

figure;
plot(h14mod_e(1:14),sum_spills);


%%
fit_range = h14mod_e(2:12);
sum_spills_red = sum_spills(2:12);
fx = fit(fit_range.',sum_spills_red.','exp1');
cx = coeffvalues(fx);
lambda = cx(2); 
t12 = -log(2)/lambda; 

figure;
plot(fx,fit_range,sum_spills_red);


%%
return;
% reading file with corresponding spill on and off info
fileID = fopen('IFC_C11_012.txt ','r');
ifc = fscanf(fileID,'%d %g %g',[3 Inf]);
ifc = ifc';

%
spill_1_pet = 2.2; %time of 1st spill in PET in sec
delay = ifc(1,2) - spill_1_pet;
sp_on = (ifc(:,2) - delay)*1000;  % in ms
sp_off = (ifc(:,3) - delay)*1000; % in ms
cycle = zeros(length(sp_on),1);
miss_spill = zeros(length(sp_on),2);
req_cycle = 48;
mask = zeros(events(nevents,6),1);

for i=2:length(sp_on)
    sp_on(i);
    sp_on(i-1);
    cycle(i) = round(sp_on(i) - sp_on(i-1),2);
    if cycle(i) >= 2*req_cycle
       miss_spill(i,1) = sp_on(i);
       miss_spill(i,2) = sp_off(i);
    end
end
miss_spill(~any(miss_spill,2), : ) = []; %removes rows with zeros from array

%

%figure('Name','Time stamp','NumberTitle','off'); 
%histogram(events(1:10000,6),245);

% delete all events in pet array before 1st spill on
counter=0;
for i=1:nevents
    %if events(i,6)>59800 && events(i,6)<(59800+4800)
    if events(i,6)< sp_on(1:1)
        counter = counter + 1;
    end
end
counter
events([1:counter],:) = [];
nevents=nevents-counter;
%%
for i=1:nevents
    for k=0:10
     if events(i,6) > events(1,6) && events(i,6) < events(1,6) + 2000
        events(i,6) = 0;
     end
    end
end




