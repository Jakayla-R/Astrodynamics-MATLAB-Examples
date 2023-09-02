% Restricted 3-Body Problem 

% Define the parameters for the RTBP (e.g., Earth-Moon system)
mu = 0.012277471; % Mass ratio (mu = m2 / (m1 + m2))
omega = 1; % Angular velocity (normalized)

% Define the equations of motion for the RTBP
rtbp_ode = @(t, y) rtbp_equations(t, y, mu, omega);

% Initial conditions (position and velocity)
y0 = [0.5; 0; 0; 0.1];

% Time span
tspan = [0, 100];

% Solve the RTBP using ODE45
[t, y] = ode45(rtbp_ode, tspan, y0);

% Plot the trajectory
figure;
plot(y(:, 1), y(:, 2));
xlabel('X Position');
ylabel('Y Position');
title('Restricted Three-Body Problem Trajectory');
grid on;

function dydt = rtbp_equations(~, y, mu, omega)
    r1 = sqrt((y(1) + mu)^2 + y(2)^2);
    r2 = sqrt((y(1) - 1 + mu)^2 + y(2)^2);
    
    dydt = zeros(4, 1);
    dydt(1) = y(3);
    dydt(2) = y(4);
    dydt(3) = 2 * omega * y(4) + y(1) - (1 - mu) * (y(1) + mu) / r1^3 - mu * (y(1) - 1 + mu) / r2^3;
    dydt(4) = -2 * omega * y(3) + y(2) - (1 - mu) * y(2) / r1^3 - mu * y(2) / r2^3;
end
