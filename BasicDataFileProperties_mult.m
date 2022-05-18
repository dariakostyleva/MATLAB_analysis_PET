% calculates basic data file properties:
%       data acquisition time
%       number of events
%       random/true fraction
%       Gaussian fit of the time spectrum

%function []=BasicDataFileProperties_mult('D:\PET_Na22_Nov_2021\Na22_sens_0545.mat')
    y=load('D:\PET_Na22_Nov_2021\Na22_sens_0642.mat')
    
    z=y.y;
    clear y;
    size_Z=size(z); % size of matrix, number of events = size_Z(1), size_Z(2)=10 (10 columns)
    %DataAcquisitionTime=strcat(num2str(z(10^7-1,9)*0.001),'s') %
    % -1 is to get time of one to last event because time of the last event is zero (error)
    DataAcquisitionTime=strcat(num2str(z(size_Z(1)-1,9)*0.001),'s')
    NumberOfEvents=size_Z(1)
    A=sum(z,1); % sums matrix z over the first dimension, so sum over columns
    True = (size_Z(1)+A(8))/2
    Random=(size_Z(1)-A(8))/2
    RandomFractionProc=Random/True*100
%end