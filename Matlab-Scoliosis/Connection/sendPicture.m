function sendPicture(clientConnection)

%% check supporter
if ~isequal(class(clientConnection), ...
    'main.ServerSupport')
    error('invalid supporter');
end

%convert picture to byte array
fprintf('...Converting Image\n');
clientConnection.convertPicToByte();

%send picture to android
clientConnection.sendPicture();

end