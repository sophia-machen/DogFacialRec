%Database
%Creates a database of images and eigenstuff for our dog breeds
input=imread('Pug.jpg');
outimg=luminance_L(input);
imshow(outimg)

%BWimg=imbinarize(outimg);
[n,m]=size(outimg);
squaremat=imresize(outimg, [n n]);
%symmat=outimg.*outimg';

colormap('gray');
subplot(1,3,1);
imshow(squaremat);
           
subplot(1,3,2);
imshow(outimg)
         
subplot (1,3,3)
imshow(input);

%Also could use 'moler' or 'minij'
posdefmat=gallery('lehmer',squaremat);

%Eigenvalues of our positive definite matrix; V is a matrix of
%eigenvectors, and E is the corresponding diagonal matris of eigenvalues
[V,E] = eig(posdefmat);

%**!! Add labels & Screenclip for report
subplot(1,3,1);
imshow(posdefmat);
title('Positive Definite Matrix from Image')   

subplot(1,3,2);
imshow(V)
title('Eigenvectors of Image')  

subplot (1,3,3)
imshow(E);
title('Eigenvalues of Image')  