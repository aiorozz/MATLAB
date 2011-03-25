function wg = makegauss(c, sig, sizevec)
% wg = makegauss(c, sig, sizevec)
% Creates N images of gaussians centered at c (1x2N long vector with
% sequential cooridnates [x1 y1 x2 y2 ... xN yN]) with std sig. Each images
% image will be of the size sizevec. 
    
ng = length(c)/2; % Number of gaussians
if numel(sig) == 1 % All will have the same sig
    sig = repmat(sig, 1, ng);
end

[X,Y] = meshgrid(0:sizevec(1)-1,0:sizevec(2)-1);
n0=1./(2*pi*sig.^2);
cr = reshape(c,2,ng)';

for ii=1:ng
    wg(:,:,ii)=n0(ii)*exp(-((X-cr(ii,1)).^2+(Y-cr(ii,2)).^2)/(2*sig(ii)^2));
end
wg=normalize(wg);