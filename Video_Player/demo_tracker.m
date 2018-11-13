function cur_box = demo_tracker(video_object, fr)

form_fr = fr - 1;
form_frame = read(video_object, form_fr);
cur_frame = read(video_object, fr);
txt_name = [num2str(form_fr), '.txt'];
former_box = load(['./temp/ann/', txt_name]);

cur_box = track(form_frame, cur_frame, former_box);

% write box information to txt file
cur_txt_name = [num2str(fr), '.txt'];
fid = fopen(['./temp/ann/', cur_txt_name], 'w');
fprintf(fid,'%i %i %i %i',cur_box(1), cur_box(2),  cur_box(3),  cur_box(4)); 
fprintf(fid,'\r\n');
fclose(fid);

end


function cur_box = track(form_frame, cur_frame, former_box)
[hei, wid, ~] = size(cur_frame);
scale = unifrnd(0.2, 0.8);
cur_wid = floor(wid * scale);
scale = unifrnd(0.2, 0.8);
cur_hei = floor(hei * scale);
x_min = randi([1, wid-cur_wid], 1);
y_min = randi([1, hei-cur_hei]);

cur_box = [x_min, y_min, cur_wid, cur_hei];

end
