clc, clear all, close
% This script is used to compare the proposed method with that 
% of each user summary.
R = zeros(50,5);
M = zeros(50,5);
for k = 21:1:70
    vt = strcat('Summaries/results',num2str(k),'.mat');
    lt = strcat('Logs/v',num2str(k),'.mat');
    load(vt);
    load(lt);
    [res1,F1] = kmeansum(9, RGB);
    i = k - 20;
    % The threshold is set to 20 for RGB
    % A value between 0 and 1 for HSV.
    % 1:3 represents RGB and 4:6 should be used for HSV.
    [R(i,1),M(i,1)] = match_2_summaries(res1, u1results(:,1:3), 20); 
    [R(i,2),M(i,2)] = match_2_summaries(res1, u2results(:,1:3), 20);
    [R(i,3),M(i,3)] = match_2_summaries(res1, u3results(:,1:3), 20);
    [R(i,4),M(i,4)] = match_2_summaries(res1, u4results(:,1:3), 20);
    [R(i,5),M(i,5)] = match_2_summaries(res1, u5results(:,1:3), 20);
    cVars = {'u1results','u2results','u3results', 'u4results', ...
    'u5results', 'RGB', 'HSV'};
    clear(cVars{:});
end
R % display our resulting matrix of f-measure values