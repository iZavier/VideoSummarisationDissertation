function [res,F] = uniformsampling(ds,K)
    % split the frames into k blocks 
    % select the last frame from each block.
    F = [];
    noF = size(ds,1);
    spl = round(noF / K);
    for i = 1:spl:noF
        F = [F; i];
    end
    F(1) = [];
    res = ds(F,:);
end

