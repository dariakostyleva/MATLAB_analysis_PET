fig = openfig('Q:\Documents\PET\MATLAB_figures_PET\Na22\Na22_sens_0005_red_image_corr.fig')
arr = get(get(gca,'Children'),'CData'); % getting data from figure as an array

xx = [-119:2:119];
horProj = sum(arr(55:65,:));
figure;
plot(xx,horProj);


return;
figure('Name','Analysis of point source data 1','NumberTitle','off');
%set(gca,'position',[100,300,1100,550])
x = [-104:2:104];
y = [-104:2:104];
subplot(1,3,1)
imagesc(x,y,arr); % scales the image according to axis dimensions 
colorbar;
axis square;
axis xy;
ax = gca;
ax.FontSize = 14;
ax.XLim = [-105,105];
ax.YLim = [-105,105];
xlabel('X (mm)');
ylabel('Y (mm)');
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

xx = [-104:208/103:104];
yy = [-104:208/103:104];
verProj = sum(arr, 2);
horProj = sum(arr, 1);

subplot(1,3,2);
plot(xx,horProj);
xlabel('X (mm)');
ylabel('Counts');
full_horProj = findobj(gca,'Type','line');

subplot(1,3,3);
plot(yy,verProj);
xlabel('Y (mm)');
ylabel('Counts');


fileID1 = fopen('out_proj_Na22_018_xx.txt','w');
fprintf(fileID1,'%d ',xx);
fclose(fileID1);
fileID2 = fopen('out_proj_Na22_018_horProj.txt','w');
fprintf(fileID2,'%d ',horProj);
fclose(fileID2);
fileID3 = fopen('out_proj_Na22_018_yy.txt','w');
fprintf(fileID3,'%d ',yy);
fclose(fileID3);
fileID4 = fopen('out_proj_Na22_018_verProj.txt','w');
fprintf(fileID4,'%d ',verProj);
fclose(fileID4);


%trying to select different peaks
p1_x = zeros();   p1_y = zeros();
p1_hor = zeros(); p1_ver = zeros();
ctrx1=1; ctry1=1;
p2_x = zeros();   p2_y = zeros();
p2_hor = zeros(); p2_ver = zeros();
ctrx2=1; ctry2=1;
for i = 1:length(xx)
   % selection of peak 1
   if(xx(i) >= -35 & xx(i) <= -10)
       p1_x(ctrx1) = xx(i);
       p1_hor(ctrx1) = horProj(i);
       ctrx1=ctrx1+1;
   end
   if(yy(i) >= -10 & yy(i) <= 10)
        p1_y(ctry1) = yy(i);
        p1_ver(ctry1) = verProj(i);
        ctry1=ctry1+1;
   end
   % selection of peak 2
   if(xx(i) >= -11 & xx(i) <= 15)
       p2_x(ctrx2) = xx(i);
       p2_hor(ctrx2) = horProj(i);
       ctrx2=ctrx2+1;
   end
   if(yy(i) >= -10 & yy(i) <= 10)
        p2_y(ctry2) = yy(i);
        p2_ver(ctry2) = verProj(i);
        ctry2=ctry2+1;
   end
   
   % selection of peak 3
end
figure('Name','Analysis of point source data 2','NumberTitle','off');
subplot(3,2,1);
plot(p1_x,p1_hor);
title('Projection on X of the 1st peak');
xlabel('X (mm)');
ylabel('Counts');

subplot(3,2,2);
plot(p1_y,p1_ver);
title('Projection on Y of the 1st peak');
xlabel('Y (mm)');
ylabel('Counts');

subplot(3,2,3);
plot(p2_x,p2_hor);
title('Projection on X of the 2st peak');
xlabel('X (mm)');
ylabel('Counts');

subplot(3,2,4);
plot(p2_y,p2_ver);
title('Projection on Y of the 2nd peak');
xlabel('Y (mm)');
ylabel('Counts');




