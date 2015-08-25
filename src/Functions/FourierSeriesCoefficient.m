function [a,b] = FourierSeriesCoefficient(functionOfX, T, n, integralAccuracy)

f = functionOfX;

L=T/2;

syms 'x'

a = (1/L)*SimpsonIntegral(f*cos(n*pi*x/L),-L,L,integralAccuracy);
b = (1/L)*SimpsonIntegral(f*sin(n*pi*x/L),-L,L,integralAccuracy);