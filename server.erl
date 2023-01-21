-module(server).
-import(string,[substr/3]).
-import(string,[equal/2]).
-compile(export_all).

start(N_Zero , N_Nodes) ->
    Prefix_Zero = lists:concat(lists:duplicate(N_Zero, "0")),
    io:fwrite("Prefix zeros required for the bitcoins -> ~p n", [N_Zero]),
    spawn_nodes(N_Nodes, Prefix_Zero, node(), self()),
    register(server, self()),
    statistics(runtime),
    {Time, _} = timer:tc(server, server, [0, N_Nodes, Prefix_Zero]),
    {_, Time_CPU_Since_Last_Call} = statistics(runtime),
    io:fwrite("Real time elapsed(RunTime): ~p\nTotal time taken by the CPU: ~p\n CPU-Time / RunTime: ~p\n", [Time/1000, Time_CPU_Since_Last_Call, Time_CPU_Since_Last_Call/(Time/1000)]).

server(200, _, _) ->
    ok;
server(Coins_Found, N_Nodes, Prefix_Zero) ->
    receive
        {Created_Hash, Arbitrary_String, Finder} ->
            io:fwrite("Total coins found so far: ~p \n Mined Coin ->  ~p & Hash value for the found bitcoin -> ~p \n Process Id -> ~p\n\n", [Coins_Found+1, Arbitrary_String, Created_Hash, Finder]),
            Finder ! {mine},
            server(Coins_Found+1, N_Nodes, Prefix_Zero);
        {node, Node} ->
            io:fwrite("New Node entering the system ~p spawned actor \n \n", [Node]),
            transmit_code(Node),
            spawn(server, spawn_nodes, [N_Nodes, Prefix_Zero, Node, self()]),
            server(Coins_Found, N_Nodes, Prefix_Zero)
    end.

coins_mined(Prefix_Zero, Parent) ->
    Arbitrary_String = arbitrary_string_generator(),
    Created_Hash = hash_generator(Arbitrary_String),
    BitCoin = equal(Prefix_Zero,substr(Created_Hash,1,string:length(Prefix_Zero))),
    if BitCoin == true ->
        Parent ! {Created_Hash, Arbitrary_String, self()},
        receive
            {mine} -> coins_mined(Prefix_Zero, Parent)
        after
            10000 -> ok
        end;
        true -> coins_mined(Prefix_Zero, Parent)
    end.

hash_generator(Arbitrary_String) ->
    Created_Hash = io_lib:format("~64.16.0b", [binary:decode_unsigned(crypto:hash(sha256, Arbitrary_String))]),
    Created_Hash.

arbitrary_string_generator() ->
    Base64_string = base64:encode(crypto:strong_rand_bytes(8)),
    Gen_string = binary_to_list(Base64_string),
    Final_string = string:join(["srishti.jaiswal", Gen_string], ";"),
    Final_string.


transmit_code(Node) ->
    {Mod, Bin, File} = code:get_object_code(server),
    rpc:multicall([Node], code, load_binary, [Mod, File, Bin]),
    ok.

spawn_nodes(0, _, _, _) ->
    ok;
spawn_nodes(N, Prefix_Zero, Node, Parent) ->
    spawn(Node, server, coins_mined, [Prefix_Zero, Parent]),
    spawn_nodes(N - 1, Prefix_Zero, Node, Parent).





