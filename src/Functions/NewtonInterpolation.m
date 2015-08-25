function functionOfX = NewtonInterpolation(Matrix_X,Matrix_Y)

X=Matrix_X;
Y=Matrix_Y;

n=length(X);

Df=zeros(n,n);

for i=1:n
    Df(i,1)=Y(i);
end


for i=2:n
    for j=1:(n-i+1)
        Df(j,i)= ( Df(j+1,i-1) - Df(j,i-1) )/( X(j+i-1) - X(j) );
    end
end


C=Df(1,:);

syms 'x'

Z= C(1);

for i=2:n
    temp = C(i);
    for j=1:i-1
        temp = temp*(x-X(j));
    end
    Z = Z+temp;
end

functionOfX = Z;