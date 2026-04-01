function [ex, ey, gxy] = calculateRosette(e, angles_deg)
    % e: [strain_a, strain_b, strain_c] in microstrain
    % angles_deg: [angle_a, angle_b, angle_c] in degrees
    
    % Convert angles to radians:
    theta = deg2rad(angles_deg);
    
    % Setup Transformation Matrix:
    M = [cos(theta(1))^2, sin(theta(1))^2, sin(theta(1))*cos(theta(1));
         cos(theta(2))^2, sin(theta(2))^2, sin(theta(2))*cos(theta(2));
         cos(theta(3))^2, sin(theta(3))^2, sin(theta(3))*cos(theta(3))];
     
    % Solve for strain components: [ex, ey, gxy]
    strains_xy = M \ e';
    ex = strains_xy(1); ey = strains_xy(2); gxy = strains_xy(3);
end