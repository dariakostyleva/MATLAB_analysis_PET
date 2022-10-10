
% z12_c11=load('D:\PET_data_feb_2021\C11_012_red.mat');
% ifc_hist_c11 = load("hist_0248_C11_012_200msec_bins.txt");
% ifc_shifted_c11 = ifc_hist_c11(:,1)*1000.-15000;
% pet_shift_c11 = 2000;
z12_c10=load('D:\PET_data_feb_2021\C10_014_red.mat');
ifc_hist_c10 = load("hist_0255_C10_014_200msec_bins.txt"); % in sec and ions per 100 msec bin
ifc_shifted_c10 = ifc_hist_c10(:,1)*1000.-12250; % conversion into msec and offset
pet_shift_c10 = 0;
% z12=load('D:\PET_data_feb_2021\C12_017_red.mat');
% ifc_hist = load("hist_0259_C12_017_100msec_bins.txt");
% ifc_shifted = ifc_hist(:,1)*1000.+1000;
% pet_shift = 2900;
% z12=load('D:\PET_data_feb_2021\C10_001_red.mat');
% ifc_hist = load("hist_0219_C10_001_200msec_bins.txt");
% ifc_shifted = ifc_hist(:,1)*1000.+3500;
% pet_shift = 56400;
z12_c11=load('D:\PET_data_feb_2021\C11_007_red.mat');
ifc_hist_c11 = load("hist_0233_C11_007_200msec_bins.txt");
ifc_shifted_c11 = ifc_hist_c11(:,1)*1000.-1400;
pet_shift_c11 = 1500;
% z12=load('D:\PET_data_June_2021\C12_018_red.mat');
% ifc_hist = load("hist_0277_C12_018_200msec_bins.txt");
% ifc_shifted = ifc_hist(:,1)*1000.-600;
% pet_shift = 1300;

cycle = 4800; % febuary 2021
%cycle = 2300; % june 2021
bottom = 0; %identify bottom; or use min(sh.YData)

ifc_int_c10 = ifc_hist_c10(:,2); ifc_int_c11 = ifc_hist_c11(:,2);

events_c10=z12_c10.z; events_c11=z12_c11.z; 
nevents_c10 = length(events_c10); nevents_c11 = length(events_c11); 
tt_c10 = events_c10(nevents_c10-1,6); tt_c11 = events_c11(nevents_c11-1,6); 
clear z12_c10; clear z12_c11; 
bins = 200; % msec per per
binning_c10 = round(tt_c10/bins); binning_c11 = round(tt_c11/bins); 

[h_c_c10,h_e_c10] = histcounts(events_c10(:,6),binning_c10);
h_e_c10(length(h_e_c10)) = [];
[h_c_c11,h_e_c11] = histcounts(events_c11(:,6),binning_c11);
h_e_c11(length(h_e_c11)) = [];

figure;
subplot(4,1,1);
%yyaxis left
st1 = stairs(h_e_c10,h_c_c10,'DisplayName','C10');
hold on;
xlabel('Time (msec)');
ylabel('Number of decays per 200 ms');
legend('AutoUpdate','off')
% Fill area
x1 = [st1.XData(1),repelem(st1.XData(2:end),2)];
y1 = [repelem(st1.YData(1:end-1),2),st1.YData(end)];
color1 = [0 0.4470 0.7410];
fill([x1,fliplr(x1)],[y1,bottom*ones(size(y1))],color1,'LineStyle','none','FaceAlpha',0.5)
xlim([-100 47000])
legend('AutoUpdate','off')
for k = 0:10
    l1 = line([k*cycle+pet_shift_c10 k*cycle+pet_shift_c10],[0 1000],'Color','#77AC30','LineStyle','--','LineWidth',2);
end
ax = gca;
ax.FontSize = 14;

subplot(4,1,2);
%yyaxis right
%ylim([-0.1 1.5])
st2 = stairs(ifc_shifted_c10,ifc_int_c10,'DisplayName','IC C10');
ylabel('Number of implanted ions per 200 ms');
% Fill area
x2 = [st2.XData(1),repelem(st2.XData(2:end),2)];
y2 = [repelem(st2.YData(1:end-1),2),st2.YData(end)];
color2 = [0.8500 0.3250 0.0980];
fill([x2,fliplr(x2)],[y2,bottom*ones(size(y2))],color2,'LineStyle','none','FaceAlpha',0.5);
xlim([-100 47000])
legend('AutoUpdate','off')
for k = 0:10
    l1 = line([k*cycle+pet_shift_c10 k*cycle+pet_shift_c10],[0 350000],'Color','#77AC30','LineStyle','--','LineWidth',2);
end
ax = gca;
ax.FontSize = 14;


subplot(4,1,3);
%yyaxis left
st3 = stairs(h_e_c11,h_c_c11,'DisplayName','C11');
hold on;
ylabel('Number of coincidence events per 200 ms');
legend('AutoUpdate','off')
% Fill area
x3 = [st3.XData(1),repelem(st3.XData(2:end),2)];
y3 = [repelem(st3.YData(1:end-1),2),st3.YData(end)];
fill([x3,fliplr(x3)],[y3,bottom*ones(size(y3))],color1,'LineStyle','none','FaceAlpha',0.5)
xlim([-100 47000]);
legend('AutoUpdate','off')
for k = 0:10
    l2 = line([k*cycle+pet_shift_c11 k*cycle+pet_shift_c11],[0 1000],'Color','#77AC30','LineStyle','--','LineWidth',2);
end
ax = gca;
ax.FontSize = 14;

subplot(4,1,4);
%yyaxis right
st4 = stairs(ifc_shifted_c11,ifc_int_c11,'DisplayName','IC C11');
hold on;
xlabel('Time (msec)');
ylabel('Number of implanted ions per 200 ms');
%ylim([0 6000000]);
x4 = [st4.XData(1),repelem(st4.XData(2:end),2)];
y4 = [repelem(st4.YData(1:end-1),2),st4.YData(end)];
fill([x4,fliplr(x4)],[y4,bottom*ones(size(y4))],color2,'LineStyle','none','FaceAlpha',0.5)
xlim([-100 47000])
ax = gca;
ax.FontSize = 14;
legend('AutoUpdate','off')
for k = 0:10
    l2 = line([k*cycle+pet_shift_c11 k*cycle+pet_shift_c11],[0 5000000],'Color','#77AC30','LineStyle','--','LineWidth',2);
end

PaperSize = [21,21];
ScreenSize = get(0,'ScreenSize');
SPPI = get(0,'ScreenPixelsPerInch');
SH = floor((ScreenSize(4)-200)/SPPI);
SMult = SH/(PaperSize(2));
print -fillpage