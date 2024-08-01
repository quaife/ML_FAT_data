%clear 
%close all

% load data from first good example
load('fig_inv_FAT_175.mat');

L = 1;
dx = 1; % mesh spacing to move to meters
X = cx(21:180,21:180);
Y = cy(21:180,21:180);

% Truth
figure(1); clf;
surface(dx*(X-0.5)*L,dx*(Y-0.5)*L,True_fat);
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

% learned parameter values
figure(2); clf;
surface(dx*(X-0.5)*L,dx*(Y-0.5)*L,Output_fat);
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
titleStr = sprintf('CNN-FC');
titl = title(titleStr,'fontsize',20);
set(gca,'clim',[0 900]);
set(gca,'box','on');
set(gca,'fontsize',20)

% compute error
err = Output_fat - True_fat;
s = ~isnan(err);
err(~s) = 0;
% RMSE over cells that are not 0 because no fire was seen there in
% either the exact FAT or the learned parameter FAT.
rmse = norm(err,'fro')/sqrt(sum(sum(s)));
fprintf('RMSE is %.2f seconds\n',rmse);

figure(3); clf
surface(dx*(X-0.5)*L,dx*(Y-0.5)*L,...
      log10(abs(Output_fat - True_fat)./True_fat));
view(2);
err1 = abs(Output_fat - True_fat)./True_fat;
err1 = err1(:);
s = ~isnan(err1);
err1 = err1(s);
shading flat;
colormap('jet')
axis equal
axis([0 200 0 200])
xlabel('meters','fontsize',20)
ylabel('meters','fontsize',20)
xticks([0 100 200])
yticks([0 100 200])
titleStr = sprintf('Relative Error');
titl = title(titleStr,'fontsize',20);
set(gca,'box','on');
set(gca,'fontsize',20)
colorbar


% load data from second good example
load('fig_inv_FAT_951.mat');

% Truth
figure(4); clf;
surface(dx*(X-0.5)*L,dx*(Y-0.5)*L,True_fat);
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

% compute error
err = Output_fat - True_fat;
s = ~isnan(err);
err(~s) = 0;
% RMSE over cells that are not 0 because no fire was seen there in
% either the exact FAT or the learned parameter FAT.
rmse = norm(err,'fro')/sqrt(sum(sum(s)));
fprintf('RMSE is %.2f seconds\n',rmse);

cb = colorbar('Ticks',0:150:900,'FontSize',12);
xb.FontSize = 16;
cb.Location = 'eastoutside';
lbl = cb.Label;
set(lbl,'string','First Arrival Time (secs)');
set(lbl,'fontsize',16);

% learned parameter values
figure(5); clf;
surface(dx*(X-0.5)*L,dx*(Y-0.5)*L,Output_fat);
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
titleStr = sprintf('CNN-FC');
titl = title(titleStr,'fontsize',20);
set(gca,'clim',[0 900]);
set(gca,'box','on');
set(gca,'fontsize',20)

cb = colorbar('Ticks',0:150:900,'FontSize',12);
xb.FontSize = 16;
cb.Location = 'eastoutside';
lbl = cb.Label;
set(lbl,'string','First Arrival Time (secs)');
set(lbl,'fontsize',16);

% plot error
figure(6); clf
surface(dx*(X-0.5)*L,dx*(Y-0.5)*L,...
      log10(abs(Output_fat - True_fat)./True_fat));
view(2);
err2 = abs(Output_fat - True_fat)./True_fat;
err2 = err2(:);
s = ~isnan(err2);
err2 = err2(s);
err2 = err2(err2~=Inf);

shading flat;
colormap('jet')
axis equal
axis([0 200 0 200])
xlabel('meters','fontsize',20)
ylabel('meters','fontsize',20)
xticks([0 100 200])
yticks([0 100 200])
titleStr = sprintf('Relative Error');
titl = title(titleStr,'fontsize',20);
set(gca,'box','on');
set(gca,'fontsize',20)
colorbar


