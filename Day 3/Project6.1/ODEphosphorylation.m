
close all
clear all

% parameter values
rA_on = 0.27;
rA_off = 0.23;
rA_cat = 0.25;
rI_on = 0.11;
rI_off= 0.1;
rI_cat = 0.3;
P_total = 1;
K_total = 1;

% initial conditions
A0 = 0.7;
I0 = 0;
APc0 = 0.3;
IKc0 = 0.8;

y0 = [A0, I0, APc0, IKc0];
params = [rA_on, rA_off, rA_cat, rI_on, rI_off, rI_cat, P_total, K_total];
tspan = 0:0.1:50;
sol = ode45(@(t,y)ODE_phosphorylating(t, params,y), tspan, y0);

figure;
plot(sol.x, sol.y(1,:),'r','linewidth',1.5,'DisplayName','A'); hold on;
plot(sol.x, sol.y(2,:),'b','linewidth',1.5,'DisplayName','I');
plot(sol.x, sol.y(3,:),'r:','linewidth',1.5,'DisplayName','AP');
plot(sol.x, sol.y(4,:),'b:','linewidth',1.5,'DisplayName','IK');
ylabel('Concentration'); xlabel('Time'); 
leg = legend;
set(gca,'Fontsize',24);
leg.FontSize = 16;




function dydt = ODE_phosphorylating(t, params, y)

rA_on = params(1);
rA_off = params(2);
rA_cat = params(3);
rI_on = params(4);
rI_off= params(5);
rI_cat = params(6);
P_total = params(7);
K_total = params(8);


A = y(1);
I = y(2);
APc = y(3);
IKc = y(4);

P = P_total - APc;
K = K_total - IKc;

% dA/dt: active unbound 
dy dt(1) = rA_cat*IKc - rA_on*A*P + rA_off*APc;

% dI/dt: inactive unbound
dydt(2) = rI_cat*APc - rI_on*I*K - rI_off*IKc;

% dAPc/dt: active bound by phosphatase
dydt(3) = rA_on*A*P - rA_off*APc - rI_cat*APc;

% dIKc/dt: inactive bound by kinase
dydt(4) = rI_on*I*K - rI_off*IKc - rA_cat*IKc;


dydt = dydt';

end