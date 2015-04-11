function [] = rankNapproximation( fileName , n ) 

file = imread(fileName);
modified_file = zeros(size(file));

% Red
red = double(file(:,:,1));
red = red/256;
[U, S, V] = svd(red);
red_rankN = 0;
for i = 1:n
    red_rankN = red_rankN + S(i,i)*U(:,i)*V(:,i)';
end
modified_file(:,:,1) = red_rankN;

% Blue
blue = double(file(:,:,2));
blue = blue/256;
[U, S, V] = svd(blue);
blue_rankN = 0;
for i = 1:n
    blue_rankN = blue_rankN + S(i,i)*U(:,i)*V(:,i)';
end
modified_file(:,:,2) = blue_rankN;

% Green
green = double(file(:,:,3));
green = green/256;
[U, S, V] = svd(green);
green_rankN = 0;
for i = 1:n
    green_rankN = green_rankN + S(i,i)*U(:,i)*V(:,i)';
end
modified_file(:,:,3) = green_rankN;

modified_file = max(0,min(1,modified_file));

image(modified_file)
end

