%% Figure for paper

%%% Load the point source data
pin1_1 = load('sens_pin1_1_mod.mat'); % with one row of extrap values
pin3_1 = load('sens_pin3_1_mod.mat'); % with one row of extrap values
% inside:
%        ar(:,1)  x [mm], 
%        ar(:,2)  y [mm], 
%        ar(:,4)  sensitivity [counts/sec/kBq]
%        ar(:,7)  abs error on sensitivity [counts/sec/kBq]
br = 0.9030; 
%%% Interpolate
% grid of query points for interpolation
[xq,yq] = meshgrid(linspace(-119,119,120),linspace(-119,119,120));
pin1_1.ar(:,4) = pin1_1.ar(:,4)*10^(-3)/br; % making sensitivity dimensionless plus corr on br ratio
map1_1 = griddata(pin1_1.ar(:,1),pin1_1.ar(:,2),pin1_1.ar(:,4),xq,yq); % map is dimensionless

pin3_1.ar(:,4) = pin3_1.ar(:,4)*10^(-3)/br; % making sensitivity dimensionless plus corr on br ratio
map3_1 = griddata(pin3_1.ar(:,1),pin3_1.ar(:,2),pin3_1.ar(:,4),xq,yq); % map is dimensionless


range = [-119:2:119];
fig = figure;
subplot(1,2,1);
surf(range,range,map1_1,'DisplayName','Correction map');
set(findall(gcf,'-property','FontSize'),'FontSize',14)
xlabel('X (mm)');
ylabel('Y (mm)');
xlim([-100,100]);
ylim([-100,100]);

%sset(gca, 'XDir','reverse')
zlabel('Sensitivity and attenuation factor');
%hold on
%scatter3(pin1_1.ar(:,1),pin1_1.ar(:,2),pin1_1.ar(:,4),'o','MarkerFaceColor', 'k','DisplayName','Measured data')
%legend

subplot(1,2,2);
surf(range,range,map3_1,'DisplayName','Correction map');
set(findall(gcf,'-property','FontSize'),'FontSize',14)
xlabel('X (mm)');
ylabel('Y (mm)');
xlim([-100,100]);
ylim([-100,100]);
zlim([0,0.025]);
zlabel('Sensitivity and attenuation factor');
%hold on
%scatter3(pin3_1.ar(:,1),pin3_1.ar(:,2),pin3_1.ar(:,4),'o','MarkerFaceColor', 'k','DisplayName','Measured data')
%legend

orient(fig,'landscape')