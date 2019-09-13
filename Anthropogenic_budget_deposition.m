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
%% Load the deposition field
% Fe
fid=fopen('solfe_fed.bin','r','ieee-be');
tmp=fread(fid,128*64*12,'float32');
fclose(fid);
Fe_I = reshape(tmp,[128 64 12]);
Fe_I_an = nanmean(Fe_I,3);
clear tmp fid

fid=fopen('solfe_pi_128x64x12.bin','r','ieee-be');
tmp=fread(fid,'float32');
fclose(fid);
Fe_PI = reshape(tmp,[128 64 12]);
Fe_PI_an = nanmean(Fe_PI,3);
clear tmp fid
Fe_ano = Fe_I_an - Fe_PI_an;

% N
fid=fopen('ndep_mod.bin','r','ieee-be');
tmp=fread(fid,128*64*12,'float32');
fclose(fid);
N_I = reshape(tmp,[128 64 12]);
N_I_an = nanmean(N_I,3);
clear tmp fid

fid=fopen('ndep_pi_128x64x12.bin','r','ieee-be');
tmp=fread(fid,128*64*12,'float32');
fclose(fid);
N_PI = reshape(tmp,[128 64 12]);
N_PI_an = nanmean(N_PI,3);
clear tmp fid
N_ano = N_I_an - N_PI_an;


%% Calculate the change in the atmospheric deposition over the Indian Ocean
%% define box boundary
% Indian Ocean x(11:40,1:43),y(11:40,1:43)
% 30E - 110E 80S-30N
Ix = [11 40];
Iy = [1 43];  
Iz = [1 1]; % surface
regvol = sum(sum(sum(dv(Ix(1):Ix(2),Iy(1):Iy(2),Iz))));

regFePI = sum(sum(da(Ix(1):Ix(2),Iy(1):Iy(2)).*Fe_PI_an(Ix(1):Ix(2),Iy(1):Iy(2))))
regNPI = sum(sum(da(Ix(1):Ix(2),Iy(1):Iy(2)).*N_PI_an(Ix(1):Ix(2),Iy(1):Iy(2))))

regFeI = sum(sum(da(Ix(1):Ix(2),Iy(1):Iy(2)).*Fe_I_an(Ix(1):Ix(2),Iy(1):Iy(2))))
regNI = sum(sum(da(Ix(1):Ix(2),Iy(1):Iy(2)).*N_I_an(Ix(1):Ix(2),Iy(1):Iy(2))))

regFeano = sum(sum(da(Ix(1):Ix(2),Iy(1):Iy(2)).*Fe_ano(Ix(1):Ix(2),Iy(1):Iy(2))))
regNano = sum(sum(da(Ix(1):Ix(2),Iy(1):Iy(2)).*N_ano(Ix(1):Ix(2),Iy(1):Iy(2))))


