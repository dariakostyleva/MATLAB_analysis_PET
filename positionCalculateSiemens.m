

function [x, y] = positionCalculateSiemens(crystalx, crystaly)
    % start with defining dimensions
    %sizeCrystal = 4;    % in mm
    sizeCrystal = 240/52;
    numCrystal = 52;    % number of crystal rows and columns in each scanner panel
     
% The calculation below does not take the gaps in-between block detectors
% into account, it basically assumes that the crystals are evenly
% distributed along a circle. In reality, 13 crystals are parallel in one
% block detector and the block detectors are evenly distributed along a
% circle.
% So this part can be made more accurate.
% 
     x = (((crystalx+1)*sizeCrystal)-sizeCrystal*0.5)+4*rand-2; % uniform across x
     y = (((crystaly+1)*sizeCrystal)-sizeCrystal*0.5)+4*rand-2; % uniform across y  
%     x = (crystalx+1)*sizeCrystal; % uniform across x
%     y = (crystaly+1)*sizeCrystal; % uniform across y  


end

