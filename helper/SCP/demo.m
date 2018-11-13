addpath('./utils/');

HOSTNAME = '10.68.0.12';
USERNAME = 'yangle';
PASSWORD = '3831';

scp_simple_get(HOSTNAME,USERNAME,PASSWORD,'/disk5/yangle/TCL/code/tracker/filetodownload.txt');
copyfile('filetodownload.txt', 'filetoupload.txt');
scp_simple_put(HOSTNAME,USERNAME,PASSWORD,'filetoupload.txt', '/disk5/yangle/TCL/code/tracker/');

