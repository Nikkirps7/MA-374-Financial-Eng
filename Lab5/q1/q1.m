clear;
clc;

m = [0.1 0.2 0.15];
c = [0.005 -0.010 0.004; -0.010 0.040 -0.002; 0.004 -0.002 0.023];
u = ones(1,3);

w_opt = (u*inv(c))/(u*inv(c)*u');
m_opt = w_opt*m';
sig_opt = sqrt(w_opt*c*w_opt');
p = zeros(250,2);
k = zeros(250,3);
p(:,2) = m_opt;
j = 0;
for i = 1:250
    w_temp=[0 0 -1];
    while(min(w_temp)<0)
        p(i,2) = m_opt+((-1)^j)*j*0.0001;
        w_temp = (det([1 u*inv(c)*m';p(i,2) m*inv(c)*m'])*u*inv(c) + det([u*inv(c)*u' 1;m*inv(c)*u' p(i,2)])*m*inv(c))/det([u*inv(c)*u' u*inv(c)*m';m*inv(c)*u' m*inv(c)*m']);
        j = j+1;
    end
    k(i,:) = w_temp;
    p(i,1) = sqrt(w_temp*c*w_temp');
end

q = zeros(100000,2);
w_temp = [0 0 -1];
qq = rand(100000,3);
for i = 1:100000
    qq(i,:) = qq(i,:)/sum(qq(i,:));
    q(i,1) = sqrt(qq(i,:)*c*qq(i,:)');
    q(i,2) = qq(i,:)*m';
end
scatter(q(:,1),q(:,2),'yellow','*');
hold on;
scatter(p(:,1),p(:,2),'blue','.');
title('Minimum Variance Curves & Feasible Region');
xlabel('Standard Deviation');
ylabel('Mean');

mm = m;
mm(:,3)=[];
cc = c;
cc(:,3)=[];
cc(3,:)=[];
uu = ones(1,2);
w_opt = (uu*inv(cc))/(uu*inv(cc)*uu');
m_opt = w_opt*mm';
sig_opt = sqrt(w_opt*cc*w_opt');
p = zeros(500,2);
k3 = zeros(500,2);
p(:,2) = m_opt;
j = 0;
for i = 1:500
    w_temp=[0 0 -1];
    while(min(w_temp)<0)
        p(i,2) = m_opt+((-1)^j)*j*0.0001;
        w_temp = (det([1 uu*inv(cc)*mm';p(i,2) mm*inv(cc)*mm'])*uu*inv(cc) + det([uu*inv(cc)*uu' 1;mm*inv(cc)*uu' p(i,2)])*mm*inv(cc))/det([uu*inv(cc)*uu' uu*inv(cc)*mm';mm*inv(cc)*uu' mm*inv(cc)*mm']);
    j = j+1;
    end
    k3(i,:) = w_temp;
    p(i,1) = sqrt(w_temp*cc*w_temp');
end
scatter(p(:,1),p(:,2),'red','.');

mm = m;
mm(:,2)=[];
cc = c;
cc(:,2)=[];
cc(2,:)=[];
uu = ones(1,2);
w_opt = (uu*inv(cc))/(uu*inv(cc)*uu');
m_opt = w_opt*mm';
sig_opt = sqrt(w_opt*cc*w_opt');
p = zeros(250,2);
k2 = zeros(250,2);
p(:,2) = m_opt;
j = 0;
for i = 1:250
    w_temp=[0 0 -1];
    while(min(w_temp)<0)
        p(i,2) = m_opt+((-1)^j)*j*0.0001;
        w_temp = (det([1 uu*inv(cc)*mm';p(i,2) mm*inv(cc)*mm'])*uu*inv(cc) + det([uu*inv(cc)*uu' 1;mm*inv(cc)*uu' p(i,2)])*mm*inv(cc))/det([uu*inv(cc)*uu' uu*inv(cc)*mm';mm*inv(cc)*uu' mm*inv(cc)*mm']);
    j = j+1;
    end
    k2(i,:) = w_temp;
    p(i,1) = sqrt(w_temp*cc*w_temp');
end
scatter(p(:,1),p(:,2),'red','.');

mm = m;
mm(:,1)=[];
cc = c;
cc(:,1)=[];
cc(1,:)=[];
uu = ones(1,2);
w_opt = (uu*inv(cc))/(uu*inv(cc)*uu');
m_opt = w_opt*mm';
sig_opt = sqrt(w_opt*cc*w_opt');
p = zeros(250,2);
k1 = zeros(250,2);
p(:,2) = m_opt;
j = 0;
for i = 1:250
    w_temp=[0 0 -1];
    while(min(w_temp)<0)
        p(i,2) = m_opt+((-1)^j)*j*0.0001;
        w_temp = (det([1 uu*inv(cc)*mm';p(i,2) mm*inv(cc)*mm'])*uu*inv(cc) + det([uu*inv(cc)*uu' 1;mm*inv(cc)*uu' p(i,2)])*mm*inv(cc))/det([uu*inv(cc)*uu' uu*inv(cc)*mm';mm*inv(cc)*uu' mm*inv(cc)*mm']);
    j = j+1;
    end
    k1(i,:) = w_temp;    
    p(i,1) = sqrt(w_temp*cc*w_temp');
end
scatter(p(:,1),p(:,2),'red','.');
hold off;

figure();
plot3(k(:,1),k(:,2),k(:,3));
title('Weights corresponding to minimum variance curve');
xlabel('w1');
ylabel('w2');
zlabel('w3');
hold on;
plot3(zeros(250,1),k1(:,1),k1(:,2),'red');
plot3(k2(:,1),zeros(250,1),k2(:,2),'red');
plot3(k3(:,1),k3(:,2),zeros(500,1),'red');
hold off;