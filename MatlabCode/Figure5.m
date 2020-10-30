clear;
clc;
% ��ΪԭPaper�е������ֲ��Դ���

% ״̬��ֵ����
X0  = [-10.2999, 0.2575, -4.4997, 3.6258, 3.0922, 9.0156, 3.5099, -2.6645, 2.4552, -4.4921]';

Node_Nums = 10;

% bͼ�Ⱦ����ڽӾ���������˹����
D_a = [ 1 0 0 0 0 0 0 0 0 0;
        0 1 0 0 0 0 0 0 0 0;
        0 0 1 0 0 0 0 0 0 0;
        0 0 0 1 0 0 0 0 0 0;
        0 0 0 0 1 0 0 0 0 0;
        0 0 0 0 0 1 0 0 0 0;
        0 0 0 0 0 0 1 0 0 0;
        0 0 0 0 0 0 0 1 0 0;
        0 0 0 0 0 0 0 0 1 0;
        0 0 0 0 0 0 0 0 0 1;];
A_a = [ 0 1 0 0 0 0 0 0 0 0;
        0 0 1 0 0 0 0 0 0 0;
        0 0 0 1 0 0 0 0 0 0;
        0 0 0 0 1 0 0 0 0 0;
        0 0 0 0 0 1 0 0 0 0;
        0 0 0 0 0 0 1 0 0 0;
        0 0 0 0 0 0 0 1 0 0;
        0 0 0 0 0 0 0 0 1 0;
        0 0 0 0 0 0 0 0 0 1;
        1 0 0 0 0 0 0 0 0 0;];
L_a = D_a - A_a;

% bͼ�Ⱦ����ڽӾ���������˹����
D_b = [ 1 0 0 0 0 0 0 0 0 0;
        0 2 0 0 0 0 0 0 0 0;
        0 0 2 0 0 0 0 0 0 0;
        0 0 0 2 0 0 0 0 0 0;
        0 0 0 0 1 0 0 0 0 0;
        0 0 0 0 0 2 0 0 0 0;
        0 0 0 0 0 0 1 0 0 0;
        0 0 0 0 0 0 0 2 0 0;
        0 0 0 0 0 0 0 0 1 0;
        0 0 0 0 0 0 0 0 0 2;];
A_b = [ 0 1 0 0 0 0 0 0 0 0;
        0 0 1 0 0 0 0 0 0 1;
        0 0 0 1 0 0 0 1 0 0;
        0 0 0 0 1 1 0 0 0 0;
        0 0 0 0 0 1 0 0 0 0;
        0 0 0 1 0 0 1 0 0 0;
        0 0 0 0 0 0 0 1 0 0;
        0 0 1 0 0 0 0 0 1 0;
        0 0 0 0 0 0 0 0 0 1;
        1 1 0 0 0 0 0 0 0 0;];
L_b = D_b - A_b;

% cͼ�Ⱦ����ڽӾ���������˹����
D_c = [ 2 0 0 0 0 0 0 0 0 0;
        0 1 0 0 0 0 0 0 0 0;
        0 0 1 0 0 0 0 0 0 0;
        0 0 0 2 0 0 0 0 0 0;
        0 0 0 0 1 0 0 0 0 0;
        0 0 0 0 0 1 0 0 0 0;
        0 0 0 0 0 0 1 0 0 0;
        0 0 0 0 0 0 0 2 0 0;
        0 0 0 0 0 0 0 0 2 0;
        0 0 0 0 0 0 0 0 0 1;];
A_c = [ 0 1 0 0 0 0 0 0 1 0;
        0 0 1 0 0 0 0 0 0 0;
        0 0 0 1 0 0 0 0 0 0;
        0 0 0 0 1 0 0 1 0 0;
        0 0 0 0 0 1 0 0 0 0;
        0 0 0 0 0 0 1 0 0 0;
        0 0 0 0 0 0 0 1 0 0;
        0 0 0 1 0 0 0 0 1 0;
        1 0 0 0 0 0 0 0 0 1;
        1 0 0 0 0 0 0 0 0 0;];
L_c = D_c - A_c;

% dͼ�Ⱦ����ڽӾ���������˹����
D_d = [ 2 0 0 0 0 0 0 0 0 0;
        0 2 0 0 0 0 0 0 0 0;
        0 0 1 0 0 0 0 0 0 0;
        0 0 0 2 0 0 0 0 0 0;
        0 0 0 0 2 0 0 0 0 0;
        0 0 0 0 0 1 0 0 0 0;
        0 0 0 0 0 0 2 0 0 0;
        0 0 0 0 0 0 0 3 0 0;
        0 0 0 0 0 0 0 0 2 0;
        0 0 0 0 0 0 0 0 0 1;];
% �ڽӾ����������˽ṹ
A_d = [ 0 1 0 0 0 0 0 0 1 0;
        0 0 1 0 0 0 0 1 0 0;
        0 0 0 1 0 0 0 0 0 0;
        0 0 0 0 1 0 0 1 0 0;
        0 0 0 0 0 1 1 0 0 0;
        0 0 0 0 0 0 1 0 0 0;
        0 0 0 0 1 0 0 1 0 0;
        0 1 0 1 0 0 0 0 1 0;
        1 0 0 0 0 0 0 0 0 1;
        1 0 0 0 0 0 0 0 0 0;];
L_d = D_d - A_d;

% ����������ز���
tBegin = 0;                     % ��ʼʱ�� 
tEnd   = 15;                    % ����ʱ��
dt     = 0.1;                   % ��Сʱ����
times  = (tEnd-tBegin) / dt;    % �����������
time   = 1;
% �����¼ʱ������
t(:,1)   = tBegin;
% ����ͼa���ݴ洢����
X_a(:,1) = X0;
U_a(:,1) = -L_a * X0;
Delta_a(:,1) = X0' * L_a * X0;
% ����ͼb���ݴ洢����
X_b(:,1) = X0;
U_b(:,1) = -L_b * X0;
Delta_b(:,1) = X0' * L_b * X0;

X_c(:,1) = X0;
U_c(:,1) = -L_c * X0;
Delta_c(:,1) = X0' * L_c * X0;

X_d(:,1) = X0;
U_d(:,1) = -L_d * X0;
Delta_d(:,1) = X0' * L_d * X0;
% ��ʼ��������
while(time <= times)
    t(:,time+1) = tBegin + time * dt;
    % ͼa���ݵ���
    X_a(:,time+1) = expm(-L_a * t(:,time+1)) * X0;                          % Xt = expm(-Lx)*X0 ��Ӹ��º��Xtֵ
    U_a(:,time+1) = -L_a * X_a(:,time+1);                                   % Ut = -LXt ��Ӹ��º��Utֵ 
    Delta_a(:,time+1) = X_a(:,time+1)'*L_a*X_a(:,time+1);                   % Delta = X^T * L * X
    % ͼb���ݵ���
    X_b(:,time+1) = expm(-L_b * t(:,time+1)) * X0;
    U_b(:,time+1) = -L_b * X_b(:,time+1);
    Delta_b(:,time+1) = X_b(:,time+1)'*L_b*X_b(:,time+1);

    X_c(:,time+1) = expm(-L_c * t(:,time+1)) * X0;
    U_c(:,time+1) = -L_c * X_c(:,time+1);
    Delta_c(:,time+1) = X_c(:,time+1)'*L_c*X_c(:,time+1);

    X_d(:,time+1) = expm(-L_d * t(:,time+1)) * X0;
    U_d(:,time+1) = -L_d * X_d(:,time+1);
    Delta_d(:,time+1) = X_d(:,time+1)'*L_d*X_d(:,time+1);

    time = time + 1;
end

% ����Ĵ�����ͨ��
eig_val_a = eig(L_a);                       % L_a������ֵ
eig_val_a = sort(eig_val_a,'ascend');       % ��С����������С����ֵΪ0
AC_a      = real(eig_val_a(2));             % algebraic connectivity ������ͨ�ȣ�lap_matrix�ĵڶ�С����ֵ>0����ͨͼ

eig_val_b = eig(L_b);                       % L_b������ֵ
eig_val_b = sort(eig_val_b,'ascend');       % ��С����������С����ֵΪ0
AC_b      = real(eig_val_b(2));             % algebraic connectivity ������ͨ�ȣ�lap_matrix�ĵڶ�С����ֵ>0����ͨͼ

eig_val_c = eig(L_c);
eig_val_c = sort(eig_val_c,'ascend');
AC_c      = real(eig_val_c(2));

eig_val_d = eig(L_d);
eig_val_d = sort(eig_val_d,'ascend');
AC_d      = real(eig_val_d(2));

% ����ͼa����
subplot(4,2,1);
plot(t,X_a(1,:), t,X_a(2,:), t,X_a(3,:), t,X_a(4,:), t,X_a(5,:), t,X_a(6,:), t,X_a(7,:), t,X_a(8,:), t,X_a(9,:), t,X_a(10,:), 'linewidth',1.5)
xlabel("time(sec)");ylabel("node value");
title("Algebraic Connectivity="+num2str(AC_a));
subplot(4,2,3);
plot(t,Delta_a, 'linewidth',1.5);
xlabel("time(sec)");ylabel("disagreement");

subplot(4,2,2);
plot(t,X_b(1,:), t,X_b(2,:), t,X_b(3,:), t,X_b(4,:), t,X_b(5,:), t,X_b(6,:), t,X_b(7,:), t,X_b(8,:), t,X_b(9,:), t,X_b(10,:), 'linewidth',1.5)
xlabel("time(sec)");ylabel("node value");
title("Algebraic Connectivity="+num2str(AC_b));
subplot(4,2,4);
plot(t,Delta_b, 'linewidth',1.5);
xlabel("time(sec)");ylabel("disagreement");

subplot(4,2,5);
plot(t,X_c(1,:), t,X_c(2,:), t,X_c(3,:), t,X_c(4,:), t,X_c(5,:), t,X_c(6,:), t,X_c(7,:), t,X_c(8,:), t,X_c(9,:), t,X_c(10,:), 'linewidth',1.5)
xlabel("time(sec)");ylabel("node value");
title("Algebraic Connectivity="+num2str(AC_c));
subplot(4,2,7);
plot(t,Delta_c, 'linewidth',1.5);
xlabel("time(sec)");ylabel("disagreement");

subplot(4,2,6);
plot(t,X_d(1,:), t,X_d(2,:), t,X_d(3,:), t,X_d(4,:), t,X_d(5,:), t,X_d(6,:), t,X_d(7,:), t,X_d(8,:), t,X_d(9,:), t,X_d(10,:), 'linewidth',1.5)
xlabel("time(sec)");ylabel("node value");
title("Algebraic Connectivity="+num2str(AC_d));
subplot(4,2,8);
plot(t,Delta_d, 'linewidth',1.5);
xlabel("time(sec)");ylabel("disagreement");