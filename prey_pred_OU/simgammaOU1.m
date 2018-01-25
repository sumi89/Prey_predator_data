function g1 = simgammaOU1(a, b, yo, startt, endt, dt, w1, lambda1)

%simulaating Poisson process
N = simpoipro1(a*lambda1, startt, endt, 0, 1); 

% Initial time start point
t(1)=startt; 

% Initial condition
y(1)=yo; 

%%% the number of jump in each compact interval
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

for k = 2 : i
% Simulate the OU process 
    sumx = 0;
    
    for j = n(k-1)+1 : n(k)
        sumx = sumx - log(rand(1))/b;
        endls
    
    y(k)=(1-lambda1*dt)*y(k-1)+ sumx;
end

rng('default') % rng('default') puts the settings of the random number 
                % generator used by rand , randi , and randn to their
                % default values. This way, the same random numbers are 
                % produced as if you restarted MATLAB.
g1=w1*y;

