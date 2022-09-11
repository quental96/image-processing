function [R,G,B]=disks(size,raidus,dist)

%génération des centres 
dxr=dist*cos(pi/6);
dyr=-dist*sin(pi/6);

dxg=-dxr;
dyg=dyr;

dxb=0;
dyb=dist;

[X,Y]=meshgrid(-(size-1)/2:(size-1)/2);

radiusR=((X-dxr).^2+(Y-dyr).^2).^0.5;
radiusG=((X-dxg).^2+(Y-dyg).^2).^0.5;
radiusB=((X-dxb).^2+(Y-dyb).^2).^0.5;

R=double(radiusR<raidus);
G=double(radiusG<raidus);
B=double(radiusB<raidus);

end
