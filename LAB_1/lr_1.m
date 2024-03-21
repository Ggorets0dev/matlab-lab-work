% ������� �1
clc
x = 0:0.1:10;
y = x.*sin(x);
y1 = x.*cos(x);
figure (1)
plot (x,y,'b',x,y1,'r')

% ������� �2
x = 0:0.01:1;
y = 0:0.2:2;
nx = length(x);
ny = length(y);
z = zeros(nx,ny);
for i1=1:nx
    for j1 = 1:ny
        z(i1,j1) = exp(-10*((x(i1)-0.5)^2+(y(j1)-1)^2));
    end
end
figure (2)
mesh(y,x,z)

% ������� �3
A = zeros(3)
for i1=1:3
    for j1=1:3
        A(i1,j1)= i1+2*j1-1;
    end
end
A
A1 = A

% ������� �4
A2 = A(2:3, 1:3)
A3 = A(:,1:2)

% ������� 5
a = [7; 8; 9];
A4 = [A a]

% ������� �6
B = A' % ����������������

% ������� %7
v=[];
for i1=1:3
    for j1=1:3
        if A(i1,j1)>5
            v=[v A(i1,j1)];
        end
    end
end
v

% ������� �8
d = diag(A) % ������ � ������������� ���������� ������� �
D = diag(d) % ��������� ������������ ������� � ��������� ���������� �� ������� ��������� 

sled = trace(A)
sobstv = eig(A)
opred = det(A)
rang = rank(A)

% ������� �9
A(1,1)=0;
obrA = inv(A) % ���������� �������� �������

% ������� �10
syms a b c d % ���������� ���������� ���������� 
F = [a b; c d]
oprF = det(F)
obrF = inv(F)

% ������� �11
syms x
y = x * cos(x)
dy = diff(y)
int_y = int(y) % �������������� �������� 
int_y_opr = int(y, 0, 1)
int_y_opr_num = eval(int_y_opr) % ��������� ���������� �������� �� �����������
