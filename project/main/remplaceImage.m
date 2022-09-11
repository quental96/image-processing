function r = remplaceImage(i,j,x_max,y_max,M,vN,A,ImRGB)

% Summary : On remplace un point de la feuille par un point de l'image 
% Description

r=1:3;

    if (vN(1)>=1) && (vN(1)<x_max) && (vN(2)>=1) && (vN(2)<y_max)
            
                if M(floor(vN(2)),floor(vN(1)))==0
                
                    r(1)=bilinInterpol(vN(1),vN(2),A);
                    r(2)=bilinInterpol(vN(1),vN(2),A);
                    r(3)=bilinInterpol(vN(1),vN(2),A);
                
                elseif (ImRGB(i,j,1)>=87) && (ImRGB(i,j,1)<=135) && (ImRGB(i,j,2)>=117) && (ImRGB(i,j,3)>117)
                
                    r(1)=bilinInterpol(vN(1),vN(2),A);
                    r(2)=bilinInterpol(vN(1),vN(2),A);
                    r(3)=bilinInterpol(vN(1),vN(2),A);
                
                else
        
                    r(1)=ImRGB(i,j,1);
                    r(2)=ImRGB(i,j,2);
                    r(3)=ImRGB(i,j,3);
                
                end
                
    else
        
        r(1)=ImRGB(i,j,1);
        r(2)=ImRGB(i,j,2);
        r(3)=ImRGB(i,j,3);
        
    end
    
end