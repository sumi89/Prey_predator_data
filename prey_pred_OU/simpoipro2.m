function p = simpoipro2(lambda2, startt, endt, startpoint, jumpsize)
N(1)=startt;
N(2)=-log(rand(1))/lambda2;
poi(1)=startpoint; % why do we need 'poi()' ?
Poi(2)= jumpsize;
i=2;
while N(i) < endt
N(i+1) = N(i) - log(rand(1))/lambda2; 
Poi(i+1)=Poi(i)+jumpsize;
i = i + 1;
end
p = N