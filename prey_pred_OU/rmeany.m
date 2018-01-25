function RMSE_y = rmeany(regy,simregy)

(regy-simregy);   % Errors
(regy-simregy).^2 ;  % Squared Error
mean((regy-simregy).^2) ;  % Mean Squared Error
RM_y = sqrt(mean((regy-simregy).^2)); % Root Mean Squared Error

RMSE_y=RM_y;