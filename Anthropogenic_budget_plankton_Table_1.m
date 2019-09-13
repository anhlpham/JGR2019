%% Calculate change in the global budget
close all;clear all;clc;
addpath m_map
%% mask
tracers_PI = rdmds('PI/PTRD1', Inf);
mask = ones(128, 64);
mask(tracers_PI(:,:,1,1)==0)=NaN;
clear tracers_PI;
%% load grid formation
x = rdmds('PI/XC');
y = rdmds('PI/YC');
z = rdmds('PI/RC');
dx = rdmds('PI/DXG');
dy = rdmds('PI/DYG');
dz = rdmds('PI/DRF');
da = rdmds('PI/RAC');
hc = rdmds('PI/hFacC');
dz3d = repmat(dz,[128 64 1]).*hc;
dv = repmat(da,[1 1 23]).*repmat(dz,[128 64 1]).*hc;

%% load data
%% load PI_results
% Phytoplankton
tracers2_PI = rdmds('PI/PTRD3',Inf);
Phy01_PI = tracers2_PI(:,:,:,2);
Phy02_PI = tracers2_PI(:,:,:,3);
Phy03_PI = tracers2_PI(:,:,:,4);
Phy04_PI = tracers2_PI(:,:,:,5);
Phy05_PI = tracers2_PI(:,:,:,6);
Phy06_PI = tracers2_PI(:,:,:,7);

Phy01_PI2d = sum(Phy01_PI.*dz3d,3);
Phy05_PI2d = sum(Phy05_PI.*dz3d,3);
Phy03_PI2d = sum(Phy03_PI.*dz3d,3);
Phy04_PI2d = sum(Phy04_PI.*dz3d,3);
% Production
Prod_PI = rdmds('PI/Production',Inf);
PP_PI2d = sum(Prod_PI.*dz3d,3);

% CO2flux
CO2_PI = rdmds('PI/CO2flux',Inf);
%% Load Industrial Results;
% Phytoplankton
tracers2_In = rdmds('Results_Modern/PTRD3',Inf);
Phy01_In = tracers2_In(:,:,:,2);
Phy02_In = tracers2_In(:,:,:,3);
Phy03_In = tracers2_In(:,:,:,4);
Phy04_In = tracers2_In(:,:,:,5);
Phy05_In = tracers2_In(:,:,:,6);
Phy06_In = tracers2_In(:,:,:,7);

Phy01_In_ano = Phy01_In - Phy01_PI;
Phy05_In_ano = Phy05_In - Phy05_PI;
Phy01_In_ano_2d = sum(Phy01_In_ano.*dz3d,3);
Phy05_In_ano_2d = sum(Phy05_In_ano.*dz3d,3);
% Production
Prod_In = rdmds('Results_Modern/Production',Inf);
Prod_In_ano = Prod_In - Prod_PI;
Prod_In_ano_2d = sum(Prod_In_ano.*dz3d,3);


% CO2flux
CO2_In = rdmds('Results_Modern/CO2flux',Inf);
CO2_In_ano = CO2_In - CO2_PI;

%% Load PI_N

% Phytoplankton
tracers2_PI_N = rdmds('PI_N/PTRD3',Inf);
Phy01_PI_N = tracers2_PI_N(:,:,:,2);
Phy02_PI_N = tracers2_PI_N(:,:,:,3);
Phy03_PI_N = tracers2_PI_N(:,:,:,4);
Phy04_PI_N = tracers2_PI_N(:,:,:,5);
Phy05_PI_N = tracers2_PI_N(:,:,:,6);
Phy06_PI_N = tracers2_PI_N(:,:,:,7);

Phy01_PI_N_ano = Phy01_PI_N - Phy01_PI;
Phy05_PI_N_ano = Phy05_PI_N - Phy05_PI;
Phy01_PI_N_ano_2d = sum(Phy01_PI_N_ano.*dz3d,3);
Phy05_PI_N_ano_2d = sum(Phy05_PI_N_ano.*dz3d,3);
% Production
Prod_PI_N = rdmds('PI_N/Production',Inf);
Prod_PI_N_ano = Prod_PI_N - Prod_PI;
Prod_PI_N_ano_2d = sum(Prod_PI_N_ano.*dz3d,3);

% CO2flux
CO2_PI_N = rdmds('PI_N/CO2flux',Inf);
CO2_PI_N_ano = CO2_PI_N - CO2_PI;


%% Load PI_Fe
% Phytoplankton
tracers2_PI_Fe = rdmds('PI_Fe/PTRD3',Inf);
Phy01_PI_Fe = tracers2_PI_Fe(:,:,:,2);
Phy02_PI_Fe = tracers2_PI_Fe(:,:,:,3);
Phy03_PI_Fe = tracers2_PI_Fe(:,:,:,4);
Phy04_PI_Fe = tracers2_PI_Fe(:,:,:,5);
Phy05_PI_Fe = tracers2_PI_Fe(:,:,:,6);
Phy06_PI_Fe = tracers2_PI_Fe(:,:,:,7);

Phy01_PI_Fe_ano = Phy01_PI_Fe - Phy01_PI;
Phy05_PI_Fe_ano = Phy05_PI_Fe - Phy05_PI;
Phy01_PI_Fe_ano_2d = sum(Phy01_PI_Fe_ano.*dz3d,3);
Phy05_PI_Fe_ano_2d = sum(Phy05_PI_Fe_ano.*dz3d,3);

Phy03_PI_Fe_ano = Phy03_PI_Fe - Phy03_PI;
Phy04_PI_Fe_ano = Phy04_PI_Fe - Phy04_PI;
Phy03_PI_Fe_ano_2d = sum(Phy03_PI_Fe_ano.*dz3d,3);
Phy04_PI_Fe_ano_2d = sum(Phy04_PI_Fe_ano.*dz3d,3);

Phy02_PI_Fe_ano = Phy02_PI_Fe - Phy02_PI;
Phy06_PI_Fe_ano = Phy06_PI_Fe - Phy06_PI;
Phy02_PI_Fe_ano_2d = sum(Phy02_PI_Fe_ano.*dz3d,3);
Phy06_PI_Fe_ano_2d = sum(Phy06_PI_Fe_ano.*dz3d,3);
% Production
Prod_PI_Fe = rdmds('PI_Fe/Production',Inf);
Prod_PI_Fe_ano = Prod_PI_Fe - Prod_PI;
Prod_PI_Fe_ano_2d = sum(Prod_PI_Fe_ano.*dz3d,3);
% CO2flux
CO2_PI_Fe = rdmds('PI_Fe/CO2flux',Inf);
CO2_PI_Fe_ano = CO2_PI_Fe - CO2_PI;


%% Calculate the change in the Indian Ocean budget
conv1 = 60*60*24*365*0.001*12;
conv2 = 106;
%% define box boundary
% Indian Ocean x(11:40,1:43),y(11:40,1:43)
% 30E - 110E 80S-30N
Ix = [11 40];
Iy = [1 43]; 
Iz = [1 23]; % the whole column 
regvol = sum(sum(sum(dv(Ix(1):Ix(2),Iy(1):Iy(2),:))));

regProdPI = sum(sum(sum(dv(Ix(1):Ix(2),Iy(1):Iy(2),:).*Prod_PI(Ix(1):Ix(2),Iy(1):Iy(2),:) )))*conv1*conv2
regProdPIFe = sum(sum(sum(dv(Ix(1):Ix(2),Iy(1):Iy(2),:).*Prod_PI_Fe(Ix(1):Ix(2),Iy(1):Iy(2),:))))*conv1*conv2
regProdPIN = sum(sum(sum(dv(Ix(1):Ix(2),Iy(1):Iy(2),:).*Prod_PI_N(Ix(1):Ix(2),Iy(1):Iy(2),:))))*conv1*conv2
regProdIn = sum(sum(sum(dv(Ix(1):Ix(2),Iy(1):Iy(2),:).*Prod_In(Ix(1):Ix(2),Iy(1):Iy(2),:))))*conv1*conv2

pcolor(x',y', (CO2_PI.*mask)');shading flat;colorbar;

regCO2PI = sum(sum(da(Ix(1):Ix(2),Iy(1):Iy(2)).*CO2_PI(Ix(1):Ix(2),Iy(1):Iy(2))))*conv1
regCO2PIFe = sum(sum(da(Ix(1):Ix(2),Iy(1):Iy(2)).*CO2_PI_Fe(Ix(1):Ix(2),Iy(1):Iy(2))))*conv1
regCO2PIN = sum(sum(da(Ix(1):Ix(2),Iy(1):Iy(2)).*CO2_PI_N(Ix(1):Ix(2),Iy(1):Iy(2))))*conv1
regCO2In = sum(sum(da(Ix(1):Ix(2),Iy(1):Iy(2)).*CO2_In(Ix(1):Ix(2),Iy(1):Iy(2))))*conv1


