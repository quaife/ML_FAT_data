%clear
%close all

% load ground truth data
load('lines_angles_Sec800_1500_test_orig.mat');
N = size(True_FAT,1); 
l2err = zeros(N,1); 
l2relerr = zeros(N,1); 
rmse = zeros(N,1);

% load different neural networks
File_FCUnet = 'testSetOUT_lines_angles_newloss_FCUNet2dp_2ep4.mat';


% Display errors, loss function, etc. of the neural network at each
% Epoch
load(File_FCUnet)
fprintf('----------------model: FC-Unet------------------------------ \n')
fprintf('cm = %g  kernel = %g\n', cm, kernel)
fprintf('epoch = %g  batch = %g  learning_rate = %f\n', epoch,batch,l_rate)
fprintf('epoch    loss        mse          val_loss    val_mse\n')
for i=1:epoch
  fprintf('%2g       %4.2f     %.6f     %4.2f     %.6f\n',...
    i, loss(i), mse(i), val_loss(i), val_mse(i))
end

% plot the epoch vs. RMSE
figure(1);clf
plot(1:epoch, val_loss,'LineWidth',2) 
xlabel('Epoch','FontSize',20);
ylabel('RMSE (secs)','FontSize',20);
xticks(0:25:100)
ylim([20 90])
yticks(20:20:80)
set(gca,'fontsize',20)

% plot the first 20 RMSE values in an inset
axes('Position',[.47 .5 .4 .4])
plot(1:20, val_loss(1:20),'b-o','LineWidth',2) 
ylim([20 90])
xticks(0:5:20)
yticks(20:20:80)
set(gca,'fontsize',12)
xlabel('Epoch','FontSize',12);
ylabel('RMSE (secs)','FontSize',10);


% Load an exact solution from the test set
TruthFileImg = 'lines_images_Sec800_1500_test_re.mat';
load(TruthFileImg)
N = size(True_FAT,1);
idx = 1448; %general

Ignite(:,:) = squeeze(IN(idx,:,:,5));
TruthFileAng = 'lines_angles_Sec800_1500_test_orig.mat';
load(TruthFileAng)
onetrueFAT(:,:) = True_FAT(idx,:,:);

% x and y domain, but with burnt out region removed
X = cx(21:180,21:180);
Y = cy(21:180,21:180);

% Plot the exact solution from the test set
figure(2);clf;
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
set(gca,'clim',[0,900]);
set(gca,'box','on');
set(gca,'fontsize',20)


% Plot the trained solution using the FC-Unet network
File = 'testSetOUT_lines_angles_newloss_FCUNet2dp_2ep4.mat';
load(File)
pramFAT(:,:) = Output(idx,:,:);
repramFAT = pramFAT;
repramFAT(isnan(onetrueFAT)) = NaN;

figure(3);clf;
surface(prams.dx*(X-0.5)*prams.L,prams.dx*(Y-0.5)*prams.L,repramFAT);
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
titleStr = sprintf('FC-UNet');
titl = title(titleStr,'fontsize',20);
set(gca,'clim',[0,900]);
set(gca,'box','on');
set(gca,'fontsize',20)

cb = colorbar('Ticks',0:150:900,'FontSize',12);
cb.FontSize = 16;
cb.Location = 'eastoutside'; 
lbl = cb.Label;
set(lbl,'string','First Arrival Time (secs)');
set(lbl,'fontsize',16);





