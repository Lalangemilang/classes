%muhammad bintang gemilang
%problem 2b

%n for y is 5
%n for x is 3

%since n for x<y, then the controller on 2a is improper.

a = RR_poly([-1 1 -3 3 -6 6], 1);
b = RR_poly([-2 2 -5 5], 1);
f = RR_poly([-1 -1 -3 -3 -6 -6 -20 -20 -20 -20 -20 -20], 1);
[x,y] = RR_diophantine(a,b,f)
test = trim(a*x+b*y);
residual1 = norm(f-test);

%the power of the numerator is less than the denominator (more poles than
%zeros) thus it will make it proper. add 5 k to make it proper and add 6 k
%to make it strictly proper.