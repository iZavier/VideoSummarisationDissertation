clc, close all, clear all
fn = 'videos/v24.mpg'; % The video we want to extract features from.
V = VideoReader(fn);
RGB = [];
HSV = [];
c = 1;
while hasFrame(V)
    vf = readFrame(V);
    vFrames(c).cdata = vf; % Store each frame into a matrix.
    c = c + 1;
    hsv = rgb2hsv(vf); 
    % Extract the features from each frame and store them.
    h = mean2(hsv(:,:,1)); 
    s = mean2(hsv(:,:,2)); 
    v = mean2(hsv(:,:,3));
    r = mean2(vf(:,:,1));
    g = mean2(vf(:,:,2));
    b = mean2(vf(:,:,3));
    HSV = [HSV; [h s v]];
    RGB = [RGB; [r g b]];
    
end
fn = strrep(fn, '.mpg', '');
fn = strrep(fn, 'videos/', '');
saveLoc = strcat('summary/', fn, '');
mkdir(saveLoc); % create a save directory
%Can perform summaries of videos 
[res1,F1] = kmeansum(9, HSV); 
[res2,F2] = scc(HSV, 0.15);
[res3,F3] = uniformsampling(HSV,9);

frames1 = sort(F1); % k-means requires sorting of resulting frames.
% Write the frames to a folder.
for i = 1:size(F1,1)
    imwrite(vFrames(frames1(i)).cdata, ...
        fullfile(saveLoc, ['kmeans', num2str(i), '.png']));
end
for i = 1:size(F2,1)
    imwrite(vFrames(F2(i)).cdata, ...
        fullfile(saveLoc, ['scc', num2str(i), '.png']));
end
for i = 1:size(F3,1)
    imwrite(vFrames(frames3(i)).cdata, ...
        fullfile(saveLoc, ['uni', num2str(i), '.png']));
end



