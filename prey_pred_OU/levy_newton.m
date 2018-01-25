function [simregx,simregy] = levy_newton(a_v, b_v, yo, startt, endt, dt, lambda1)

%simulating Poisson process
N = simpoipro2_v(a_v*lambda1', startt, endt, 0, 1);
P = N(1,:);
Q = N(2,:);

% Initial time start point
t(1)=startt; 

%single
% t(1)  t(2)    t(3)    t(4)

%vectore
% t(1,1)    t(1,2)  t(1,3)  t(1,4)
% t(2,1)    t(2,2)  t(2,3)  t(2,4)

% Initial condition
z(1,1) = yo(1);
z(2,1) = yo(2);
% y(1)=yo; 

%%% the number of jump in each compact interval
%for k = 1:2

i=1;  % what is 'i' ------ to continue the while loop
n(1)=0; % what is 'n'----- number of jumps in each interval
j=2;    % what is 'j' ----- it is for poisson process element, as N(1) = 0 'j' is chosen as 2
overt = t(i);   % 't' is time
while overt < endt
    i = i + 1;
    n(i) = n(i-1);
    t(i)=t(i-1)+dt; % Defining the time steps
                % where did 'dt' define ? ---- 'dt' is the input of the function simgammaOU1 
    while t(i) >= N(j) 
        n(i)=j-1;
        j=j+1;
    end
    
    overt = t(i);
end

% ========================== % 

for l = 1:2
    for k = 2 : i
% Simulate the OU process 
    sumx = 0;
    sumy = 0;

        for j = n(k-1)+1 : n(k)
            sumx = sumx - log(rand(1))/b_v(1);
            sumy = sumy - log(rand(1))/b_v(2);      % use sum = sum -log(rand(1))/b_v
%             sum(j) = sum(j-1) - log(rand(1))/b_v(l);
        end
        sum = [sumx;sumy];
%         x(k)=(1-lambda1(1)*dt)*x(k-1)+ sumx;
        z(l,k)=(1-lambda1(l)*dt)*z(l,k-1)+ sum(l);
    end
end

rng('default') % rng('default') puts the settings of the random number 
                % generator used by rand , randi , and randn to their
                % default values. This way, the same random numbers are 
                % produced as if you restarted MATLAB.
simreg = z;
simregx = simreg(1,:);
simregy = simreg(2,:);
