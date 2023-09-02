%Sequential Estimation

%Track the position of a moving object using simulated range measurements 
% as they become available over time.

% Simulated measurements (range to the moving object)
time = 1:10; % Time instances
true_position = [100, 200]; % True initial position (meters)
velocity = [10, -5]; % True velocity (m/s)

% Simulated measurements at each time step
range_measurements = generate_range_measurements(true_position, velocity, time);

% Initialize the state estimate
state_estimate = true_position;

% Perform sequential estimation
for i = 1:length(time)
    state_estimate = sequential_estimation(state_estimate, range_measurements(i));
    fprintf('Time: %d, Estimated Position: [%.2f, %.2f]\n', time(i), state_estimate);
end

function range_measurements = generate_range_measurements(true_position, velocity, time)
    % Simulate range measurements with noise
    range_measurements = zeros(1, length(time));
    for i = 1:length(time)
        true_range = norm(true_position);
        range_measurements(i) = true_range + randn * 5; % Add noise
        true_position = true_position + velocity; % Update true position
    end
end

function updated_state = sequential_estimation(previous_state, range_measurement)
    % Update the state estimate using the new range measurement
    updated_state = previous_state + (range_measurement - norm(previous_state)) * previous_state / norm(previous_state);
end
