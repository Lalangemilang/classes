%muhammad bintang gemilang
%problem 3

%program a c2d by pole-sero mapping (a.k.a matched z-transform)
%step 1 (transform s to z via z=e^(sh))

%function [bz, az] = MBG_C2D_matched(bs, as, h, omegab)
%syms as bs 
[bs]=[3];
[as]=[-1 -2];
h = 1;

bsl = length(bs);
asl = length(as);

if asl > bsl
    l = asl;
end

z = zeros(1,l); %(matrix for bs)
p = zeros(1,l); %(matrix for as)

for i = 1:bsl
    z(i) = exp(bs(i)*h);
end

for j = 1:asl
    p(j) = exp(as(i)*h);
end



%step 2 (map all infinite zeros of D(s) to z=-1 in D(z)

%step 3 (match gain of D(z) at z = e^(iwh) with gain of D(s) at s = iw, w =
%0)
