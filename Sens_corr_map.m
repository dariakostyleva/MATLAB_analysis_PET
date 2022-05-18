%%% This script does interpolation and makes sens correction map %%%

%%% Load the point source data
pin = load('sens_pin1_1.mat'); % with one row of extrap values
% inside:
%        ar(:,1)  x [mm], 
%        ar(:,2)  y [mm], 
%        ar(:,4)  sensitivity [counts/sec/kBq]
%        ar(:,7)  abs error on sensitivity [counts/sec/kBq]
br = 0.9030; 
%%% Interpolate
% grid of query points for interpolation
[xq,yq] = meshgrid(linspace(-119,119,120),linspace(-119,119,120));
pin.ar(:,4) = pin.ar(:,4)*10^(-3)/br; % making sensitivity dimensionless plus corr on br ratio
%pin.ar(:,7) = sqrt(pin.ar(:,7).^2 + e_br^2)*10^(-3); % making abs error on sensitivity dimensionless plus corr on br ratio
%err_map = max(ar(:,7));
map = griddata(pin.ar(:,1),pin.ar(:,2),pin.ar(:,4),xq,yq); % map is dimensionless
%err_map = griddata(pin.ar(:,1),pin.ar(:,2),pin.ar(:,7),xq,yq); % abs error bar map is dimensionless 
%save('sens_corr_map_pin_3_1.mat','map');


range = [-119:2:119];
r = [-39:2:97]
fig = figure;
%clesubplot(1,2,1);
surf(range,range,map,'DisplayName','Correction map');
xlabel('X (mm)');
ylabel('Y (mm)');
zlabel('Sensitivity and attenuation factor');
hold on
scatter3(pin.ar(:,1),pin.ar(:,2),pin.ar(:,4),'o','MarkerFaceColor', 'k','DisplayName','Measured data')
legend

A = sum(map(58:62,:),'omitnan')
A = A(A ~= 0);
return;
subplot(1,2,2);
%sum(map(50:70,:))
hold on;
%plot(range,rescale(sum(map,1,'omitnan')),'-ob')
%line([-39.3 -39.3],[0 1])
plot(r,rescale(A),'-k','DisplayName','8 mm slice of map along beam direction','LineWidth',2)
rectangle('Position',[-39.3 0 180 1], 'FaceColor', [0 0 1 0.1], 'EdgeColor', [0 0 1 0.5])
hline = line(NaN,NaN,'LineStyle','-','Color',[0 0 1 0.5],'DisplayName','Position of PMMA');
xlabel('X (mm)');
ylabel('Sensitivity and attenuation factor scaled (a.u.)');
xlim([-100 100])
ylim([0 1])
legend

set(findall(gcf,'-property','FontSize'),'FontSize',14)
fig.Position = [500 500 1000 500]
orient(fig,'landscape')
print(fig,'LandscapePage.pdf','-dpdf')
