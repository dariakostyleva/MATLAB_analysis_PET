% Reduce_data_file.m
% reduces a data file to the minimum information:
% the following information is stored:
% cax, cay, cbx, cby, tdiff, event_time
% these are parameters 3-7, 9 from the original event data
% Author: Peter. Some modifications: Daria K
function []=Reduce_data_file_mult(datafilename)
    y=load(datafilename);
    z=y.y;
    clear y;
    z(:,10)=[]; % remove beam tag data
    z(:,2)=[]; % remove cb data
    z(:,1)=[]; % remove ca data
    size_Z=size(z); % size of matrix, number of events = size_Z(1), size_Z(2)=7 (7 columns)
    z(size_Z(1),6)=z(size_Z(1)-1,6); % correct error by which the time of the last event is 0, put it equal to that of the last but one event
    A = sum(z,1); % sums matrix z over the first dimension, so sum over columns
    N_delayed=(size_Z(1)-A(6))/2; % this is the number of delayed coincidences
    z=sortrows(z,6); % sorts the data according to prompt (par. 6=+1) and delayed (par. 6=-1)
    z(1:N_delayed,:)=[];
    z(:,6)=[]; % remove prompt or delayed information                                                                                                                         
    size_Z=size(z); % size of matrix, number of events = size_Z(1), size_Z(2)=6 (6 columns)
    %saving the file
    [filepath,name,ext] = fileparts(datafilename); %separates path, name and extension of the file
    save(char(strcat('D:\PET_Na22_Nov_2021\',name,'_red.mat')),'z','-v7.3'); % OVERWRITES EXISTING FILE !
    clear z;
end