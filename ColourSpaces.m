clc, close all, clear all
d = dir('database/*.mpg');
for i = 1:size(d,1)
    fn = d(i).name; % assume folder is in path
    V = VideoReader(fn);
    RGB = [];
    HSV = [];
    CMYK = [];
    while hasFrame(V)
        vf = readFrame(V);
        hsv = rgb2hsv(vf); 

        h = mean2(hsv(:,:,1)); 
        s = mean2(hsv(:,:,2)); 
        v = mean2(hsv(:,:,3));
        
        r = mean2(vf(:,:,1));
        g = mean2(vf(:,:,2));
        b = mean2(vf(:,:,3));
        
        black = min(255 - r, 255 - g, 255 - b);
        cyan = (255 - r - black) / (255 - black);
        magenta = (255 - g - black)/(255 - black);
        yellow = (255 - b - black)/(255 - black);
        
        HSV = [HSV; [h s v]];
        RGB = [RGB; [r g b]];
        CMYK = [CMYK; [cyan mangenta yellow black]];      
    end
    fn = strrep(fn, '.mpg', '');
    nfn = strcat('Logs/', fn, '.mat');
    save(nfn,'RGB', 'HSV', 'CMYK');
end