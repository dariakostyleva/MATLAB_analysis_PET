% Script to read images for 22Na source files 
% and add matrixes together
% PMMA position is pin 1
%v=[2 17 32 47 62 77 92 107 122 137 146 153 168 183];
v=[146]; % file numbers to exclude
file_num_i = 2;
file_num_f = 197;
file_num_t = file_num_f-file_num_i+1;
fprintf('Number of files to sum: %d\n',file_num_t);
sum_Image=zeros(120,120); % matrix of zeros
for i=file_num_i:file_num_f
%for i=198:262
    p=sum(i==v);
    if p == 0 
        path_to_fig = strcat('Q:\Documents\PET\MATLAB_figures_PET\Na22\Na22_sens_0',num2str(i,'%03.f'),'_red_image.fig'); % path of the figure
        openfig(path_to_fig,'invisible'); % open the figure as an structure
        image_Na=get(get(gca,'Children'),'CData'); % extract the figure data
        sum_Image=sum_Image+image_Na; % sum figure by figure;
    end
end
%%
openfig('Q:\Documents\PET\MATLAB_figures_PET\Na22\Na22_sens_0544_red_image.fig','invisible');
bg=get(get(gca,'Children'),'CData');

sum_Image = sum_Image-file_num_t*bg;

figure('Name','Reconstruction, 2d image','NumberTitle','off');
subplot(2,2,1);
xrange = [-119:2:119];
yrange = [-119:2:119];
%image_rot=imrotate(sum_Image,2.4,'bilinear','crop');
%image = imagesc(xrange,yrange,image_rot)
image = imagesc(xrange,yrange,sum_Image);
%title(datafile_red,'Interpreter', 'none')  
% dim = [.6 .6 .3 .3]; % dimention of annotation
% text = {'2D image', datafile_red}; % text of annotation
% annotation('textbox',dim,'String',text,'FitBoxToText','on','Interpreter', 'none');
colorbar;
colormap(parula);
xlabel('X (mm)');
ylabel('Y (mm)');
set(gca,'ColorScale','log');
axis square;
axis xy;
ax = gca;
ax.FontSize = 14;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
ax.TickDir = 'out';
ax.TickLength = [0.02 0.02];
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.GridLineStyle = '--';
ax.GridAlphaMode = 'manual';
ax.GridAlpha = 0.5;
ax.GridColorMode = 'manual';
ax.GridColor = 'white';

return;
subplot(2,2,2);
%plot(xrange, sum(sum_Image));
plot(xrange, sum(image_rot(60:61,:)));

subplot(2,2,3);
%plot(yrange, sum(sum_Image'));
plot(yrange, sum(image_rot(:,60:61)'));

subplot(2,2,4);

imagesc(xrange,yrange,bg);
colorbar;
colormap(parula);
xlabel('X (mm)');
ylabel('Y (mm)');
set(gca,'ColorScale','log');
axis square;
axis xy;
ax = gca;
ax.FontSize = 14;
ax.XLim = [-120,120];
ax.YLim = [-120,120];
xticks([-120:20:120]);
yticks([-120:20:120]);
ax.TickDir = 'out';
ax.TickLength = [0.02 0.02];
ax.XGrid = 'on';
ax.YGrid = 'on';
ax.GridLineStyle = '--';
ax.GridAlphaMode = 'manual';
ax.GridAlpha = 0.5;
ax.GridColorMode = 'manual';
ax.GridColor = 'white';
