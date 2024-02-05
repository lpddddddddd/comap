%THE CODE FOR QUESTION 4-2(MATLAB)
clear all
dt=0.1; %represent the changing time
x=0; %x,y,z represent submarine's three-dimensional coordinates(location)
y=0;
z=0;
vx=0; %vx,vy,vz represent velocity components of the submarine
vy=0;
vz=0;
xzhu=-5000/60; %lead ship's location
yzhu=0;
XRD=rand(1,14400)*2-1; %use random number to change direction
YRD=rand(1,14400)*2-1;
ZHURD=rand(1,14400)/2+0.5;
VX=[];
VY=[];
VZ=[];
X1=[];
Y1=[];
X3=[];
Y3=[];
Z1=[];
R=[];%distance of submarine to origin
i_1=1; %changing itself in a circulation to control the timing to break it
RJ=[];
Tok=[];
Rj=((xzhu-x)^2+(yzhu-y)^2)^0.5;
while Rj > 150/60 
X=XRD(i_1);
Y=YRD(i_1);
Wx=4.3*X; %simulate the force of ocean currents
Wy=4.3*Y;
ax=0.9*(Wx-vx)-0.2*vx; %acceleration component of the submersible
ay=0.8*(Wy-vy)-0.2*vy;
az=0.2*(10-0.5*z)-0.2*vz;
vx=vx+ax*dt; %vt=v0+a*dt
vy=vy+ay*dt;
vz=vz+az*dt;
vzhu=2; %the velocity of lead ship
vzhux=vzhu*(x-xzhu)/((x-xzhu)^2+(y-yzhu)^2)^0.5;
vzhuy=vzhu*(y-yzhu)/((x-xzhu)^2+(y-yzhu)^2)^0.5;
x=x+vx*dt; %s=s0+v*dt(the code helps to simulate calculus process )
y=y+vy*dt;
z=z+vz*dt;
r=x*x+y*y;
xzhu=xzhu+vzhux*dt;
yzhu=yzhu+vzhuy*dt;
Rj=((xzhu-x)^2+(yzhu-y)^2)^0.5;
VX(end+1)=vx;
VY(end+1)=vy;
X1(end+1)=x;
Y1(end+1)=y;
X3(end+1)=xzhu;
Y3(end+1)=yzhu;
Z1(end+1)=z;
R(end+1)=r;
i_1=i_1+1;
RJ(end+1)=Rj;
if Rj < 200/60
Tok(end+1)=round(i_1/10,0);
end
end
X2=X1*60;
Y2=Y1*60;
X4=X3*60;
Y4=Y3*60;
Z2=Z1;
T=1:dt:300;
plot(X2,Y2,X4,Y4) %visualization,get a figure
A=min(Tok(:))