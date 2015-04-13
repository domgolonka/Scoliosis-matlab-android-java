function run()
evalin('base', 'close all;clc;');

profile on;
run_start();
profile off;
end

function run_start()
%try
    %% start server
    stInfo = ServerStart(6999, 1);
   
    % capture RGB picture
    %stOption = struct('sFormat','bShow', true);
    
    %getPicture(stInfo.clientConnection);
    
    %% Receiving image and coordinates
    stInfo.clientConnection.receiveData();
    stInfo.clientConnection.createImage();
    % capture coordinates fileen
    stInfo.clientConnection.receiveData();
    data = stInfo.clientConnection.getCoordinates();
    
    fileID = fopen('coordinates.txt','w');
    mdata = char(data);
    fprintf(fileID,mdata);
    fclose(fileID);
    
    %% Processing Image
    
    Cobbs;
    
    %% Sending Image
    fprintf('...Converting Image\n');
    stInfo.clientConnection.convertPicToByte();

    %send picture to android
    stInfo.clientConnection.sendPicture();
    
%catch
    %fprintf('...FAIL\n');
%end
end