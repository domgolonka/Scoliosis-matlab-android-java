function runsend(clientConnection)
evalin('base', 'close all;clc;');

profile on;
run_send(clientConnection);
profile off;
end

function run_send(clientConnection)
%try
    %% start server
    fprintf('...Sending processed image back to android\n');
    sendPicture(clientConnection);
   
    
    %fprintf('...OK\n');
%catch
    %fprintf('...FAIL\n');
%end
end