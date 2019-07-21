%Dog eigenfaces

%Clear workspace of miscellaneous data
clc
clear all

%Create a database & load in images
% Breed A - Bulldog - Removed due to inconsistent data set
% Breed B - Bull Terrier
% Breed C - Corgi
% Breed D - Golden
% Breed E - Greyhound
% Breed F - Pug
% Breed G - Schnauzer
% Breed H - Spaniel


%forming a single vector/ unfolding the image into a single vector (stack
%rows as columns into one vector)


%Bull Terrier Database
b1=imread('Bull Terrier.jpg');
b2=imread('bull terrier 2.jpg');
b3=imread('bull terrier 3.jpg');
b4=imread('bull terrier 4.jpg');
b5=imread('bull terrier 5.jpg');

pb1=posdef(b1);
pb2=posdef(b2);
pb3=posdef(b3);
pb4=posdef(b4);
pb5=posdef(b5);

Bavgmat= (1/5)*(pb1+pb2+pb3+pb4+pb5);

%Corgi Database
c1=imread('Corgi.jpg');
c2=imread('corgi2.jpg');
c3=imread('corgi3.jpg');
c4=imread('corgi4.jpg');
c5=imread('corgi5.jpg');

pc1=posdef(c1);
pc2=posdef(c2);
pc3=posdef(c3);
pc4=posdef(c4);
pc5=posdef(c5);

Cavgmat= (1/5)*(pc1+pc2+pc3+pc4+pc5);

%Golden Database
d1=imread('golden1.jpg');
d2=imread('golden2.jpg');
d3=imread('golden3.jpg');
d4=imread('golden4.jpg');
d5=imread('golden5.jpg');

pd1=posdef(d1);
pd2=posdef(d2);
pd3=posdef(d3);
pd4=posdef(d4);
pd5=posdef(d5);

Davgmat= (1/5)*(pd1+pd2+pd3+pd4+pd5);

%Greyhound database

e1=imread('greyhound.jpg');
e2=imread('greyhound2.jpg');
e3=imread('greyhound3.jpg');
e4=imread('greyhound4.jpg');
e5=imread('greyhound5.jpg');

pe1=posdef(e1);
pe2=posdef(e2);
pe3=posdef(e3);
pe4=posdef(e4);
pe5=posdef(e5);

Eavgmat= (1/5)*(pe1+pe2+pe3+pe4+pe5);

%Pug Database
f1=imread('Pug.jpg');
f2=imread('pug1.jpg');
f3=imread('pug2.jpg');
f4=imread('pug3.jpg');
f5=imread('pug4.jpg');

pf1=posdef(f1);
pf2=posdef(f2);
pf3=posdef(f3);
pf4=posdef(f4);
pf5=posdef(f5);

Favgmat= (1/5)*(pf1+pf2+pf3+pf4+pf5);

%Schnauzer Database
g1=imread('Schnauzer.jpg');
g2=imread('schnauzer2.jpg');
g3=imread('schnauzer3.jpg');
g4=imread('schnauzer4.jpg');
g5=imread('scnauzer5.jpg');

pg1=posdef(g1);
pg2=posdef(g2);
pg3=posdef(g3);
pg4=posdef(g4);
pg5=posdef(g5);

Gavgmat= (1/5)*(pg1+pg2+pg3+pg4+pg5);

%Spaniel Database
h1=imread('Spaniel.jpg');
h2=imread('Spaniel1.jpg');
h3=imread('spaniel2.jpg');
h4=imread('spaniel3.jpg');
h5=imread('spaniel5.jpg');

ph1=posdef(h1);
ph2=posdef(h2);
ph3=posdef(h3);
ph4=posdef(h4);
ph5=posdef(h5);

Havgmat= (1/5)*(ph1+ph2+ph3+ph4+ph5);

%Average face
avgmat= (1/7)*(Bavgmat+Cavgmat+Davgmat+Eavgmat+Favgmat+Gavgmat+Havgmat);


%Create the training set - the difference between each dog face in
%the database with the average of all dog faces in the database
dogfaces=[pb1 pb2 pb3 pb4 pb5 pc1 pc2 pc3 pc4 pc5 pd1 pd2 pd3 pd4 pd5 pe1...
    pe2 pe3 pe4 pe5 pf1 pf2 pf3 pf4 pf5 pg1 pg2 pg3 pg4 pg5 ph1 ph2 ph3 ph4 ph5];

%tset is a matrix of our training set vectors
tset=zeros(10000,35);

for i=1:35
    tset(:,i)=dogfaces(:,i)-avgmat ;
end


% find the SVD of the training set using the built in svd function
[U,D,V]=svd(tset);


%Take the first 35 columns of U as the orthonormal basis for the eigenspace
Uv=U(:,1:35);


%displays eigenfaces as an image
for j=1:35
    subplot(5,7,j);
    imshow(vec2mat(128*(U(:,j))));
end


%Ask the user to input their dog type that they wish to identify
file=input('Please input the name of your dog image followed by .jpg: ','s');
inmat=imread(file);
%Turn the input image into a vector of the same dimension as those in our
%training set
facevec=posdef(inmat);
unknownvec=facevec-avgmat;

%Project the vectors from our training set onto the orthonormal basis
eigenface=[];
for l=1:35
eigenface(:,l)=Uv'*tset(:,l);
end

%Find the difference between the input image vector projected into the
%orthonormal basis and the new vector projected into the orthonormal basis
err=[];
for k=1:35
    err(:,k)=abs(Uv'*unknownvec-eigenface(:,k));
end

%Sum the elements in the difference vector to find the "net difference"
%between the input image and each training set image
sums=[];
for m=1:35
    sums(m)=sum(err(:,m));
end


%Then, find and locate the minimum difference to identify the dog breed
dognames={'Bull Terrier','Bull Terrier','Bull Terrier','Bull Terrier','Bull Terrier', 'Corgi', 'Corgi', 'Corgi', 'Corgi', 'Corgi', 'Golden Retriever','Golden Retriever', 'Golden Retriever', 'Golden Retriever', 'Golden Retriever',  'Greyhound','Greyhound','Greyhound','Greyhound','Greyhound','Pug','Pug','Pug','Pug','Pug','Schnauzer','Schnauzer','Schnauzer','Schnauzer','Schnauzer','King Charles Spaniel','King Charles Spaniel','King Charles Spaniel','King Charles Spaniel','King Charles Spaniel'};
dogtypes=sums;
diff=min(sums);
dogidx=find(dogtypes==diff);

%Display result
fprintf('Your dog most closely resembles a %s \n', dognames{dogidx} )

figure
subplot (1,3,1)

imshow(inmat)
title ('Your input image');
%dogs=[b1 b2 b3 b4 b5 c1 c2 c3 c4 c5 d1 d2 d3 d4 d5 e1 e2 e3 e4 e5 f1 f2 f3 f4 f5 g1 g2 g3 g4 g5 h1 h2 h3 h4 h5];
subplot (1,3,2)

imshow (vec2mat(dogfaces(:,dogidx))/265)
title ('most closely resembled dog')

subplot (1,3,3)
plot(sums)
title ('difference between vectors')
xlabel('Database image')
ylabel('Net difference with input image')



