%% Making nice figures for paper
close all;clear all;clc;
addpath m_map
% load anhcolor
%% Load data
load('NPP_VGPM.mat');

%% wrap around the globe
lon2(end+1,:)= lon2(end,:)+1;
lat(end+1,:)= lat(1,:);


%% make figure, global map focusing on the Indian Ocean
% tracers = rdmds('PTR',Inf,'rec',3)*1e3;
figure(1);
% c = NO3_PI_Fe_ano(:,:,1);
c = NPP_1;
% c(end+1,:)=c(1,:);
m_proj('miller','lat',[-45 30],'lon',[30 120]);
m_pcolor(lon2(181:721,390:905)',lat(181:721,390:905)', NPP_1(181:721,390:905)');
shading flat;
m_coast('patch',[.5 .5 .5]);
m_grid('xaxis','bottom','box','fancy');
caxis([0 240]);
drawnow;

%% make colorbar at the bottom
cmp=colormap('jet');
% cmp=colormap(anhcolor);
% cmp(30:33,:) = ones(4,3);
% colormap = cmp;
colorbartype([.1 .05 .8 .025],0:4.8:240,51,[0 240],cmp,0);
ax=get(gcf,'currentaxes');
set(ax,'xtick',1:10:51);
set(ax,'xticklabel',{'0' '48' '96' '144' '192' '240'},'FontName','Times New Roman','FontSize',20);
set(ax,'fontsize',20);
% title(' Air-sea CO2 flux [gC/m2/year]','FontName', 'Times New Roman','FontName','Times New Roman', 'fontsize',20); 
title(' Vertically integrated VGPM primary production [gC/m2/year]','FontName', 'Times New Roman','FontName','Times New Roman', 'fontsize',20);
% title(' Model surface SiO_{2}- concetration [\muM]','FontName', 'Times New Roman','FontName','Times New Roman', 'fontsize',20);
% print -dpdf  Fe_control.pdf
print -dpdf -r600 Satellite_NPP.pdf