%% Plot the deposition field
close all;clear all;clc;
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

close all;clear all;clc;
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

addpath m_map
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


%% Plot
figure(1);
c = log10(N_ano);
c(end+1,:)=c(1,:);
m_proj('miller','lat',[-45 30],'lon',[30 120]);
m_pcolor(x(11:43,16:43),y(11:43,16:43),c(11:43,16:43));
shading flat;
m_coast('patch',[.5 .5 .5]);
m_grid('xaxis','bottom','box','fancy');
caxis([-13 -8]);
% colorbar;
drawnow;

%% make colorbar at the bottom
cmp=colormap('jet');
colorbartype([.1 .05 .8 .025],-13:.1:-8,51,[-13 -8],cmp,0);
ax=get(gcf,'currentaxes');
set(ax,'xtick',1:10:51);
set(ax,'xticklabel',{'-13' '-12' '-11' '-10' '-9' '-8'},'FontName','Times New Roman','FontSize',20);
set(ax,'fontsize',20);
title('N depostion anomaly log10 [mol/m^{2}/s]','FontName', 'Times New Roman','FontName','Times New Roman', 'fontsize',20);
print -dpdf -r600 FN_dep_colorbar.pdf