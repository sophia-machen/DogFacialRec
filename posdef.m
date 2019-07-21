function [ newvec ] = posdef( inmat )
%Image Compression & formatting function

%Use Luminance_L function to convert to greyscale
outimg=luminance_L(inmat);

%Convert to data type double for function operations
outimg=double(outimg);

%resize the image so that all are the same size
outimg=imresize(outimg, [100 100]);
%Reshape into a single vector
newvec=reshape(outimg,[],1);

end

