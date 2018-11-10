function makeIms
%this function shows how to store, display and interactively select 
%sequential image data. It uses the FancyFlowPlayer.
writeVid = VideoWriter('test','Archival');
open(writeVid);
nofIms = 100;

im = rand(300)-0.5;
filt = ones(3)/(3^2);

for ii = 1:nofIms
%     make sure that the image saved is uint8, and in the range [0, 255]. 
    writeVideo(writeVid,     uint8((im+0.5)*256)     );

    %the iterative modification:
    im = conv2(im,filt,'same');
end

close(writeVid);

%This has created the video file "test.mj2". To play this vid, either run
%FancyFlowPlayer without args, and select the file in the GUI that pops up,
%or do the following:
[fr,~,im] = FancyFlowPlayer('test.mj2');
imagesc(im); colormap gray;
title(['frame nr:' num2str(fr) ' selected on shutdown']);