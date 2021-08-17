% convert the Siemens listmode data file (.lm) to an event file in Matlab format (.mat)
% RUN without specifying file name!

[file path_to_data] =  uigetfile('D:\*');
% if isequal(file,0)
%     disp('File selection aborted!');
%     return;
% else
%     disp(['Selected file ', lmfile]);
% end
mex Siemens2.c; %Compile Siemens code
lmfile = fullfile(path_to_data,file); % needed to pass correct name to function
Siemens2('Siemens','-i', lmfile); %Process data using the Siemens Executable, data is written to disk in the binary file coin.dat
s=dir('coin.dat'); % s is a struct with 6 pieces of information about the file coin.dat
num_bytes = 70000000;
blocks = ceil(s.bytes/num_bytes); % s.bytes is the number of bytes in the file coin.dat
c = []; % creates an empty vector
fid = fopen('coin.dat'); % fid is an ID for the file coin.dat
for i = 1:blocks
new_data = fread(fid,num_bytes,'*int'); % reads num_bytes bytes from the binary file coin.dat into vector new_data
c =[c; new_data]; % adds the data read above to the vector c
end
fclose(fid);
length(c)
y = double(vec2mat(c,10)); % converts vector c into a 10-column matrix of double-precision floating point values (8 bytes)

[path,name,ext] = fileparts(lmfile); % to separate name and extension
save(char(strcat(path_to_data,name,'.mat')),'y','-v7.3'); % OVERWRITES EXISTING FILE !