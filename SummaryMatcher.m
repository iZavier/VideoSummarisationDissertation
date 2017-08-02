clc, clear all, close
R = zeros(50,5);
M = zeros(50,5);
for i = 1:50
    vt = strcat('Summaries/results',num2str(i+20),'.mat');
    load(vt);
    RGBRes = dissertest(i+20, 9);
    [R(i,1),M(i,1)] = match_2_summaries(RGBRes, u1results, 0.5);
    [R(i,2),M(i,2)] = match_2_summaries(RGBRes, u2results, 0.5);
    [R(i,3),M(i,3)] = match_2_summaries(RGBRes, u3results, 0.5);
    [R(i,4),M(i,4)] = match_2_summaries(RGBRes, u4results, 0.5);
    [R(i,5),M(i,5)] = match_2_summaries(RGBRes, u5results, 0.5);
    cVars = {'u1results','u2results','u3results', 'u4results', 'u5results'};
    clear(cVars{:});
end
R