%% Making nice figures for paper
close all;clear all;clc;
addpath m_map
%% Load data
N_na=ncread('WOA/woa13_all_n00_01.nc','n_an');
x=ncread('WOA/woa13_all_n00_01.nc','lon');
y=ncread('WOA/woa13_all_n00_01.nc','lat');
[X,Y] = meshgrid(x,y);
X = X';
Y = Y';
X = X+180;
% NO3_na = NO3_na/22.4;
N_na_new(1:180,:,:)=N_na(181:360,:,:);
N_na_new(181:360,:,:)=N_na(1:180,:,:);

%% wrap around the globe
% x(end+1,:)= x(end,:)+1;
% y(end+1,:)= y(1,:);

%% make figure, global map focusing on the Indian Ocean
% tracers = rdmds('PTR',Inf,'rec',3)*1e3;
figure(1);
% c = NO3_PI_Fe_ano(:,:,1);
c = N_na_new;
% c(end+1,:)=c(1,:);
m_proj('miller','lat',[-70 30],'lon',[30 120]);
m_pcolor(X(31:121,20:111)',Y(31:121,20:111)',(c(31:121,20:111,1))');
shading flat;
m_coast('patch',[.5 .5 .5]);
m_grid('xaxis','bottom','box','fancy');
caxis([0 25]);
drawnow;

%% make colorbar at the bottom
cmp=colormap('jet');
% cmp=colormap(anhcolor);
% cmp(30:33,:) = ones(4,3);
% colormap = cmp;
colorbartype([.1 .05 .8 .025],0:1:50,51,[0 50],cmp,0);
ax=get(gcf,'currentaxes');
set(ax,'xtick',1:10:51);
set(ax,'xticklabel',{'0' '5' '10' '15' '20' '25'},'FontName','Times New Roman','FontSize',20);
set(ax,'fontsize',20);
% title(' Air-sea CO2 flux [gC/m2/year]','FontName', 'Times New Roman','FontName','Times New Roman', 'fontsize',20); 
title(' World Ocean Atlas NO_{3}- concentration at the surface [\muM]','FontName', 'Times New Roman','FontName','Times New Roman', 'fontsize',20);
% print -dpdf  Fe_control.pdf
print -dpdf -r600 WOA_NO3.pdf