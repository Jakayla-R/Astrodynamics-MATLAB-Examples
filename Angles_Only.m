%Angles-Only Measurement 

%Estimate the direction (azimuth & elevation) of a distant object using
%angles-only measurments from a sensor. 

% Simulated angles-only measurements (azimuth and elevation)
azimuth = 30; % True azimuth angle in degrees
elevation = 20; % True elevation angle in degrees
measurement_noise = 2; % Measurement noise in degrees

% Add measurement noise
noisy_azimuth = azimuth + measurement_noise * randn();
noisy_elevation = elevation + measurement_noise * randn();

% Estimated direction using noisy measurements
estimated_azimuth = noisy_azimuth;
estimated_elevation = noisy_elevation;

% Display results
fprintf('Estimated Azimuth: %.2f degrees\n', estimated_azimuth);
fprintf('Estimated Elevation: %.2f degrees\n', estimated_elevation);
