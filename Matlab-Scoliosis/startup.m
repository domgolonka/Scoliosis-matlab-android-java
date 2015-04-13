function startup()
% Starting up matlab as indicated here http://www.mathworks.com/help/matlab/ref/startup.html

%% add jar file (Comment out the same line in ServerStart in connection)
javaaddpath(fullfile(pwd, 'Connection', 'JavaConnection.jar'), '-end');
clear java

%% add Connection Scripts
addpath(fullfile(pwd, 'Connection'));
%% this will receive picture + coordinates
run


end