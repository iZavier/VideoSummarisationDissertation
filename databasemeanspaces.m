clc, close all, clear all
% This script was used to extract RGB and HSV features
% from each of the 50 videos and store them in a .mat file.
d = dir('database/*.mpg');
for i = 1:size(d,1)
    fn = d(i).name; % assume folder is in path
    V = VideoReader(fn);
    RGB = [];
    HSV = [];
    while hasFrame(V)
        vf = readFrame(V);
        hsv = rgb2hsv(vf); 

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
    nfn = strcat('Logs/', fn, '.mat');
    save(nfn,'RGB', 'HSV');
end