clear
clc
close all


v = VideoReader('vid_in2.mp4');
% ImRGB=readFrame(v);
ImRGB=read(v,100);

imshow(ImRGB);
[x,y] = getpts;
P1=[floor(x),floor(y)];
[x,y] = getpts;
P2=[floor(x),floor(y)];
[x,y] = getpts;
P3=[floor(x),floor(y)];
[x,y] = getpts;
P4=[floor(x),floor(y)];

A = double(imread('cameraman.tif'));

% plantesRGB = imread('weed.jpg');
% plantesYCbCr=rgb2ycbcr(plantesRGB);
% A=double(plantesYCbCr(:,:,1));

[x_max,y_max,P] = incrust(A);
H = homographie(P,P1,P2,P3,P4);

M=masque(A);

for i = min([P1(2) P2(2) P3(2) P4(2)]):max([P1(2) P2(2) P3(2) P4(2)])
    for j = min([P1(1) P2(1) P3(1) P4(1)]):max([P1(1) P2(1) P3(1) P4(1)])
        
        u = [j;i;1];
        v = H*u;
        vN = v(1:2)/v(3);
        
        if (vN(1)>=1) && (vN(1)<x_max) && (vN(2)>=1) && (vN(2)<y_max)
            
            if M(floor(vN(2)),floor(vN(1)))==0
                
                ImRGB(i,j,1)=bilinInterpol(vN(1),vN(2),A);
                ImRGB(i,j,2)=bilinInterpol(vN(1),vN(2),A);
                ImRGB(i,j,3)=bilinInterpol(vN(1),vN(2),A);
                
            elseif (ImRGB(i,j,1))>10 && (ImRGB(i,j,1))>10 && (ImRGB(i,j,1))>100
                
                ImRGB(i,j,1)=bilinInterpol(vN(1),vN(2),A);
                ImRGB(i,j,2)=bilinInterpol(vN(1),vN(2),A);
                ImRGB(i,j,3)=bilinInterpol(vN(1),vN(2),A);
                
            end
            
        end
        
    end
end

figure
imshow(ImRGB);


        
