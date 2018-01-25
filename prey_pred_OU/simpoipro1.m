function p = simpoipro1(lambda1, startt, endt, startpoint, jumpsize)
N(1)=startt;
N(2)=-log(rand(1))/lambda1; % rand(1) - generates a random number
poi(1)=startpoint; % why do we need 'poi()' ?
Poi(2)= jumpsize;
i=2;
while N(i) < endt
N(i+1) = N(i) - log(rand(1))/lambda1; 
Poi(i+1)=Poi(i)+jumpsize;
i = i + 1;
end
p = N
% plot ( p, Poi, '*')
% This program will generate a row vertor. 
% Ques: Is this vector represents the time for each event in the time interval (0,1) ?
% Ans : No.