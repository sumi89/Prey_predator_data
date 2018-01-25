function RMSE = rmean(reg1,simreg1)

(reg1-simreg1);   % Errors
(reg1-simreg1).^2 ;  % Squared Error
mean((reg1-simreg1).^2) ;  % Mean Squared Error
RM = sqrt(mean((reg1-simreg1).^2)); % Root Mean Squared Error

RMSE=RM;