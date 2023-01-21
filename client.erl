-module(client).
-export([start/1]).

start(Node_Server)->
    net_adm:ping(Node_Server),
    io:fwrite("Connection request sent to server."),
    {server, Node_Server} ! {node, node()}.