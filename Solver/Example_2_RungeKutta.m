tic
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% define system of ordinary differential euqation (ODE)
syms t p
g = @(t,p)[-2.572e-4*t*p(1);
    1.12e-4*t*p(1)-2.012e-4*t*p(2);
   1.452e-4*t*p(1)+2.012e-4*t*p(2)];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ODE solver
[t,xa] = ode45(@(t,p) g(t,p),linspace(0,300,300+1),[1 0 0]);
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
title('Runge-Kutta Method(Non-Homogenous)')
ax = gca;
%ax.FontSize = 13;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% prepare output
intOut = [t,xa];
%output files
csvwrite('Example_2_solver.csv',intOut)

toc
