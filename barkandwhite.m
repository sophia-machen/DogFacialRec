%Bark and White
clc
clear all

%Database
%First, load images
% Breed A - Bulldog
% Breed B - Bull Terrier
% Breed C - Corgi
% Breed D - Golden
% Breed E - Greyhound
% Breed F - Pug
% Breed G - Schnauzer
% Breed H - Spaniel

%Bulldog Database
a1=imread('bulldog.jpg');
a2=imread('bulldog2.jpg');
a3=imread('bulldog3.jpg');
a4=imread('bulldog4.jpg');
a5=imread('bulldog5.jpg');

pa1=posdef(a1);
pa2=posdef(a2);
pa3=posdef(a3);
pa4=posdef(a4);
pa5=posdef(a5);

%forming a single vector/ unfolding the image into a single vector (stack
%rows as columns into one vector)

Aavgmat= (1/5)*(pa1+pa2+pa3+pa4+pa5);

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

%Next make the average image of the database

avgmat= (1/8)*(Aavgmat+Bavgmat+Cavgmat+Davgmat+Eavgmat+Favgmat+Gavgmat+Havgmat);
%Find the covarience between each image and the average (Subtract the
%average from the matrix)

%Bulldog
%mat1=Aavgmat-avgmat;
%mat1=Aavgmat-avgmat;
%[V1,E1] = eig(mat1);
%Bull Terrier
%mat2=Bavgmat-avgmat;
%[V2,E2] = eig(mat2);
%Corgi
%mat3=Cavgmat-avgmat;
%[V3,E3] = eig(mat3);
%Golden
%mat4=Davgmat-avgmat;
%[V4,E4] = eig(mat4);
%Greyhound
%mat5=Eavgmat-avgmat;
%[V5,E5] = eig(mat5);
%Pug
%mat6=Favgmat-avgmat;
%[V6,E6] = eig(mat6);
%Schnauzer
%mat7=Gavgmat-avgmat;
%[V7,E7] = eig(mat7);
%Spaniel
%mat8=Havgmat-avgmat;
%[V8,E8] = eig(mat8);




%Have user input comparing file

file=input('Please input the name of your image followed by .jpg: ','s');
inmat=imread(file);

%Find eigenstuff for input file, compare to average.
posmat=posdef(inmat);
unknownmat=posmat-avgmat;
[Vu,Eu]=eig(unknownmat);
%Compare compared part to covarience matrix (least squares something)

diff1=abs(V1-Vu);
s1=sum(sum(diff1));
diff2=abs(V2-Vu);
s2=sum(sum(diff2));
diff3=abs(V3-Vu);
s3=sum(sum(diff3));

diff4=abs(V4-Vu);
s4=sum(sum(diff4));
diff5=abs(V5-Vu);
s5=sum(sum(diff5));
diff6=abs(V6-Vu);
s6=sum(sum(diff6));

diff7=abs(V7-Vu);
s7=sum(sum(diff7));
diff8=abs(V8-Vu);
s8=sum(sum(diff8));
diff=min([s1 s2 s3 s4 s5 s6 s7 s8]);
%docloc=find(diff,diffvec)
dognames={'Bulldog','Bull Terrier', 'Corgi', 'Golden Retriever', 'Greyhound','Pug','Schnauzer','King Charles Spaniel'};
dogtypes=[s1 s2 s3 s4 s5 s6 s7 s8];
dogidx=find(dogtypes == diff);
fprintf('Your dog most closely resembles %s \n', dognames{dogidx} )
%Finally, return 
%"It appears that you have chosen an image of (Dog breed name)."
%Display images side by side.