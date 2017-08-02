function res = dissertest(vNum, frames, ds)
    ds = RGB;
    fn = strcat('logs2/v',num2str(vNum),'.mat');
    load(fn);
    if ds == 1
        ds = HSV;
    end
    %axis square
    %rotate3d on
    N = frames; % we will take 9 frames as a fixed.
    [idx, cl] = kmeans(ds,N);
    F = [];
    for j = 1:N 
        A = find(idx == j);
        cluster_points = ds(A(:),:);
        %get the closest from cluster point in cl(j)
        d = inf;
        cclust = cl(j,:);
        for p = 1:size(cluster_points,1)
            pc = cluster_points(p,:);
            dist = sqrt((pc(1)-cclust(1))^2+(pc(2)-cclust(2))^2+(pc(3)-cclust(3))^2);
            if (dist < d)
                d = dist;
                sl = pc;
            end
        end
       Fr = find(ismember(ds,sl),1);
       F = [F; Fr];
    end
    res = ds(F,:);
end


    


    
