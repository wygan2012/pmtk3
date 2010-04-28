function X = ppcaSample(N,  W, mu, sigma2, evals, evecs)

[d,K] = size(W);
U = evecs(:,1:K);
Lam = diag(evals(1:K));
C = U*(Lam-sigma2*eye(K))*U' + sigma2*eye(d);
%assert(approxeq(C, W*W' + sigma2*eye(d)))
model.mu = mu; model.Sigma = C;
X = gaussSample(model, N);

end