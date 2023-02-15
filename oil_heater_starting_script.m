%% ME 492 Project - Oil Heater Model
%% Parameters:

v = 0.001278; % volumetric flow rate (constant)

% Set Temperature:
T_set =    80 + 273; % set temperature (K)

%% 
% _Set thresholds:_
T_upper_tresh = T_set + 3;
T_lower_tresh = T_set - 3.5;

% *Set Resistor Parameters:*
W =      100; % input work 
m_r =    20; % resistor's mass
c_r =    0.4; % resistor's c (kJ/kgK)
U =      0.27; % overall heat transfer coefficient (kW/m2K)
A =      1; % area of the resistor (m2)
Tr_i =   T_set; % initial resistor temperature (K)

% Q_e fit:
% concav
a_cv_int = [-0.1919 -0.2681];
b_cv_int = [-80.2397 -110.964];
c_cv_int = [36.531 19.2292];
a_cv = interp1([353 383], a_cv_int, T_set, "linear", "extrap");
b_cv = interp1([353 383], b_cv_int, T_set, "linear", "extrap");
c_cv = interp1([353 383], c_cv_int, T_set, "linear", "extrap");

% convex
a_cx_int = [0.3102 0.1053];
b_cx_int = [-79.1199 -109.644];
c_cx_int = [24.3597 11.8066];
a_cx = interp1([353 383], a_cx_int, T_set, "linear", "extrap");
b_cx = interp1([353 383], b_cx_int, T_set, "linear", "extrap");
c_cx = interp1([353 383], c_cx_int, T_set, "linear", "extrap");

% Q_loss fit:
Q_tank = -7.4074e-06*(T_set-273-110)^4 - 8; % quadratic fit

% *Density & Specific Heat Lookup Tables:*
T_lookup = [0 20 40 100 150 200 250 300 340] + 273;
d_lookup = [871 858 845 804 773 741 708 676 651];
c_lookup = [1.962 2.049 2.137 2.4 2.619 2.838 3.058 3.277 3.452];
%% 
% *Heater parameters:*
v_h =       0.29; % oil's volume in the heater
T2_i =     T_set; % initial oil temperature in the heater

%% 
% *Evaporator parameters:*
v_e =    0.00384;                % oil's volume in the evaporator
T4_i =   T_set - 13;             % initial oil temperature in evaporator

%% 
% *Tank parameters:*
v_t =   0.167;                  % oil's volume in the tank + pipes
T1_i =  T_set - 28;             % initial oil temperature in tank

%% Results:
% _Simulation:_
out = sim('OilHeaterModel', 2300);
T1 = out.T1.Data - 273;
T2 = out.T2.Data - 273;
T4 = out.T4.Data - 273;

time = out.T1.Time;

% *Plot:*
figure
plot(time, T1)
grid on, hold on
title("Tank Outlet Temperature")
xlabel("Time (sec)")
ylabel("Temperature (C)")
ylim([T1_i-273-30 T1_i-273+30])
xlim([300 1600])

figure
plot(time, T2)
grid on, hold on
title("Heater Outlet Temperature")
xlabel("Time (sec)")
ylabel("Temperature (C)")
ylimits = [T_set-273-10 T_set-273+10];
ylim(ylimits)
xlim([300 1600])

figure
plot(time, T4)
grid on, hold on
title("Evaporator Outlet Temperature")
xlabel("Time (sec)")
ylabel("Temperature (C)")
ylim([T4_i-273-20 T4_i-273+20])
xlim([300 1600])
