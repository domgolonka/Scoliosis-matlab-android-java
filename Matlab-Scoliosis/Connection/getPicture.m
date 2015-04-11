function picture = getPicture(clientConnection)


%% check supporter
if ~isequal(class(clientConnection), ...
    'main.ServerSupport')
    error('invalid supporter');
end

%% receive picture height and width
clientConnection.receiveData();
imagewidth = clientConnection.getSize();
clientConnection.receiveData();
imageheight = clientConnection.getSize();
%% receive picture data and convert data to rgb
clientConnection.receiveData()
clientConnection.adaptByteToRGB();

disp(imagewidth);
disp(imageheight);
%% get R, G, B submatrix
dataR = clientConnection.getR();
dataG = clientConnection.getG();
dataB = clientConnection.getB();

R = zeros(imagewidth, imageheight);
G = zeros(imagewidth, imageheight);
B = zeros(imagewidth, imageheight);
for i = 1:imagewidth
    R(i, :) = dataR((imageheight * (i - 1) + 1):(imageheight*i));
    G(i, :) = dataG((imageheight * (i - 1) + 1):(imageheight*i));
    B(i, :) = dataB((imageheight * (i - 1) + 1):(imageheight*i));
end

%% make RGB picture
picture(:, :, 1) = R./255;
picture(:, :, 2) = G./255;
picture(:, :, 3) = B./255;
imwrite(picture,'USETHISIMAGE.jpg')
return;
end