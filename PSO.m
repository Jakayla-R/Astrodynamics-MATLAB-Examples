%Particle Swarm Optimization

% Define the objective function to be optimized
objective_function = @(x) x(1)^2 + x(2)^2; % Example: minimize x^2 + y^2

% PSO parameters
num_particles = 30;
num_dimensions = 2;
max_iterations = 100;
c1 = 2.0; % Cognitive coefficient
c2 = 2.0; % Social coefficient
w = 0.7;  % Inertia weight

% Initialize particles and velocities
particles = rand(num_dimensions, num_particles);
velocities = rand(num_dimensions, num_particles);
personal_best_positions = particles;
personal_best_values = zeros(1, num_particles);

global_best_position = zeros(num_dimensions, 1);
global_best_value = inf;

% Main PSO loop
for iteration = 1:max_iterations
    % Evaluate the objective function for each particle
    values = objective_function(particles);
    
    % Update personal best positions and values
    for i = 1:num_particles
        if values(i) < personal_best_values(i)
            personal_best_positions(:, i) = particles(:, i);
            personal_best_values(i) = values(i);
        end
    end
    
    % Update global best position and value
    [min_value, min_index] = min(personal_best_values);
    if min_value < global_best_value
        global_best_position = personal_best_positions(:, min_index);
        global_best_value = min_value;
    end
    
    % Update particle velocities and positions
    for i = 1:num_particles
        r1 = rand(num_dimensions, 1);
        r2 = rand(num_dimensions, 1);
        velocities(:, i) = w * velocities(:, i) + ...
            c1 * r1 .* (personal_best_positions(:, i) - particles(:, i)) + ...
            c2 * r2 .* (global_best_position - particles(:, i));
        particles(:, i) = particles(:, i) + velocities(:, i);
    end
end

% Display the result
fprintf('Optimal solution found at: (%.4f, %.4f)\n', global_best_position);
fprintf('Optimal value of the objective function: %.4f\n', global_best_value);
