%Range Measurements 

%Estimate the distance to a target using range measurement from a radar
%sensor 

% Simulated range measurement
true_range = 500; % True range in meters
measurement_noise = 10; % Measurement noise in meters

% Add measurement noise
noisy_range = true_range + measurement_noise * randn();

% Estimated range using noisy measurement
estimated_range = noisy_range;

% Display results
fprintf('Estimated Range: %.2f meters\n', estimated_range);
