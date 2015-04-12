function stInfo = ServerStart(Port)

%
% To use run ServerStart [PORT]
% [PORT] is the port for the localhost
%
%javaaddpath(fullfile(pwd, 'Connection', 'JavaConnection.jar'), '-end');
%clear java
%import main.*
%import utils.*
%methods('ServerSupport')
%methods('Sender')

%% checkout input argument
if nargin < 1
error('empty argument');
end

%display(sprintf('Start server. IP: %s, Port: %d ', char(java.net.Inet4Address.getLocalHost.getHostAddress), Port));

%% initiate
stInfo = struct('clientSupp', '', 'IPAddress', '', 'clientPort', '');         
stInfo.clientConnection = getPort(Port);
%% find the client using the Java function findClient() and listen the testing action from client
stInfo.clientConnection.findClient();

%% listen client response
fprintf('listening client...');
[stInfo.IPAddress, stInfo.clientPort] = clientAddress(stInfo.clientConnection);
fprintf('OK\nClient IP: %s, Port: %d\n', stInfo.IPAddress, stInfo.clientPort);
% save variable to work space
save('clientConnection', stInfo);
%% send login command
sender(stInfo.clientConnection, '-login');

return;
end