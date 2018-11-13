function uploadfile()

HOSTNAME = '10.68.0.12';
USERNAME = 'yangle';
PASSWORD = '3831';

scp_simple_put(HOSTNAME,USERNAME,PASSWORD,{'1.jpg','2.jpg'}, '/disk5/yangle/TCL/code/tracker/CREST/exp/dataset/execution/img/', './temp/image/');
scp_simple_put(HOSTNAME,USERNAME,PASSWORD, 'groundtruth_rect.txt', '/disk5/yangle/TCL/code/tracker/CREST/exp/dataset/execution/', './temp/res/');

end

