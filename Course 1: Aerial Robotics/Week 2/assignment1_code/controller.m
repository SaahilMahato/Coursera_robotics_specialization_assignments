function [ u ] = pd_controller(~, s, s_des, params)
%PD_CONTROLLER  PD controller for the height
%
%   s: 2x1 vector containing the current state [z; v_z]
%   s_des: 2x1 vector containing desired state [z; v_z]
%   params: robot parameters

u = 0;


% FILL IN YOUR CODE HERE

% setting controller gains
kv = 15;
kp = 120;

% derivatives
e = s_des - s;
z_des = 0;
u = params.mass*(z_des + kp*e(1) + kv*e(2) + params.gravity);


end

