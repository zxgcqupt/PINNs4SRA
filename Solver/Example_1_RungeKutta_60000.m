%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% define system of ordinary differential euqation (ODE)
syms t p
g = @(t,p)[-1.286e-4*p(1);
    5.6e-5*p(1)-1.006e-4*p(2);
   7.26e-5*p(1)+1.006e-4*p(2)];        

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ODE solver           
[t,xa] = ode45(@(t,p) g(t,p),linspace(0,60000,5000+1),[1 0 0]);
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
% prepare output
intOut = [t,xa];
%output files
csvwrite('Example_1_60000_solver.csv',intOut)
