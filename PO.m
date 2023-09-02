%Periodic Orbits

% Define parameters for a periodic orbit (e.g., Earth orbit)
mu = 3.986e14; % Gravitational constant for Earth (m^3/s^2)
radius = 6.371e6; % Earth's radius (meters)

% Calculate the orbital velocity for a circular orbit at a given altitude
altitude = 300e3; % 300 km altitude
v = sqrt(mu / (radius + altitude));

% Plot a circular orbit
theta = linspace(0, 2 * pi, 100);
x = (radius + altitude) * cos(theta);
y = (radius + altitude) * sin(theta);

figure;
plot(x, y);
axis equal;
xlabel('X Position (m)');
ylabel('Y Position (m)');
title('Circular Orbit around Earth');
grid on;
