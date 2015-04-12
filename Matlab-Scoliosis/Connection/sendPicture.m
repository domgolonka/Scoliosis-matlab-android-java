function sendPicture(clientConnection)

%% check client connection
if ~isequal(class(clientConnection), ...
    'main.ServerSupport')
    error('invalid supporter');
end

%file name
filename = pwd + 'Cobb.jpg';

%convert picture to byte array
clientConnection.convertPicToByte(filename);

%send picture to android
clientConnection.sendPicture();

end