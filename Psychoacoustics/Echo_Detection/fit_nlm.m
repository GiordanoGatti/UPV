function dt50 = fit_nlm(x,n,y,scale)
% Fit a nonlinear model function, and compute predicted (estimated) values for the predictor data using the fitted model
% Data set example
release_version = '2023.04.03'; % year.month.day

x = x*scale;

% x contains the predictor variable values. Each y value is the number of successes in the corresponding number of trials in n

% Sigmoid function

 % y_minus_inf = b(1)
 % y_plus_inf = b(2)
 % slope = b(3)
 % xcenter = b(4) % this is x50 only if b(1) is 0 and b(2) is 1

nlmfun = @(b,x) b(1) + (b(2)-b(1))./(1 + exp(-b(3)*(x - b(4))));

% First guess (the closer the better)

b0 = [0 1 0.001 3000];

% Fit the nonlinear model for y on x

nlm = fitnlm(x,y./n,nlmfun,b0)

b = nlm.Coefficients.Estimate;

% Compute the estimated number of successes

xfit = linspace(x(1), x(end), 100);
yfit = nlmfun(b, xfit);

% Plot the observed success percent and estimated success percent versus the x values

figure
hold on
plot(x/scale, y./n,'o',xfit/scale, yfit,'-')
axis tight

% To obtain the x50 estimation  (x value that is associated with y = 0.5), we isolate x in the function given that y = 0.5:
% 0.5 = b(1) + (b(2)-b(1))./(1 + exp(-b(3)*(x - b(4)))), and arrive to:
x50 = b(4) - log( (b(2) - b(1))/(0.5 - b(1)) - 1)/b(3);
fprintf('\nx50 is the x value that is associated with y = 0.5.\n\nx50 = %g\n\n',x50)

% Ensure the x50 estimation is consistent: y(x = x50) = 0.5:
y_x50 = nlmfun(b, x50);
assert(abs(round(y_x50,3) - 0.5) <= eps(y_x50), sprintf('error y_x50 = %f, when it should be 0.5; error difference = %g', y_x50, abs(y_x50-0.5)));

% If everything runs as expected, plot x50
plot([x50 x50]/scale, [0 0.5], '--')
plot([0 x50]/scale, [0.5 0.5], '--')

xlim([x(1)/scale,x(end)/scale])
fontsize(20,"points")
dt50 = x50/scale;
