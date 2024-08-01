%clear
%close all

% load learned and exact parameters and first arrival times
load('testSetOUT_3conv4mp_inv_lines_cm8.mat')
load('lines_angles_Sec800_1500_test_re.mat')

N = size(IN,1);

theta = Output(:,5);
Output(:,5) = theta + (theta<0).*ones(N,1)*pi;
err = Output - IN;

abserr = abs(err);
relerr = err./IN;

% plot histogram of error of wind speed
figure(1); clf;
histogram(relerr(:,1),20,'Normalization','probability');
set(gca,'fontsize',20);
xlabel('Signed Relative Error','fontsize',20);
ylabel('Probability','fontsize',20);
xlim([-0.6 0.6])
ylim([0 0.17]);
set(gca,'xtick',(-0.5:0.5:0.5));
set(gca,'ytick',(0:.05:0.2));
title('Background Wind Speed','fontsize',20)

% plot histogram of error of pyrogenic potential
figure(2); clf;
histogram(relerr(:,2),20,'Normalization','probability');
set(gca,'fontsize',20);
xlabel('Signed Relative Error','fontsize',20);
ylabel('Probability','fontsize',20);
xlim([-0.6 0.6])
ylim([0 0.17]);
set(gca,'xtick',(-0.5:0.5:0.5));
set(gca,'ytick',(0:.05:0.2));
title('Pyrogenic Potential','fontsize',20)

% plot histogram of error of burn time
figure(3); clf;
histogram(relerr(:,3),20,'Normalization','probability');
set(gca,'fontsize',20);
xlabel('Signed Relative Error','fontsize',20);
ylabel('Probability','fontsize',20);
xlim([-0.6 0.6])
ylim([0 0.17]);
set(gca,'xtick',(-0.5:0.5:0.5));
set(gca,'ytick',(0:.05:0.2));
title('Burn Time','fontsize',20)

% plot histogram of error of diffusive probability
figure(4); clf;
h = histogram(relerr(:,4),20,'Normalization','probability');
set(gca,'fontsize',20);
xlabel('Signed Relative Error','fontsize',20);
ylabel('Probability','fontsize',20);
xlim([-0.6 0.6])
ylim([0 0.17]);
set(gca,'xtick',(-0.5:0.5:0.5));
set(gca,'ytick',(0:.05:0.2));
title('Diffusive Ignition Probability','fontsize',20)


