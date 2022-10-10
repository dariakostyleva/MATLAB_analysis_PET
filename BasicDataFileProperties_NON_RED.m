% calculates basic data file properties:
%       data acquisition time
%       number of events
%       random/true fraction
%       Gaussian fit of the time spectrum

datafile = uigetfile('-file'); % select file to analyse
% y = uiimport('-file'); % select file to analyse
y=load(datafile)
%return;
%z=y.y;
z=y.events_spilloff;
% cutting z 
% [row1,col1] = find(z>55990);   %C10_001
% [row2,col2] = find(z>1246000); %C10_001
% [row2,col2] = find(z>2416000);  %C11_007
[row2,col2] = find(z>1018000);  %C12_017
% z(1:row1(1),:) = [];
 z(row2(1):length(z),:) = [];
   
%clear y; 
size_Z=size(z); % size of matrix, number of events = size_Z(1), size_Z(2)=10 (10 columns)
%DataAcquisitionTime=strcat(num2str(z(10^7-1,9)*0.001),'s') %
% -1 is to get time of one to last event because time of the last event is zero (error)
DataAcquisitionTime=strcat(num2str(z(size_Z(1)-1,9)*0.001),'s')
NumberOfEvents=size_Z(1)
A=sum(z,1); % sums matrix z over the first dimension, so sum over columns
True = (size_Z(1)+A(8))/2
Random=(size_Z(1)-A(8))/2    
RandomFraction=Random/True
% analysis of the time difference histogram below has been commented, it is not needed for
% S533 online
%[timehist,edges]=histcounts(z(:,7),52); % histogram of the 7th column (= time difference)
%[fitresult, gof] = Fit_timehist_gaussian_constant(timehist)
% below the histogram of the time stamp is made
figure('Name','Time stamp','NumberTitle','off'); 
histogram(z(:,9),3600); % histogram of the 9th column (= time stamp)
ax = gca;
ax.FontSize = 14;
xlabel('time (ms)');
ylabel('counts');
ax.TickDir = 'out';
ax.TickLength = [0.02 0.02];

% [filepath,name,ext] = fileparts(datafile); %separates path, name and extension of the file
% figname = strcat('C:\Users\dkostyl\Desktop\PET\Scanner_at_GSI\Pics\',name,'_time_stamp.png'); % create name for figure
% saveas(gcf, figname)  % save figure with the proper name to folder
%clear z;