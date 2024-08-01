%clear 
%close all

% load data
TruthFileImg = 'lines_images_Sec800_1500_test_re.mat';
load(TruthFileImg)
N = size(True_FAT,1);
idx = 281;

Ignite(:,:) = squeeze(IN(idx,:,:,5));
TruthFileAng = 'lines_angles_Sec800_1500_test_orig.mat';
load(TruthFileAng)
onetrueFAT(:,:) = True_FAT(idx,:,:);
in = IN(idx,:);

X = cx(21:180,21:180);
Y = cy(21:180,21:180);

%% Truth
figure(1);clf;
surface(prams.dx*(X-0.5)*prams.L,...
            prams.dx*(Y-0.5)*prams.L,onetrueFAT);
view(2);
shading flat;
cmap = buildcmap('kbryw');
colormap(cmap)
axis equal
axis([0 200 0 200])
xlabel('meters','fontsize',20)
ylabel('meters','fontsize',20)
xticks([0 100 200])
yticks([0 100 200])
titleStr = sprintf('Ground Truth');
titl = title(titleStr,'fontsize',20);
set(gca,'clim',[0 900]);
set(gca,'box','on');
set(gca,'fontsize',20)


%% CNN
File = 'testSetOUT_lines_images_newloss_CNNcm8_5ep4_ep200.mat';
load(File)
cnnFAT(:,:) = Output(idx,:,:);
recnnFAT = cnnFAT;
recnnFAT(isnan(onetrueFAT)) = NaN;

figure(2);clf;

surface(prams.dx*(X-0.5)*prams.L,prams.dx*(Y-0.5)*prams.L,recnnFAT);
view(2);
shading flat;
cmap = buildcmap('kbryw');
colormap(cmap)
axis equal
axis([0 200 0 200])
xlabel('meters','fontsize',20)
ylabel('meters','fontsize',20)
xticks([0 100 200])
yticks([0 100 200])
titleStr = sprintf('CNN');
titl = title(titleStr,'fontsize',20);
set(gca,'clim',[0 900]);
set(gca,'box','on');
set(gca,'fontsize',20)

cb = colorbar('Ticks',0:150:900,'FontSize',12);
cb.FontSize = 16;
cb.Location = 'eastoutside'; 
lbl = cb.Label;
set(lbl,'string','First Arrival Time (secs)');
set(lbl,'fontsize',16);

%% UNet
File = 'testSetOUT_lines_images_newloss_UNet3DP_5ep5_ep200.mat';
load(File)
unetFAT(:,:) = Output(idx,:,:);
reunetFAT = unetFAT;
reunetFAT(isnan(onetrueFAT)) = NaN;

figure(3);clf;

surface(prams.dx*(X-0.5)*prams.L,prams.dx*(Y-0.5)*prams.L,reunetFAT);
view(2);
shading flat;
cmap = buildcmap('kbryw');
colormap(cmap)
axis equal
axis([0 prams.dx*prams.N*prams.L 0 prams.dx*prams.N*prams.L])
xlabel('meters','fontsize',20)
ylabel('meters','fontsize',20)
xticks([0 100 200])
yticks([0 100 200])
titleStr = sprintf('UNet');
title(titleStr,'fontsize',20)
set(gca,'clim',[0 900]);
set(gca,'box','on');
set(gca,'fontsize',20)


%% FC-Unet
File = 'testSetOUT_lines_angles_newloss_FCUNet2dp_2ep4.mat';
load(File)
pramFAT(:,:) = Output(idx,:,:);
repramFAT = pramFAT;
repramFAT(isnan(onetrueFAT)) = NaN;

figure(4);clf;
surface(prams.dx*(X-0.5)*prams.L,prams.dx*(Y-0.5)*prams.L,repramFAT);
view(2);
shading flat;
cmap = buildcmap('kbryw');
colormap(cmap)
axis equal
axis([0 prams.dx*prams.N*prams.L 0 prams.dx*prams.N*prams.L])
xlabel('meters','fontsize',20)
ylabel('meters','fontsize',20)
xticks([0 100 200])
yticks([0 100 200])
titleStr = sprintf('FC-UNet');
title(titleStr,'fontsize',20)
set(gca,'clim',[0 900]);
set(gca,'box','on');
set(gca,'fontsize',20)

cb = colorbar('Ticks',0:150:900,'FontSize',12);
cb.FontSize = 16;
cb.Location = 'eastoutside'; 
lbl = cb.Label;
set(lbl,'string','First Arrival Time (secs)');
set(lbl,'fontsize',16);


