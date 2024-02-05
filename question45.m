%THE CODE FOR QUESTION 4-5(MATLAB)
clear all
dt=0.1; %represent the changing time
x1=3000/60; %three points(submarine)location
y1=400/60;
x2=5000/60;
y2=-300/60;
x3=4000/60;
y3=0;
vx1=0; %three points(submarine)velocity
vy1=0;
vx2=0;
vy2=0;
vx3=0;
vy3=0;
xzhu=0; %lead ship's location
yzhu=0;
XRD1=rand(1,14401); %use random number to change three submarines and lead ship's direction
YRD1=rand(1,14401)*2-1;
XRD2=rand(1,14401);
YRD2=rand(1,14401)*2-1;
XRD3=rand(1,14401);
YRD3=rand(1,14401)*2-1;
ZHURD=rand(1,14401)/2+0.5;
fxiang = randi([0,1], 1, 14401); 
fxiang(fxiang==0) = -1; 
VX1=[];
VY1=[];
VX2=[];
VY2=[];
VX3=[];
VY3=[];
VX4=[];
VY4=[];
X11=[];
Y11=[];
X12=[];
Y12=[];
X13=[];
Y13=[];
X31=[];
Y31=[];
X32=[];
Y32=[];
X33=[];
Y33=[];
X3=[];
Y3=[];
R=[]; %distance of submarine to origin
i_1=1; %changing itself in a circulation to control the timing to break it
RJ1=[];
RJ2=[];
RJ3=[];
Tok1=[];
Tok2=[];
Tok3=[];
a11=[];
modle=1 %ensure the lead ship's mobility pattern in different time by the distance of lead ship and the three point
for t=[0:dt:1440]
X=XRD1(i_1);
Y=YRD1(i_1);
Wx=1.8*X; %simulate the force of ocean currents
Wy=1.8*Y;
ax1=0.9*(Wx-vx1)-0.2*vx1; %acceleration component of the submersible
ay1=0.8*(Wy-vy1)-0.2*vy1;
ax2=0.6*(Wx-vx2)-0.2*vx2;
ay2=0.8*(Wy-vy2)-0.2*vy2;
ax3=0.7*(Wx-vx3)-0.2*vx3;
ay3=0.7*(Wy-vy3)-0.2*vy3;
vx1=vx1+ax1*dt; %vt=v0+a*dt
vy1=vy1+ay1*dt;
vx2=vx2+ax2*dt;
vy2=vy2+ay2*dt;
vx3=vx3+ax3*dt;
vy3=vy3+ay3*dt;
x1=x1+vx1*dt; %s=s0+v*dt(the code helps to simulate calculus process )
y1=y1+vy1*dt;
x2=x2+vx2*dt;
y2=y2+vy2*dt;
x3=x3+vx3*dt;
y3=y3+vy3*dt;
vzhu=2; %the velocity of lead ship
if modle==1
vzhux=vzhu*(x1-xzhu)/((x1-xzhu)^2+(y1-yzhu)^2)^0.5;
vzhuy=vzhu*(y1-yzhu)/((x1-xzhu)^2+(y1-yzhu)^2)^0.5;
elseif modle==2
vzhux=vzhu*(x2-xzhu)/((x2-xzhu)^2+(y2-yzhu)^2)^0.5;
vzhuy=vzhu*(y2-yzhu)/((x2-xzhu)^2+(y2-yzhu)^2)^0.5;
elseif modle==3
vzhux=vzhu*(x3-xzhu)/((x3-xzhu)^2+(y3-yzhu)^2)^0.5;
vzhuy=vzhu*(y3-yzhu)/((x3-xzhu)^2+(y3-yzhu)^2)^0.5;
end
xzhu=xzhu+vzhux*dt;
yzhu=yzhu+vzhuy*dt;
VX1(end+1)=vx1;
VY1(end+1)=vy1;
VX2(end+1)=vx2;
VY2(end+1)=vy2;
VX3(end+1)=vx3;
VY3(end+1)=vy3;
VX4(end+1)=vzhux;
VY4(end+1)=vzhuy;
X11(end+1)=x1;
Y11(end+1)=y1;
X12(end+1)=x2;
Y12(end+1)=y2;
X13(end+1)=x3;
Y13(end+1)=y3;
X3(end+1)=xzhu;
Y3(end+1)=yzhu;
i_1=i_1+1;
Rj1=((xzhu-x1)^2+(yzhu-y1)^2)^0.5;
Rj2=((xzhu-x2)^2+(yzhu-y2)^2)^0.5;
Rj3=((xzhu-x3)^2+(yzhu-y3)^2)^0.5;
if Rj1 < 200/60
Tok1(end+1)=round(i_1/10,0);
end
if Rj2 < 200/60
Tok2(end+1)=round(i_1/10,0);
end
if Rj3 < 200/60
Tok3(end+1)=round(i_1/10,0);
end
if Rj1 < 200/60
modle=2
end
if Rj2 < 200/60
modle=3
end
if Rj3 < 200/60 && modle==3
modle=2
end
end
X21=X11*60;
Y21=Y11*60;
X22=X12*60;
Y22=Y12*60;
X23=X13*60;
Y23=Y13*60;
X4=X3*60;
Y4=Y3*60;
T=0:dt:1440;
plot(X21,Y21,X22,Y22,X23,Y23,X4,Y4) %visualization,get a figure
A1=min(Tok1(:))
A2=min(Tok2(:))
A3=min(Tok3(:))