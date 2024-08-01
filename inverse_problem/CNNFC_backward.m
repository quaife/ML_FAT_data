%clear
%close all

% training data is split over two .mat files
File1 = 'testSetOUT_3conv4mp_inv_lines_cm8.mat';
File2 = 'testSetOUT_3conv4mp_inv_lines_cm8_cont.mat';

load(File1)

training_error = [loss];
test_error = [val_loss];

load(File2);
training_error = [training_error loss];
test_error = [test_error val_loss];


x = 1:numel(training_error);
figure(1); clf; hold on
plot(x, training_error,'LineWidth',2) 
plot(x, test_error,'r','LineWidth',2) 
xlabel('Epoch','FontSize',20);
ylabel('Relative Error (%)','FontSize',20);
ylim([0 65])
xticks(0:25:200)
yticks(0:20:60)
set(gca,'fontsize',20)

axes('Position',[.47 .5 .4 .4])
hold on
plot(x(1:20), training_error(1:20),'b-','LineWidth',2) 
plot(x(1:20), test_error(1:20),'r-','LineWidth',2) 
plot(x(1:20), training_error(1:20),'b-o','LineWidth',2) 
plot(x(1:20), test_error(1:20),'r-o','LineWidth',2) 
ylim([0 60])
xticks(0:5:20)
yticks(20:20:60)
set(gca,'fontsize',12)
xlabel('Epoch','FontSize',12);
ylabel('Relative Error (%)','FontSize',20);
h = legend('Training Set','Test Set');
set(h,'fontsize',16);
set(h,'box','off');

