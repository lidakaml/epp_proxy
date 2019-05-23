-module(epp_util).

-export([create_map/1, create_session_id/1]).

% Give me a process id, I'll create a random map for you.
-spec create_map(pid()) -> #{string() => pid(), string() => float(),
                             string() => string()}.
create_map(Pid) when is_pid(Pid) ->
    Now = erlang:system_time(second),
    #{"pid" => Pid, "random" => rand:uniform(),
      "timestamp" => calendar:system_time_to_rfc3339(Now)}.

%% Given the special data structure, return back a binary hash to pass to the
%% application server.
-spec create_session_id(#{string() => pid(), string() => float(),
                          string() => string()}) -> binary().
create_session_id(#{"pid" := Pid, "random" := Random, "timestamp" := Timestamp}) ->
    Map = #{"pid" => pid_to_list(Pid), "random" => float_to_list(Random),
            "timestamp" => Timestamp},
    ListOfTuples = maps:to_list(Map),
    ListOfLists = [[X, ",", Y] || {X, Y} <- ListOfTuples],
    NestedList = lists:join(",",ListOfLists),
    ListOfGlyphs = lists:flatten(NestedList),
    crypto:hash(sha512, ListOfGlyphs).