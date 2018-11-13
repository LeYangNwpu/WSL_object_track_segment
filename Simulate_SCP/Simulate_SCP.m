
img_file = './temp/frame_t.png';

% a bug here, how to exit?
while true
    if ~exist(img_file, 'file')
        execution();
    end
    pause(0.1);
end


% copy data
function execution()
    img_rp = './temp/image/';
    mask_rp = './temp/mask/';
    img_set = dir([img_rp, '*.png']);
    num_img = length(img_set);
    
    t = randi([2, num_img], 1);
    cur_name = img_set(t).name;
    copyfile([img_rp, cur_name], ['./temp/', 'frame_t.png']);
    former_name = img_set(t-1).name;
    copyfile([img_rp, former_name], ['./temp/', 'frame_t_1.png']);
    % former object box
    mask = imread([mask_rp, former_name]);
    bbox = BoundingBox(mask);
    former_txt_name = 'box_t_1.txt';
    fid = fopen(['./temp/', former_txt_name], 'w');
    fprintf(fid,'%i %i %i %i',bbox(1), bbox(2),  bbox(3),  bbox(4)); 
    fprintf(fid,'\r\n');
    fclose(fid);
    fprintf('generate datas for indice %i\r\n', t);
end

% % copy data
% function indice_txt = execution()
%     t = randi([2, num_img], 1);
%     cur_name = img_set(t).name;
%     copyfile([img_rp, cur_name], ['./temp/', 'frame_t.png']);
%     former_name = img_set(t-1).name;
%     copyfile([img_rp, former_name], ['./temp/', 'frame_t_1.png']);
%     % former object box
%     mask = imread([mask_rp, former_name]);
%     bbox = BoundingBox(mask);
%     former_txt_name = 'box_t_1.txt';
%     fid = fopen(['./temp/', former_txt_name], 'w');
%     fprintf(fid,'%i %i %i %i',bbox(1), bbox(2),  bbox(3),  bbox(4)); 
%     fprintf(fid,'\r\n');
%     fclose(fid);
%     % save a txt file to indicate frame indice
%     indice_txt = [num2str(t), '.txt'];
%     fid = fopen(['./temp/', indice_txt], 'w');
%     fclose(fid);
% end
