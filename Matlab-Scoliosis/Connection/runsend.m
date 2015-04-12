function runsend()
evalin('base', 'close all;clc;');

profile on;
run_send();
profile off;
end

function run_send()
%try
    %% start server
    stInfo = load('clientConnection');
    sendPicture(stInfo);
   
    
    %fprintf('...OK\n');
%catch
    %fprintf('...FAIL\n');
%end
end