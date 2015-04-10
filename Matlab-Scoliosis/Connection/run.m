function run()
evalin('base', 'close all;clc;');

profile on;
run_start();
profile off;
end

function run_start()
%try
    %% start server
    stInfo = ServerStart(6999);
   
    % capture RGB picture
    %stOption = struct('sFormat','bShow', true);
    getPicture(stInfo.clientConnection);
    
    % capture coordinates file
    stInfo.clientConnection.receiveData();
    data = stInfo.clientConnection.getCoordinates();
    
    fileID = fopen('coordinates.txt','w');
    mdata = char(data);
    fprintf(fileID,mdata);
    fclose(fileID);
    
    %fprintf('...OK\n');
%catch
    %fprintf('...FAIL\n');
%end
end