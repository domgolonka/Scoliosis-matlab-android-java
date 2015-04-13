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
  
    
    %% Receiving image and coordinates
    stInfo.clientConnection.receiveData();
    stInfo.clientConnection.createImage();
    %% capture coordinates for file
    stInfo.clientConnection.receiveData();
    data = stInfo.clientConnection.getCoordinates();
    
    fileID = fopen('coordinates.txt','w');
    mdata = char(data);
    fprintf(fileID,mdata);
    fclose(fileID);
    
    %% Processing Image
    
    Cobbs;
    %pause(4);
    
    %% Sending Image
    fprintf('...Converting Image\n');
    stInfo.clientConnection.convertPicToByte();

    %send picture to android
    stInfo.clientConnection.sendPicture();
    fprintf('...FINISHED\n');
%catch
    fprintf('...FAIL\n');
%end
end