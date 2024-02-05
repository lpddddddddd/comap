%THE CODE FOR QUESTION 2(MATLAB)
clc
dt=1 %represent the changing time
x=0; %x,y,z represent submarine's three-dimensional coordinates(location)
y=0;
z=0;
vx=0; %vx,vy,vz represent velocity components of the submarine
vy=0;
vz=0;
XRD=rand(1,1440); %use random number to change submarine's direction
%XRD=rand(1,1440)*2-1;
YRD=rand(1,1440)*2-1;
VX=[];
VY=[];
VZ=[];
X1=[];
Y1=[];
Z1=[];
R=[]; %distance of submarine to origin
i_1=1 %changing itself in a circulation to control the timing to break it
for t=[1:dt:1440]
X=XRD(i_1);
Y=YRD(i_1);
Wx=1.8*X; %simulate the force of ocean currents
Wy=1.8*Y;
ax=0.9*(Wx-vx)-0.2*vx; %acceleration component of the submersible
ay=0.8*(Wy-vy)-0.2*vy;
az=0.2*(10-0.5*z)-0.2*vz;
vx=vx+ax*dt; %vt=v0+a*dt
vy=vy+ay*dt;
vz=vz+az*dt;
x=x+vx*dt; %s=s0+v*dt(the code helps to simulatecalculus process )
y=y+vy*dt;
z=z+vz*dt;
r=x*x+y*y;
VX(end+1)=vx;
VY(end+1)=vy;
X1(end+1)=x;
Y1(end+1)=y;
Z1(end+1)=z;
R(end+1)=r;
i_1=i_1+1;
end
X2=X1*60;
Y2=Y1*60;
Z2=Z1;
T=1:dt:1440;
R2=(T-30)*1.8*60-2000; %lead ship
plot(T,R,T,R2) %visualization,get a figure
%plot(X2,Y2) %delete the '%' to get this figure