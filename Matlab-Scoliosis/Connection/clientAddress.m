function [sIPAddress, nPort] = clientAddress(hSupporter)
%% check if arguements are not empty
if nargin < 1
    error('empty argument');
end

%% check supporter
if ~isequal(class(hSupporter), ...
    'main.ServerSupport')
    error('invalid supporter');
end

%% receive get client address and port
hSupporter.receiveClientAddress();
sIPAddress = char(hSupporter.getClientIpAddress());
nPort = hSupporter.getClientPort();

return;
end