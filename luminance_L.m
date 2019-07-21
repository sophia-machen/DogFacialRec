function [ outimg ] = luminance_L( inimg )
%Created by Gretchen Conley for Assignment 7, CSCI 1320
%This function creates a grayscale version of an image with given adjusted
%values to the red, green, and blue layers
[h,i,j]=size(inimg);
M=zeros(h,i,1);
N=zeros(h,i,1);
P=zeros(h,i,1);

for k=1:j
    if k==1
        M=uint8(inimg(:,:,k)*.299);
    elseif k==2
        N=uint8(inimg(:,:,k)*.587);
    elseif k==3
        P=uint8(inimg(:,:,k)*.114);  
    end
end
%Add the layers together to form a 2D matrix for output
outimg=M+N+P;


end

