clc
x=csvread('fruits - Copy.csv',1,1);

%Total
Total=x(4,7);
Bt=x(1,7);%Total number of Bananaa
Ot=x(2,7);%Total number of Oranges
Ft=x(3,7);%Total number of Other Fruits

% Priors probabilities of all fruits
B=x(1,7)/x(4,7);%Banana
O=x(2,7)/x(4,7);%Orange
F=x(3,7)/x(4,7);%Other Fruits


%Evidence of all fruits
L=x(4,1)/Total;     %Long
nL=1-L;             %Not Long
S=x(4,3)/Total;     %Sweet
nS=1-S;             %Not Sweet
Y=x(4,5)/Total;     %Yellow
nY=1-Y;             %Not Yellow

%Likelihoods of Banana
LB=x(1,1)/Bt;       %Long Bananas
nLB=1-LB;           %Not Long Bananas

SB=x(1,3)/Bt;       %Sweet Bananas
nSB=1-SB;           %Not Sweet Bananas

YB=x(1,5)/Bt;       %Yellow Bananas
nYB=1-YB;           %Not Yellow Bananas

%Likelihoods of Orange
LO=x(2,1)/Ot;      %Long Orange 
nLO=1-LO;          %Not Long Orange

SO=x(2,3)/Ot;      %Sweet Orange
nSO=1-SO;          %Not Sweet Orange

YO=x(2,5)/Ot;      %Yellow Orange
nYO=1-YO;          %Not Yellow Orange

%Likelihoods of Other Fruits
LF=x(3,1)/Ft;      %Long Other Fruits
nLF=1-LF;          %Not Long Fruits

SF=x(3,3)/Ft;      %Sweet Fruits
nSF=1-SF;          %Not Sweet Fruits

YF=x(3,5)/Ft;      %Yellow Fruits
nYF=1-YF;          %Not Yellow Fruits


%Probablity of all fruits given Long, Sweet and Yellow
Blsy=B*LB*SB*YB/(L*S*Y);%For Banana
Olsy=O*LO*SO*YO/(L*S*Y);%For Orange
Flsy=F*LF*SF*YF/(L*S*Y);%For Other Fruits
disp(['Probabilities of fruits that are Long, Sweet and Yellow:']);
sprintf('Banana=%.4f\nOrange=%.4f\nOther Fruit=%.4f\n',Blsy,Olsy,Flsy)

%Probablity of all fruits given Long, not Sweet and not Yellow
BLnSnY=B*LB*nSB*nYB/(L*nS*nY);%For Banana
OLnSnY=O*LO*nSO*nYO/(L*nS*nY);%For Orange
FLnSnY=F*LF*nSF*nYF/(L*nS*nY);%For Other Fruits
disp(['Probabilities of fruits that are Long, not Sweet and not Yellow:']);
sprintf('Banana=%.4f\nOrange=%.4f\nOther Fruit=%.4f\n',BLnSnY,OLnSnY,FLnSnY)

%Probablity of all fruits given not Long, Sweet and Yellow
BnLSY=B*nLB*SB*YB/(nL*S*Y);%For Banana
OnLSY=O*nLO*SO*YO/(nL*S*Y);%For Orange
FnLSY=F*nLF*SF*YF/(nL*S*Y);%For other fruits
disp(['Probabilities of fruits that are not Long, Sweet and Yellow:']);
sprintf('Banana=%.4f\nOrange=%.4f\nOther Fruit=%.4f\n',BnLSY,OnLSY,FnLSY)


disp(['If the Fruit is Long, Sweet and Yellow, it is most likely to be a BANANA']);
disp(['If the Fruit is Long, not Sweet and not Yellow, it is most likely to be FRUIT OTHER THAN ORANGE AND BANANA']);
disp(['If the Fruit is not Long, Sweet and Yellow, it is most likely to be an ORANGE']);






