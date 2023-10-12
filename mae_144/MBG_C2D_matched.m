%muhammad bintang gemilang

function [bz,az] = MBG_C2D_matched(bs, as, h, omegab, causality)

%bs = zeros
%as = poles
%k = s domain gain 
%h = time step 
%omegab = frequency of interest (set to 0 if not mentioned)
%causality = strictly causal (1) or semicausal (0) (set to semicausal)

%step 1 transfrom from s domain to z domain by z = e^(s*h)

Gs=RR_tf(bs,as)

for i = 1:length(Gs.z)
    Gz_z(i) = exp(Gs.z(i)*h);
end

for j = 1:length(Gs.p)
    Gz_p(j) = exp(Gs.p(j)*h);
end

Gz1 = RR_tf(Gz_z,Gz_p,1);

%step 2 add infinite zero and set z = -1
if length(Gz1.p) > length(Gz1.z)
    matrixzero_z = zeros(1,length(Gz1.p)-length(Gz1.z)) 
    matrixzero_z = matrixzero_z - 1;
    Gz_prepz = cat(2, Gz_z, matrixzero_z)
else
    Gz_prepz = Gz1.z
end

Gz2 = RR_tf(Gz_prepz,Gz_p,1);

%step 3 causal or strictly causal
if isempty(causality) || causality == 0
    Gz2 = Gz2
else
    Gz_prepz = Gz_prepz(:, 1:end-1);
    Gz2 = RR_tf(Gz_prepz,Gz_p,1)
end

%step 4.1 decide the omega 

%step 4.2 use omega to decide the DC gain
%step 5 reorder the whole equation in z domain
