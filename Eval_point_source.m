% This script should do the following:
% 1. Get time of each file for both source data and background, this is performed on raw data.
% 2. Deduce total number of counts in file excluding random events, i.e. on the reduced data. 
% Divide the number of counts by the time, i.e. get rates R and Rb in [counts/sec] for both source data and background. 
% 3. Correct for background rate Rc = R - Rb
% 4. Deduce the x and y coordinates of the peak from source data, i.e. performed on image
% 5. Store 3 values: x, y and corrected rate Rc [counts/sec] into an array.

% 6. Error propagation is added. 

% first file, last file, background file
%file_num_i = 2; file_num_f = 262; file_num_b = 543; % pin 2
%file_num_i = 263; file_num_f = 540; file_num_b = 541; % 137.42 mm from braket
%file_num_i = 545; file_num_f = 726; file_num_b = 544; % pin1_1
%file_num_i = 545; file_num_f = 550; file_num_b = 544; % debug
%file_num_i = 46; file_num_f = 46; file_num_b = 543; % debug
file_num_i = 73; file_num_f = 73; file_num_b = 1; % debug
file_num = file_num_f-file_num_i+1; % number of files with source data
exc = [296]; % file numbers to exclude
ar = zeros(file_num,6); % empty array to store final data
range = [-119:2:119];
activity = 1438; % activity of 22Na point source [kBq]
da = 8.0; %  error of activity of the source is 8 kBq 
br = 0.906; % branching ratio for positron emission of 22Na
dt = 0.001; % 1 ms error of time measurement ????



%% background rate calculation
bgrawname=strcat('D:\PET_Na22_Nov_2021\Na22_sens_0',num2str(file_num_b,'%03.f.mat'));
bgredname=strcat('D:\PET_Na22_Nov_2021\Na22_sens_0',num2str(file_num_b,'%03.f_red.mat'));
y = load(bgrawname);
prompts = y.y;
clear y; 
size_Z=size(prompts); % size of matrix, number of events = size_Z(1), size_Z(2)=10 (10 columns)
t_bg = prompts(size_Z(1)-1,9)*0.001 % duration of bg file in (sec)
clear prompts;

z = load(bgredname);
trues = z.z;
clear z;
rate_bg = length(trues)/t_bg 
% abs error of background rate
err_bg = sqrt( (sqrt(length(trues))/length(trues))^2 + (dt/t_bg)^2 )*rate_bg;
clear trues;
%%

%% source rate calculation and bg subtraction
for i = file_num_i:file_num_f
    cond = sum(i == exc);
    if cond == 0
        rawname = strcat('D:\PET_Na22_Nov_2021\Na22_sens_0',num2str(i,'%03.f.mat')); % name of the raw data file
        redname = strcat('D:\PET_Na22_Nov_2021\Na22_sens_0',num2str(i,'%03.f_red.mat'));
        imname = strcat('Q:\Documents\PET\MATLAB_figures_PET\Na22\Na22_sens_0',num2str(i,'%03.f_red_image.fig'));

        % load raw file and get time
        y = load(rawname);
        prompts = y.y;
        clear y; 
        size_Z = size(prompts); % size of matrix, number of events = size_Z(1), size_Z(2)=10 (10 columns)
        t = prompts(size_Z(1)-1,9)*0.001;
        clear prompts;
    
        % load reduced file and get total number of true counts and rate
        z = load(redname);
        trues = z.z;
        clear z;
        ntrues = length(trues);
        rate = ntrues/t % [counts/sec]
        
        % abs error of source rate 
        err_r = sqrt( (sqrt(ntrues)/ntrues)^2 + (dt/t)^2 )*rate;
        
        % correct rate on bg
        rate_c = rate - rate_bg; % [counts/sec]
        
        % abs error of corrected source rate
        err_cr = sqrt( err_r^2 + err_bg^2 );
    
        % sensitivity
        sens = rate_c/activity;  % [counts/sec/kBq]
        abs_sens = sens*10^(-3)/br*100; % [%]
        
        % abs error of sensitivity
        err_s = sqrt( (err_cr/rate_c)^2 + (da/activity)^2 )*sens;
        %err_s = sqrt( err_cr^2 + da^2 );
 
        % load image and get coordinates of peak
        openfig(imname,'invisible');
        im = get(get(gca,'Children'),'CData');   
        xProj = sum(im, 1); yProj = sum(im, 2);
        fx = fit(range.',xProj.','gauss1');
        cx = coeffvalues(fx);
        centr_x = cx(2);
        fy = fit(range.',yProj,'gauss1');
        cy = coeffvalues(fy);
        centr_y = cy(2);

        % fill array with coordinates of peak, corrected rate, sensitivity, error of sensitivity and file number
        ar(i-file_num_i+1,:) = [centr_x centr_y rate_c sens err_s i];
    end
end
%%
% ar_er = ar;
% save('sens_pin1_1_err.mat','ar_er');
% %save('sens_Carb380.mat','ar');
% %save('sens_pin2_err.mat','ar');
% return;
figure;
subplot(1,2,1);
histogram(ar(:,4),100);
ax = gca;
ax.FontSize = 14;
xlabel('Sensitivity [counts/sec/kBq]');
ylabel('counts');
ax.TickDir = 'out';
ax.TickLength = [0.02 0.02];
subplot(1,2,2);
histogram(ar(:,5),100);
ax = gca;
ax.FontSize = 14;
xlabel('Absolute sensitivity [%]');
ylabel('counts');
ax.TickDir = 'out';ax.TickLength = [0.02 0.02];


%% debug to check the fits
figure;
subplot(2,2,1);
image = imagesc(range,range,im);
subplot(2,2,2);
plot(fx,range,xProj);
subplot(2,2,3);
plot(fy,range,yProj);