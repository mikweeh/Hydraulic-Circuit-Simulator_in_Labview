function[lambda]=colebrookwhite(reynolds,rugosidadr)
%colebrookwhite('numero de reynolds','rugosidad relativa')
%reynolds>100000 es declaradamente turbulento;
%rugosidad abs=0.000045 m es la del acero al carbono sin soldadura

limites=zeros(1,2);
limites(1,1)=0.008;
limites(1,2)=0.1;
valor=0;
lambda=(limites(1,2)+limites(1,1))/2;
dif1=abs(lambda-limites(1,2));
dif2=abs(lambda-limites(1,1));
while dif1>0.0000001 & dif2>0.0000001 
    valor=3.7*10^(-0.5/sqrt(lambda))-9.287/(reynolds*sqrt(lambda))-rugosidadr;
    if valor>=0
        limites(1,2)=lambda;
    else
        limites(1,1)=lambda;
    end
    lambda=(limites(1,2)+limites(1,1))/2;
    dif1=abs(lambda-limites(1,2));
    dif2=abs(lambda-limites(1,1));
end
