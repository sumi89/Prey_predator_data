function RMSE_x = rmeanx(regx,simregx)

(regx-simregx);   % Errors
(regx-simregx).^2 ;  % Squared Error
mean((regx-simregx).^2) ;  % Mean Squared Error
RM_x = sqrt(mean((regx-simregx).^2)); % Root Mean Squared Error

RMSE_x=RM_x;