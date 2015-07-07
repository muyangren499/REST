%%

matrix = randn(64);

%%
for it = 1:5000;
%%
tic
[V,D] = eig(matrix*matrix');
orth1 = V/sqrt(D)*V' * matrix;
time_eig(it) = toc;

%%

tic
orth2 = sqrtm(matrix*matrix')\matrix;
time_sqrtm(it) = toc;

%%

tic
[Q,R] = qr(A);
orth3 = Q*diag(sign(diag(R)));
time_qr(it) = toc;

%%

tic
[U,S,V] = svd(A);
orth4 = U*V';
time_svd(it) = toc;
end

%%
figure
errorbar(mean([time_eig' time_sqrtm' time_qr' time_svd']),std([time_eig' time_sqrtm' time_qr' time_svd']))