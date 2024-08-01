%clear 
%close all

% load first bad example
load('fig_inv_FAT_1152_Uw.mat');

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

err = True_fat - Output_fat;
s = find(err == err);
rmse2 = sqrt(sum(err(s).^2)/numel(s));
fprintf('RMSE is %4.2f\n',rmse2)

% compute error
err1 = abs(Output_fat - True_fat)./True_fat;
err1 = err1(:);
s = ~isnan(err1);
err1 = err1(s);
err1 = err1(err1~=Inf);
figure(3); clf; 
surface(dx*(X-0.5)*L,dx*(Y-0.5)*L,...
      log10(abs(Output_fat - True_fat)./True_fat));
view(2);
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

% load second bad example
load('fig_inv_FAT_480_sk.mat');

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

% compute error
err = True_fat - Output_fat;
s = find(err == err);
rmse2 = sqrt(sum(err(s).^2)/numel(s));
fprintf('RMSE is %4.2f\n',rmse2)

err2 = abs(Output_fat - True_fat)./True_fat;
err2 = err2(:);
s = ~isnan(err2);
err2 = err2(s);
err2 = err2(err2~=Inf);
figure(6); clf; 
surface(dx*(X-0.5)*L,dx*(Y-0.5)*L,...
      log10(abs(Output_fat - True_fat)./True_fat));
view(2);
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

% load third bad example
load('fig_inv_FAT_1148_FO.mat');

% Truth
figure(7); clf;
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
figure(8); clf;
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
err = True_fat - Output_fat;
s = find(err == err);
rmse2 = sqrt(sum(err(s).^2)/numel(s));
fprintf('RMSE is %4.2f\n',rmse2)

err3 = abs(Output_fat - True_fat)./True_fat;
err3 = err3(:);
s = ~isnan(err3);
err3 = err3(s);
err3 = err3(err3~=Inf);
figure(9); clf; 
surface(dx*(X-0.5)*L,dx*(Y-0.5)*L,...
      log10(abs(Output_fat - True_fat)./True_fat));
view(2);
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

% load fourth bad example
load('fig_inv_FAT_198_prob.mat');

% Truth
figure(10); clf;
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

cb = colorbar('Ticks',0:150:900,'FontSize',12);
xb.FontSize = 16;
cb.Location = 'eastoutside';
lbl = cb.Label;
set(lbl,'string','First Arrival Time (secs)');
set(lbl,'fontsize',16);

% learned parameter values
figure(11); clf;
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

% compute error
err = True_fat - Output_fat;
s = find(err == err);
rmse2 = sqrt(sum(err(s).^2)/numel(s));
fprintf('RMSE is %4.2f\n',rmse2)

err4 = abs(Output_fat - True_fat)./True_fat;
err4 = err4(:);
s = ~isnan(err4);
err4 = err4(s);
err4 = err4(err4~=Inf);
figure(12); clf; 
surface(dx*(X-0.5)*L,dx*(Y-0.5)*L,...
      log10(abs(Output_fat - True_fat)./True_fat));
view(2);
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
