run ../matconvnet/matlab/vl_setupnn ;
addpath ../matconvnet/examples ;


varargin=cell(1,2);
varargin(1,1)={'train'};
varargin(1,2)={struct('gpus', 1)};

opts.expDir = '../exp/' ;
opts.dataDir = '../exp/dataset/';
opts.boxannDir = '../exp/boxann/';
opts.resDir = '../exp/result/BoxMat/';
[opts, varargin] = vl_argparse(opts, varargin);
display=false;
fol_name = 'execution';
[config]=config_list(fol_name);

while true
    result=CREST_tracking(opts,varargin,config,display);

    % post process
    % write box into txt
    bbox = result(2, :);
    cur_txt_name = 'cur_box.txt';
    fid = fopen(['../exp/dataset/execution/ann/', cur_txt_name], 'w');
    fprintf(fid,'%i %i %i %i',bbox(1), bbox(2),  bbox(3),  bbox(4)); 
    fprintf(fid,'\r\n');
    fclose(fid);
    % delete file
    delete('../exp/dataset/execution/img/2.png');

end





