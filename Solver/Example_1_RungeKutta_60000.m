%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% define system of ordinary differential euqation (ODE)
syms t p
g = @(t,p)[-1.286e-4*p(1);
    5.6e-5*p(1)-1.006e-4*p(2);
   7.26e-5*p(1)+1.006e-4*p(2)];        

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ODE solver           
[t,xa] = ode45(@(t,p) g(t,p),[0 60000],[1 0 0]);
% [t,xa] = ode23(@(t,p) g(t,p),[0 1000],[1 0 0]);
% visualize
figure
plot(t,xa(:,1),'r','LineWidth',2)
hold on 
plot(t,xa(:,2),'b','LineWidth',2)
hold on 
plot(t,xa(:,3),'g','LineWidth',2)
%title(['y(t) for a=',num2str(a)'])
legend('State-1','State-2','State-3')
xlabel('t')
ylabel('P(t)')
ylim([0 1])
%xlim([0 300])
title('Runge-Kutta Method(Homogenous)')
ax = gca;
ax.FontSize = 13;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% interpolate time series data
ts = timeseries(xa,t,'Name','Solver-out'); % Create timeseries object
% Generate the new timeseries of interest
timeNEW =linspace(0,60000,5000+1); % Specify the new time vector of interest
ts1 = resample(ts, timeNEW,'linear');
%ts2 = resample(ts, timeNEW,'zoh');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% prepare output
intOut = [ts1.Time,ts1.Data];
tt = intOut(:,1);
%output files
csvwrite('Example_1_60000_solver.csv',intOut)
