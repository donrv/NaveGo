function [DCMbn_new,A] = dcm_update(DCMbn_old, ang)
% dcm_update: updates DCM
%
%   Copyright (C) 2014, Rodrigo González, all rights reserved. 
%     
%   This file is part of NaveGo, an open-source MATLAB toolbox for 
%   simulation of integrated navigation systems.
%     
%   NaveGo is free software: you can redistribute it and/or modify
%   it under the terms of the GNU Lesser General Public License (LGPL) 
%   version 3 as published by the Free Software Foundation.
% 
%   This program is distributed in the hope that it will be useful,
%   but WITHOUT ANY WARRANTY; without even the implied warranty of
%   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%   GNU Lesser General Public License for more details.
% 
%   You should have received a copy of the GNU Lesser General Public 
%   License along with this program. If not, see 
%   <http://www.gnu.org/licenses/>.
%
% Version: 001
% Date:    2014/09/11
% Author:  Rodrigo Gonzalez <rodralez@frm.utn.edu.ar>
% URL:     https://github.com/rodralez/navego 
%
% Reference: 

S = skewm(ang);
magn = norm(ang);

if magn == 0,
   A = eye(3);
else
   % A(k), Eq. 11.10, p. 312.
   A = eye(3) + (sin(magn)/magn)*S + ((1-cos(magn))/(magn^2))*S*S;  
end

% Eq. 11.4,p. 311.
DCMbn_new = DCMbn_old * A;
