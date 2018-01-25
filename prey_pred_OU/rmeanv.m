function RMSE_v = rmeanv(regv,simregv)

(regv-simregv);   % Errors
(regv-simregv).^2 ;  % Squared Error
mean((regv-simregv).^2) ;  % Mean Squared Error
RM_v = sqrt(mean((regv-simregv).^2)); % Root Mean Squared Error

RMSE_v=RM_v';