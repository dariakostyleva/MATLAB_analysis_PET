% convert the Siemens listmode data file (.lm) to an event file in Matlab format (.mat)

function []=Convert_raw_data_mult(raw_data)
    lmdatafile = {raw_data}; % name of the raw data .lm
    filename = char(strcat('D:\PET_Na22_Nov_2021\',lmdatafile,'.lm'))
    mex Siemens2.c; %Compile Siemens code
    if exist(filename, 'file') == 0
        return;
    end
    Siemens2('Siemens','-i', filename); %Process data using the Siemens Executable, data is written to disk in the binary file coin.dat
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
    length(c);
    y = double(vec2mat(c,10)); % converts vector c into a 10-column matrix of double-precision floating point values (8 bytes)
    save(char(strcat('D:\PET_Na22_Nov_2021\',lmdatafile,'.mat')),'y','-v7.3'); % OVERWRITES EXISTING FILE !
%save('test.txt','y','-asc                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           ii');
end