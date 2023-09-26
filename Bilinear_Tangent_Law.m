% Constants
C1 = 0.02;
C2 = 800;
C3 = 8;
C4 = 200;

% Total burn time
T = 600; % seconds

% Time points
t_points = [0,100, 200, 300, 400, 500, 600]; % seconds

% Compute thrust angle and tan(theta) at specified time points
theta_rad = zeros(size(t_points));
tan_theta = zeros(size(t_points));

for i = 1:length(t_points)
    t = t_points(i);
    tan_theta(i) = (C1 * t + C2) / (C3 * t + C4);
    theta_rad(i) = atan(tan_theta(i));
end

% Convert theta to degrees
theta_deg = rad2deg(theta_rad);

% Plot tan(theta) and thrust angle vs. time
figure;

subplot(2, 1, 1);
plot(t_points, tan_theta, '-o');
title('tan(\theta) vs. Time');
xlabel('Time (s)');
ylabel('tan(\theta)');

subplot(2, 1, 2);
plot(t_points, theta_deg, '-o');
title('\theta vs. Time');
xlabel('Time (s)');
ylabel('\theta (degrees)');

% Display the computed values
disp('Time (s)   tan(\theta)   \theta (degrees)');
disp([t_points' tan_theta' theta_deg']);