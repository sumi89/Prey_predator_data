function p = simpoipro2_v(lambda1, startt, endt, startpoint, jumpsize)
N(1,1)=startt;
N(2,1)=startt;
% N(1,1)=startt(1);
% N(2,1)=startt(2);
N(1,2)=-log(rand(1))/lambda1(1);
N(2,2)=-log(rand(1))/lambda1(2);

% as startt(1) and startt(2) has same value, we can use just 'startt'

poi(1,1)=startpoint; 
poi(2,1)=startpoint;
Poi(1,2)= jumpsize;
Poi(2,2)= jumpsize;
% poi(1,1)=startpoint(1); 
% poi(2,1)=startpoint(2);
% Poi(1,2)= jumpsize(1);
% Poi(2,2)= jumpsize(2);

% 
% N(1)=startt;
% N(2)=-log(rand(1))/lambda2;
% poi(1)=startpoint; % why do we need 'poi()' ?
% Poi(2)= jumpsize;



% N(1,1) N(1,2) N(1,3) N(1,4)
% N(2,1) N(2,2) N(2,3) N(2,4)
for j=1:2
  i=2;
   while (N(j,i) < endt)
    N(j, i+1) = N(j, i) - log(rand(1))/lambda1(j); 
    Poi(j,i+1)=Poi(j,i)+jumpsize;
    i = i + 1;
   end
end
p = N;
%P = N(1,:);
%Q = N(2,:);
