%% Making nice figures for paper
close all;clear all;clc;
addpath m_map
% load anhcolor
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
%% wrap around the globe
x(end+1,:)= x(end,:)+1;
y(end+1,:)= y(1,:);

%% load data
%% load PI_results
% tracers
tracers_PI = rdmds('PI/PTRD1', Inf);
mask = ones(128, 64);
mask(tracers_PI(:,:,1,1)==0)=NaN;
PO4_PI = tracers_PI(:,:,:,1);
NO3_PI = tracers_PI(:,:,:,2);
Fe_PI = tracers_PI(:,:,:,3);
SiO2_PI = tracers_PI(:,:,:,4);
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
%% Load Industrial Results
% tracers
tracers_In = rdmds('Results_Modern/PTRD1', Inf);
PO4_In = tracers_In(:,:,:,1);
NO3_In = tracers_In(:,:,:,2);
Fe_In = tracers_In(:,:,:,3);
SiO2_In = tracers_In(:,:,:,4);

PO4_In_ano = PO4_In - PO4_PI;
NO3_In_ano  = NO3_In - NO3_PI;
Fe_In_ano = Fe_In - Fe_PI;
SiO2_In_ano = SiO2_In - SiO2_PI;
% Phytoplankton
tracers2_In = rdmds('Results_Modern/PTRD3',Inf);
Phy01_In = tracers2_In(:,:,:,2);
Phy02_In = tracers2_In(:,:,:,3);
Phy03_In = tracers2_In(:,:,:,4);
Phy04_In = tracers2_In(:,:,:,5);
Phy05_In = tracers2_In(:,:,:,6);
Phy06_In = tracers2_In(:,:,:,7);
Phy06_In_2d = sum(Phy06_In.*dz3d,3);

Phy01_In_ano = Phy01_In - Phy01_PI;
Phy02_In_ano = Phy02_In - Phy02_PI;
Phy05_In_ano = Phy05_In - Phy05_PI;
Phy06_In_ano = Phy06_In - Phy06_PI;
Phy03_In_ano = Phy03_In - Phy03_PI;
Phy04_In_ano = Phy04_In - Phy04_PI;


Phy01_In_ano_2d = sum(Phy01_In_ano.*dz3d,3);
Phy02_In_ano_2d = sum(Phy02_In_ano.*dz3d,3);
Phy05_In_ano_2d = sum(Phy05_In_ano.*dz3d,3);
Phy06_In_ano_2d = sum(Phy06_In_ano.*dz3d,3);
Phy03_In_ano_2d = sum(Phy03_In_ano.*dz3d,3);
Phy04_In_ano_2d = sum(Phy04_In_ano.*dz3d,3);
Phy34_In_ano_2d = Phy03_In_ano_2d+Phy04_In_ano_2d;

% PIC
tracers3_In = rdmds('Results_Modern/PTRD4',Inf);
PIC_In = tracers3_In(:,:,:,7);
PIC_In_2d = sum(PIC_In.*dz3d,3);

% Production
Prod_In = rdmds('Results_Modern/Production',Inf);
Prod_In_ano = Prod_In - Prod_PI;
Prod_In_2d = sum(Prod_In.*dz3d,3);
Prod_In_ano_2d = sum(Prod_In_ano.*dz3d,3);
% CO2flux
CO2_In = rdmds('Results_Modern/CO2flux',Inf);
CO2_In_ano = CO2_In - CO2_PI;

%% Load PI_N
% tracers
tracers_PI_N= rdmds('PI_N/PTRD1', Inf);
PO4_PI_N = tracers_PI_N(:,:,:,1);
NO3_PI_N = tracers_PI_N(:,:,:,2);
Fe_PI_N = tracers_PI_N(:,:,:,3);
SiO2_PI_N = tracers_PI_N(:,:,:,4);

PO4_PI_N_ano = PO4_PI_N - PO4_PI;
NO3_PI_N_ano  = NO3_PI_N - NO3_PI;
Fe_PI_N_ano = Fe_PI_N - Fe_PI;
SiO2_PI_N_ano = SiO2_PI_N - SiO2_PI;

% Phytoplankton
tracers2_PI_N = rdmds('PI_N/PTRD3',Inf);
Phy01_PI_N = tracers2_PI_N(:,:,:,2);
Phy02_PI_N = tracers2_PI_N(:,:,:,3);
Phy03_PI_N = tracers2_PI_N(:,:,:,4);
Phy04_PI_N = tracers2_PI_N(:,:,:,5);
Phy05_PI_N = tracers2_PI_N(:,:,:,6);
Phy06_PI_N = tracers2_PI_N(:,:,:,7);

Phy01_PI_N_ano = Phy01_PI_N - Phy01_PI;
Phy02_PI_N_ano = Phy02_PI_N - Phy02_PI;
Phy05_PI_N_ano = Phy05_PI_N - Phy05_PI;
Phy06_PI_N_ano = Phy06_PI_N - Phy06_PI;
Phy03_PI_N_ano = Phy03_PI_N - Phy03_PI;
Phy04_PI_N_ano = Phy04_PI_N - Phy04_PI;

Phy01_PI_N_ano_2d = sum(Phy01_PI_N_ano.*dz3d,3);
Phy02_PI_N_ano_2d = sum(Phy02_PI_N_ano.*dz3d,3);
Phy05_PI_N_ano_2d = sum(Phy05_PI_N_ano.*dz3d,3);
Phy06_PI_N_ano_2d = sum(Phy06_PI_N_ano.*dz3d,3);
Phy03_PI_N_ano_2d = sum(Phy03_PI_N_ano.*dz3d,3);
Phy04_PI_N_ano_2d = sum(Phy04_PI_N_ano.*dz3d,3);
Phy34_PI_N_ano_2d = Phy03_PI_N_ano_2d+Phy04_PI_N_ano_2d;
% Production
Prod_PI_N = rdmds('PI_N/Production',Inf);
Prod_PI_N_ano = Prod_PI_N - Prod_PI;
Prod_PI_N_ano_2d = sum(Prod_PI_N_ano.*dz3d,3);

% CO2flux
CO2_PI_N = rdmds('PI_N/CO2flux',Inf);
CO2_PI_N_ano = CO2_PI_N - CO2_PI;

%% Load PI_Fe
% tracers
tracers_PI_Fe= rdmds('PI_Fe/PTRD1', Inf);
PO4_PI_Fe = tracers_PI_Fe(:,:,:,1);
NO3_PI_Fe = tracers_PI_Fe(:,:,:,2);
Fe_PI_Fe = tracers_PI_Fe(:,:,:,3);
SiO2_PI_Fe = tracers_PI_Fe(:,:,:,4);

PO4_PI_Fe_ano = PO4_PI_Fe - PO4_PI;
NO3_PI_Fe_ano  = NO3_PI_Fe - NO3_PI;
Fe_PI_Fe_ano = Fe_PI_Fe - Fe_PI;
SiO2_PI_Fe_ano = SiO2_PI_Fe - SiO2_PI;
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
Phy34_PI_Fe_ano_2d = Phy03_PI_Fe_ano_2d+Phy04_PI_Fe_ano_2d;

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



%% make figure, global map focusing on the Indian basin
% tracers = rdmds('PTR',Inf,'rec',3)*1e3;
conv1 = 60*60*24*365*0.001*12;
conv2 = 106;
figure(5);
% c = nanmean(SiO2_PI_Fe_ano(:,:,1:10),3);
c = PIC_In(:,:,1);
c(end+1,:)=c(1,:);
m_proj('miller','lat',[-45 30],'lon',[30 120]);
m_pcolor(x(11:43,16:43),y(11:43,16:43),c(11:43,16:43));
shading flat;
m_coast('patch',[.5 .5 .5]);
m_grid('xaxis','bottom','box','fancy');
caxis([0 0.1]);
% colorbar;
drawnow;

%% make colorbar at the bottom
cmp=colormap('jet');
% cmp=colormap(anhcolor);
% cmp(30:33,:) = ones(4,3);
% colormap = cmp;
colorbartype([.1 .05 .8 .025],0:.002:0.1,51,[0 0.1],cmp,0);
ax=get(gcf,'currentaxes');
set(ax,'xtick',1:10:51);
set(ax,'xticklabel',{'0' '0.02' '0.04' '0.06' '0.08' '0.1'},'FontName','Times New Roman','FontSize',20);
set(ax,'fontsize',20);
% title(' Surface NO_{3} concentration anomaly [\muM]','FontName', 'Times New Roman','FontName','Times New Roman', 'fontsize',20);
% title(' Air-sea CO2 flux [gC/m2/year]','FontName', 'Times New Roman','FontName','Times New Roman', 'fontsize',20); 
title('Model PIC concentration at the surface [mmolC/m3]','FontName', 'Times New Roman','FontName','Times New Roman', 'fontsize',20);
% print -dpdf  Fe_control.pdf
print -dpdf -r600 PIC_I_Indian_colorbar.pdf