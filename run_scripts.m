% Script that runs conversion,reduction and image production in sequence

tic % start time
for i=727:727
    name=strcat('Na22_sens_0',num2str(i,'%03.f')); % name of the raw data file
    Convert_raw_data_mult(name); % conver file.lm to file.mat
    path_name=strcat('D:\PET_Na22_Nov_2021\Na22_sens_0',num2str(i,'%03.f'));
    if exist(strcat(path_name,'.mat'), 'file') == 0
        fprintf('File does not exist %s\n',path_name);
        continue;
    end
    Reduce_data_file_mult(strcat(path_name,'.mat')); % reduce the file.mat 
    MidplaneRecon_curve_mult(strcat(path_name,'_red.mat')); % make the image reconstruction and save the figure
end
toc % end time