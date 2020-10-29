clear;
clc;
% ��ΪPaper��Scetion5����
% ������˹��������
L = [2, -1, -1;
     0,  1, -1;
    -1,  0,  1;];

%% ������������������˹�����ƶϿ�֪��
% �ڵ�˳��Ϊ3-1
% �Ⱦ���Ϊ
D = [2, 0, 0;
     0, 1, 0;
     1, 0, 1;];
% �ڽӾ���Ϊ
A = [0, 1, 1;
     0, 0, 1;
     1, 0, 0;];
 
%% ��������ֵ����������
% ���η��أ��ң���������������ֵ������������
[eigenVector, eigenValue, lefteigenVector] = eig(L);

%% Equation 17
syms x1 x2 x3 real;
X0 = [x1 x2 x3]';
Xt = -L * X0;
sum(Xt);

%% Equation 18
syms t;
R = expm(-L * t);
R1 = limit(R, t, inf);
R2 = eigenVector * lefteigenVector'; 




 
 
 
 

