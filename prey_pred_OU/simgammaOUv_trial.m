function [simregx,simregy] = simgammaOUv_trial(a_v, b_v, yo, startt, endt, dt, lambda1)



%simulaating Poisson process
N = simpoipro2_v(a_v*lambda1', startt, endt, 0, 1); 
P = N(1,:);
Q = N(2,:);


% Initial time start point
% % tx(1) = startt(1);
%t(1,1) = startt(1);
% % ty(1) = startt(2);
%t(2,1) = startt(2);

t(1)=startt; 


%single
% t(1)  t(2)    t(3)    t(4)

%vectore
% t(1,1)    t(1,2)  t(1,3)  t(1,4)
% t(2,1)    t(2,2)  t(2,3)  t(2,4)


% Initial condition
x(1) = yo(1);
y(1) = yo(2);
% y(1)=yo; 

%%% the number of jump in each compact interval

    i=1;  % what is 'i' ------ to continue the while loop
%     n(k,1)=0; % what is 'n'----- number of jumps in each interval
    %n(2,1)=0;
    n(1) = 0;
    m(1) = 0;
    
    j=2;    % what is 'j' ----- it is for poisson process element, as N(1) = 0 'j' is chosen as 2
%     overt(k) = t(k,i);   % 't' is time % overt is a vector
    %overt(2) = t(2,1);
    overt= t(i); 
%     while overt(k) < endt(k)
while overt < endt
        i = i + 1;
        n(i) = n(i-1);
        m(i) = m(i-1);
%         n(k,i) = n(k,i-1);
        t(i)=t(i-1)+dt;
%         t(k,i)=t(k,i-1)+dt; % Defining the time steps
                % where did 'dt' define ? ---- 'dt' is the input of the function simgammaOU1 
        while t(i) >= P(j) 
            n(i)=j-1;
            j=j+1;
        end
        
        while t(i) >= Q(j) 
            m(i)=j-1;
            j=j+1;
        end
    
        overt = t(i);
end

% ========================== % 

for k = 2 : i
% Simulate the OU process 
    sumx = 0;
    sumy = 0;
    
    for j = n(k-1)+1 : n(k)
        sumx = sumx - log(rand(1))/b_v(1);
        sumy = sumy - log(rand(1))/b_v(2);
    end
    x(k)=(1-lambda1(1)*dt)*x(k-1)+ sumx;
    y(k)=(1-lambda1(2)*dt)*y(k-1)+ sumy;
end

rng('default') % rng('default') puts the settings of the random number 
                % generator used by rand , randi , and randn to their
                % default values. This way, the same random numbers are 
                % produced as if you restarted MATLAB.

simregx = x ;
simregy = y ;
