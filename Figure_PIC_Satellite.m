%% Plot the PIC concentration at the sea surface observed by satellite
close all;clear all;clc;
%% Load the data from netcdf file
info = ncinfo('PIC_Satellite/A20022132017243.L3m_MC_PIC_pic_9km.nc');
lon = ncread('PIC_Satellite/A20022132017243.L3m_MC_PIC_pic_9km.nc','lon'); 
lat = ncread('PIC_Satellite/A20022132017243.L3m_MC_PIC_pic_9km.nc','lat'); 
PIC = ncread('PIC_Satellite/A20022132017243.L3m_MC_PIC_pic_9km.nc','pic');
[x y] = meshgrid(lon,lat);
x = x';
y = y';
PIC1 = PIC*1000; % change unit to mmolC/m3
figure(2);pcolor(x(2521:3492,777:1688)',y(2521:3492,777:1688)',PIC1(2521:3492,777:1688)');shading flat;colorbar;
caxis([0 0.1]);
save('PIC2.mat','x','y','PIC1');


%% Make a nice figure for the paper
close all;clear all;clc;
load('PIC2.mat');
m_proj('miller','lat',[-45 30],'lon',[30 120]);
m_pcolor(x(2521:3601,777:1621)',y(2521:3601,777:1621)',PIC1(2521:3601,777:1621)');
shading flat;
m_coast('patch',[.5 .5 .5]);
m_grid('xaxis','bottom','box','fancy');
caxis([0 0.1]);
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
title(' Satellite PIC concentration [mmolC/m3]','FontName', 'Times New Roman','FontName','Times New Roman', 'fontsize',20);
% print -dpdf  Fe_control.pdf
print -dpdf -r600 PIC2_S_Indian_colorbar.pdf