function downloadfile()

HOSTNAME = '10.68.0.12';
USERNAME = 'yangle';
PASSWORD = '3831';

scp_simple_get(HOSTNAME,USERNAME,PASSWORD, 'cur_box.txt','./temp/ann/','/disk5/yangle/TCL/code/tracker/CREST/exp/dataset/execution/ann/');

end

