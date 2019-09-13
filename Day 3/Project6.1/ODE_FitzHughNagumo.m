% neuron excilability
% cool useful code bc passing a fxn handle to ODE equations to simulate injection
% of current at particular time points !!!!!

a = 0.5;
b = 0.2; 
c = 0.08;
params = [a,b,c];

V0 = 1;
W0 = 1;
num_cells = 10;
y0 = [V0*ones(num_cells,1), W0*ones(num_cells,1)];


tspan = 0:0.1:50;

I0 = 1; %current injection !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
tStart = 40; 
tStop = 47;
I = @(t) I0*(t > tStart).*(t<tStop);

sol = ode45(@(t,y)ODE_excitability(t,params,y, I(t)), tspan, y0);

figure;
plot(sol.x, sol.y(1,:),'DisplayName','Voltage'); hold on;
plot(sol.x, sol.y(2,:), 'DisplayName', 'Current');
xlabel('Time');
legend;


function dydt = ODE_excitability(t, params, y, I)

a = params(1);
b = params(2);
c = params(3);
d = params(4);

I = 0;
%V = y(1);
%W = y(2);



% dVdt voltage change
%dydt(1) = V - 1/3*V^3 - W; 
dydt(cell,1) = y(cell,1) - 1/3*y(cell,1)^3 - y(cell,2) + I + d*(y(cell-1,1) - 2*y(cell,1) + y(cell+1,1));

% dWdt current change
%dydt(2) = c*(V + a + b*W);% + I;
dydt(cell,2) = c*(y(cell,1) + a + b*cell(cell,2));



dydt = dydt';
end