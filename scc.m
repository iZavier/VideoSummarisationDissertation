function [res,F] = scc(ds, threshold)
    F = [1]; % the first frame is usually part of the set
    diff = ds(1,:);
    for i = 2:size(ds,1)
        %higher threshold leads to less frames
        if (sum(abs(ds(i, :) - diff)) >= threshold)
            diff = ds(i, :);
            F = [F; i];   
        end
    end
    res = ds(F,:);
end