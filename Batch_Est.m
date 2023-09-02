%Batch Estimation 
%Estimate the orbit of a spacecraft using simulated range measurements over a period of time. 

% Simulated measurements (range to the spacecraft)
time = 1:10; % Time instances
range_measurements = [200, 350, 500, 600, 750, 850, 950, 1100, 1250, 1400]; % Range measurements (meters)

% Initial state guess (position and velocity)
initial_state = [0, 0, 100, 10]; % [x, y, x_dot, y_dot] (meters, m/s)

% Define a function for batch estimation
batch_estimate = batch_estimation(time, range_measurements, initial_state);

% Display the estimated orbit
fprintf('Estimated state: [x, y, x_dot, y_dot] = [%.2f, %.2f, %.2f, %.2f]\n', batch_estimate);

function estimated_state = batch_estimation(time, range_measurements, initial_state)
    % Batch estimation using least squares
    A = [ones(length(time), 1), time'];
    b = range_measurements';

    % Solve the linear system to estimate position and velocity
    estimated_params = A \ b;

    estimated_state = [initial_state(1:2), estimated_params(2), initial_state(4)];
end
