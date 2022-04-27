tic

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Book- 83
% Lisnianski, A., Frenkel, I., & Ding, Y. (2010).
% Multi-state system reliability analysis and optimization
% for engineers and industrial managers. Springer Science & Business Media.
%% specify transition rate
%for the element 1
Lambda2_1_1=7; Mu1_2_1=100;
%for the element 2
Lambda2_1_2=10; Mu1_2_2=80;
%for the element 3
Lambda3_2_3=10;Lambda2_1_3=7;
Mu1_2_3=120; Mu2_3_3=110;

%% define system of ordinary differential euqation (ODE)
syms t p
g = @(t,p)[
    -(Lambda2_1_1+Lambda2_1_2+Lambda3_2_3)*p(1)+Mu1_2_1*p(2)+Mu1_2_2*p(3)+Mu2_3_3*p(4);%f(1)
    Lambda2_1_1*p(1)-(Mu1_2_1+Lambda2_1_2+Lambda3_2_3)*p(2)+Mu1_2_2*p(5)+Mu2_3_3*p(6);%f(2)
    Lambda2_1_2*p(1)-(Mu1_2_2+Lambda2_1_1+Lambda3_2_3)*p(3)+Mu1_2_1*p(5)+Mu2_3_3*p(7);%f(3)
    Lambda3_2_3*p(1)-(Mu2_3_3+Lambda2_1_1+Lambda2_1_2+Lambda2_1_3)*p(4)+Mu1_2_1*p(6)+Mu1_2_2*p(7)+Mu1_2_3*p(8);%f(4)
    Lambda2_1_2*p(2)+Lambda2_1_1*p(3)-(Mu1_2_2+Mu1_2_1+Lambda3_2_3)*p(5)+Mu2_3_3*p(9);%f(5)
    Lambda3_2_3*p(2)+Lambda2_1_1*p(4)-(Mu2_3_3+Mu1_2_1+Lambda2_1_2+Lambda2_1_3)*p(6)+Mu1_2_2*p(9)+Mu1_2_3*p(10);%f(6)
    Lambda3_2_3*p(3)+Lambda2_1_2*p(4)-(Mu2_3_3+Mu1_2_2+Lambda2_1_1+Lambda2_1_3)*p(7)+Mu1_2_1*p(9)+Mu1_2_3*p(11);%f(7)
    Lambda2_1_3*p(4)-(Mu1_2_3+Lambda2_1_1+Lambda2_1_2)*p(8)+Mu1_2_1*p(10)+Mu1_2_2*p(11);%f(8)
    Lambda3_2_3*p(5)+Lambda2_1_2*p(6)+Lambda2_1_1*p(7)-(Mu2_3_3+Mu1_2_2+Mu1_2_1+Lambda2_1_3)*p(9)+Mu1_2_3*p(12);%f(9)
    Lambda2_1_3*p(6)+Lambda2_1_1*p(8)-(Mu1_2_3+Mu1_2_1+Lambda2_1_2)*p(10)+Mu1_2_2*p(12);%f(10)
    Lambda2_1_3*p(7)+Lambda2_1_2*p(8)-(Mu1_2_3+Mu1_2_2+Lambda2_1_1)*p(11)+Mu1_2_1*p(12);%f(11)
    Lambda2_1_3*p(9)+Lambda2_1_2*p(10)+Lambda2_1_1*p(11)-(Mu1_2_3+Mu1_2_2+Mu1_2_1)*p(12);%f(12)
   ];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ODE solver
[t,xa] = ode45(@(t,p) g(t,p),linspace(0,0.2,500+1),[1 0 0 0 0 0 0 0 0 0 0 0]);
% visualize
figure
hold on
for i = 1:12
    plot(t,xa(:,i),'LineWidth',2)
end
%title(['y(t) for a=',num2str(a)'])
%legend('State-1','State-2','State-3','State-4','State-5','State-6',...
%    'State-7','State-8','State-9','State-10','State-11','State-12')
xlabel('t')
ylabel('P(t)')
ylim([0 1])
%xlim([0 300])
title('Runge-Kutta Method(Homogenous)')
ax = gca;
%ax.FontSize = 13;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% prepare output
intOut = [t,xa];
%output files
csvwrite('Example_3_solver.csv',intOut)

toc
