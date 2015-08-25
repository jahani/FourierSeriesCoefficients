function result = SimpsonIntegral(f, a, b, n)

h=(b-a)/n;
x=a:h:b;

% n should be even
if (mod(n,2)==1)
    n = n+1;
end

Z = subs(f,a) + subs(f,b);

temp = 0;
for i=1:(n/2)-1
    temp = temp + subs(f,x(2*i +1));
end
Z = Z + 2*temp;

temp = 0;
for i=0:(n/2)-1
    temp = temp + subs(f,x(2*i+1 +1));
end
Z = Z + 4*temp;

Z = Z*(h/3);
result = Z;