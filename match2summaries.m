function [F,number_of_matches] = match2summaries(A,B,threshold)
% Written by Ludmilla Kuncheva
% Note: A is candidate summary, B is ground truth

% Pair the frames to calculate the number of matches
M = pdist2(A,B);

% Greedy matching algorithm
number_of_matches = 0;
dmin = min(M(:)); % minimum distance at joining
while dmin < threshold
    [x,y] = find(M == dmin); % find the match
    number_of_matches = number_of_matches + 1;
    M(x(1),:) = inf;
    M(:,y(1)) = inf;
    dmin = min(M(:));
end

if number_of_matches
    Recall = number_of_matches/size(A,1);
    Precision = number_of_matches/size(B,1);
    F = 2 * Precision * Recall / (Precision + Recall);
else
    F = 0;
end
