clc
clear all
close all
warning off;
c=webcam;
load myNet2;
faceDetector=vision.CascadeObjectDetector;
while true
    e=c.snapshot;
    bboxes =step(faceDetector,e);
    if(sum(sum(bboxes))~=0)
     es=imcrop(e,bboxes(1,:));
    es=imresize(es,[227 227]);
    label=classify(myNet2,es);
    image(e);
    title(char(label));
    drawnow;
    else
        image(e);
        title('No Face Detected');
    end
end