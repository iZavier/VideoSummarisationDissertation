clc, close all, clear
% This script will extract extract RGB and HSV features from 
% each of the user summaries for each video.
u1results = [];
u2results = [];
u3results = [];
u4results = [];
u5results = [];
for i = 21:1:70
    u1 = strcat('UserSummary/v',num2str(i),'/user1/*.jpeg');
    d1 = dir(u1);
    u2 = strcat('UserSummary/v',num2str(i),'/user2/*.jpeg');
    d2 = dir(u2);
    u3 = strcat('UserSummary/v',num2str(i),'/user3/*.jpeg');
    d3 = dir(u3);
    u4 = strcat('UserSummary/v',num2str(i),'/user4/*.jpeg');
    d4 = dir(u4);
    u5 = strcat('UserSummary/v',num2str(i),'/user5/*.jpeg');
    d5 = dir(u5);
    for x = 1:size(d1,1)
        n = strcat('UserSummary/v',num2str(i),'/user1/',d1(x).name);
        vf = imread(n);
        hsv = rgb2hsv(vf); 
        h = mean2(hsv(:,:,1)); 
        s = mean2(hsv(:,:,2)); 
        v = mean2(hsv(:,:,3));

        r = mean2(vf(:,:,1));
        g = mean2(vf(:,:,2));
        b = mean2(vf(:,:,3));
        u1results = [u1results; [r g b h s v]];
    end
    for x = 1:size(d2,1)
        n = strcat('UserSummary/v',num2str(i),'/user2/',d2(x).name);
        vf = imread(n);
        hsv = rgb2hsv(vf); 
        h = mean2(hsv(:,:,1)); 
        s = mean2(hsv(:,:,2)); 
        v = mean2(hsv(:,:,3));

        r = mean2(vf(:,:,1));
        g = mean2(vf(:,:,2));
        b = mean2(vf(:,:,3));
        u2results = [u2results; [r g b h s v]];
    end    
    for x = 1:size(d3,1)
        n = strcat('UserSummary/v',num2str(i),'/user3/',d3(x).name);
        vf = imread(n);
        hsv = rgb2hsv(vf); 
        h = mean2(hsv(:,:,1)); 
        s = mean2(hsv(:,:,2)); 
        v = mean2(hsv(:,:,3));

        r = mean2(vf(:,:,1));
        g = mean2(vf(:,:,2));
        b = mean2(vf(:,:,3));
        u3results = [u3results; [r g b h s v]];
    end        
    for x = 1:size(d4,1)
        n = strcat('UserSummary/v',num2str(i),'/user4/',d4(x).name);
        vf = imread(n);
        hsv = rgb2hsv(vf); 
        h = mean2(hsv(:,:,1)); 
        s = mean2(hsv(:,:,2)); 
        v = mean2(hsv(:,:,3));

        r = mean2(vf(:,:,1));
        g = mean2(vf(:,:,2));
        b = mean2(vf(:,:,3));
        u4results = [u4results; [r g b h s v]];
    end    
    for x = 1:size(d5,1)
        n = strcat('UserSummary/v',num2str(i),'/user5/',d5(x).name);
        vf = imread(n);
        hsv = rgb2hsv(vf); 
        h = mean2(hsv(:,:,1)); 
        s = mean2(hsv(:,:,2)); 
        v = mean2(hsv(:,:,3));

        r = mean2(vf(:,:,1));
        g = mean2(vf(:,:,2));
        b = mean2(vf(:,:,3));
        u5results = [u5results; [r g b h s v]];
    end  
    lbl = strcat('Summaries/results',num2str(i),'.mat');
    save(lbl,'u1results','u2results','u3results','u4results', ...
    'u5results');
    u1results = [];
    u2results = [];
    u3results = [];
    u4results = [];
    u5results = [];
end

pp = u1results(:,4) == 21;
u1results(pp,1:3)
