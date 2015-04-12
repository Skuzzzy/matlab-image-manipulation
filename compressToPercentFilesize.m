function [ ] = compressToPercentFilesize( pathToFile , percent )
[m, n, s] = size(imread(pathToFile));
k = ceil((percent*(m*n))/(1+m+n));
rankNapproximation( pathToFile, k)
end
