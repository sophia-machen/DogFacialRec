function [ outimg ] = luminance_NL(inimg)
%Gretchen Conley; 106535358
%CSCI 1320 ; sec 109; Zagrodski
%Assignment 7 task 6

%This function returns the grayscale version of an image
%Without using loops.
outimg=double(rgb2gray(inimg));


end

