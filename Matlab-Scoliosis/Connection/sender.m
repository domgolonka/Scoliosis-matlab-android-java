function sender(hSupporter, sOption)


if nargin < 1
    error('empty argument');
elseif nargin < 2
    error('invalid arguments: option cannot be empty');
end

%% check supporter
if ~isequal(class(hSupporter), ...
    'main.ServerSupport')
    error('invalid supporter');
end

%% check option and send command
switch sOption
    case '-login'
        hSupporter.send(utils.Commands.LOGIN);
    otherwise
        error('invalid option: %s', sOption);
end

end