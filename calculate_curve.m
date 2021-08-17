% *** This function converts scaner coordinates X, Y given in crystals 
% into space coordinates X, Y in mm. Filed-of-View is at (0,0,0). The
% calculation includes curvature of the scanner in X direction.

function [x, y] = calculate_curve(crystal)
   
% ***** dimensions of scanner ***** 
    B = 54.85; % mm, measured size of block in tapered direction
    h = 4;    % mm, size of one crystal
    theta = (7.5/2)*pi/180; % tapered angle
    dx = (B - 13*h)/2 + 0.375; % mm, calculated metal cover plus correction
    dy = (B - 13*h)/2 + 0.7;  % mm, calculated metal cover plus correction
    
% ***** Calculation of X (mm) and Y (mm) in FOV (0,0,0) ***** 
    %  block 1 
    if crystal >= 0 && crystal <= 12
        x = block1(crystal,theta,dx);
        y = block1(crystal,0,dy);
        
    %  block 2 
    elseif crystal >= 13 && crystal <= 25
        x = block2(crystal,theta,dx);
        y = block2(crystal,0,dy);
       
    %  block 3 
    elseif crystal >= 26 && crystal <= 38 
        x = block3(crystal,theta,dx);
        y = block3(crystal,0,dy);
        
    % block 4 
    elseif crystal >= 39 && crystal <= 51
        x = block4(crystal,theta,dx);
        y = block4(crystal,0,dy);        
    end
    
% ***** Functions for blocks. Blocks count from left to right ******
   function [mm] = block1(cryst,ang,d)
        if cryst == 12 
            mm = block2(13,ang,d) - (d*cos(3*ang) + d*cos(ang) + h*cos(3*ang)*0.5 + h*cos(ang)*0.5);
        else
            mm = block1(cryst + 1,ang,d) - h*cos(3*ang);
        end
   end
   
   function [mm] = block2(cryst,ang,d)
        if cryst == 25 
            mm = (d*cos(ang) + h*cos(ang)*0.5)*(-1);
        else
            mm = block2(cryst + 1,ang,d) - h*cos(ang);
        end
    end
    function [mm] = block3(cryst,ang,d)
        if cryst == 26 
            mm = d*cos(ang) + h*cos(ang)*0.5;
        else
            mm = block3(cryst - 1,ang,d) + h*cos(ang);
        end
    end

    function [mm] = block4(cryst,ang,d)
        if cryst == 39 
            mm = d*cos(3*ang) + d*cos(ang) + h*cos(3*ang)*0.5 + h*cos(ang)*0.5 + block3(38,ang,d);
        else
            mm = block4(cryst - 1,ang,d) + h*cos(3*ang);
        end
    end

    
end
