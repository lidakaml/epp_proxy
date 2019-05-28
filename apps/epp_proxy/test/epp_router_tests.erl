-module(epp_router_tests).

-include_lib("eunit/include/eunit.hrl").

is_valid_epp_command_test() ->
    Commands = ["hello", "login", "logout", "check", "info", "poll",
               "create", "delete", "renew", "update", "transfer"],
    lists:foreach(fun (N) ->
                          ?assert(epp_router:is_valid_epp_command(N))
                  end,
                  Commands).

request_method_test() ->
    ?assertEqual(get, epp_router:request_method("hello")),
    ?assertEqual(get, epp_router:request_method(<<"hello">>)),
    ?assertEqual(post, epp_router:request_method("create")),
    ?assertEqual(post, epp_router:request_method(123)).

%% TODO: Make less verbose and repetitive
hello_url_test() ->
    ?assertEqual("https://registry.test/epp/session/hello", epp_router:route_request("hello")),
    ?assertEqual("https://registry.test/epp/session/hello", epp_router:route_request(<<"hello">>)).

login_url_test() ->
    ?assertEqual("https://registry.test/epp/session/login", epp_router:route_request("login")),
    ?assertEqual("https://registry.test/epp/session/login", epp_router:route_request(<<"login">>)).

logout_url_test() ->
    ?assertEqual("https://registry.test/epp/session/logout", epp_router:route_request("logout")),
    ?assertEqual("https://registry.test/epp/session/logout", epp_router:route_request(<<"logout">>)).

check_url_test() ->
    ?assertEqual("https://registry.test/epp/command/check", epp_router:route_request("check")),
    ?assertEqual("https://registry.test/epp/command/check", epp_router:route_request(<<"check">>)).

info_url_test() ->
    ?assertEqual("https://registry.test/epp/command/info", epp_router:route_request("info")),
    ?assertEqual("https://registry.test/epp/command/info", epp_router:route_request(<<"info">>)).

poll_url_test() ->
    ?assertEqual("https://registry.test/epp/command/poll", epp_router:route_request("poll")),
    ?assertEqual("https://registry.test/epp/command/poll", epp_router:route_request(<<"poll">>)).

create_url_test() ->
    ?assertEqual("https://registry.test/epp/command/create", epp_router:route_request("create")),
    ?assertEqual("https://registry.test/epp/command/create", epp_router:route_request(<<"create">>)).

delete_url_test() ->
    ?assertEqual("https://registry.test/epp/command/delete", epp_router:route_request("delete")),
    ?assertEqual("https://registry.test/epp/command/delete", epp_router:route_request(<<"delete">>)).

renew_url_test() ->
    ?assertEqual("https://registry.test/epp/command/renew", epp_router:route_request("renew")),
    ?assertEqual("https://registry.test/epp/command/renew", epp_router:route_request(<<"renew">>)).

update_url_test() ->
    ?assertEqual("https://registry.test/epp/command/update", epp_router:route_request("update")),
    ?assertEqual("https://registry.test/epp/command/update", epp_router:route_request(<<"update">>)).

transfer_url_test() ->
    ?assertEqual("https://registry.test/epp/command/transfer", epp_router:route_request("transfer")),
    ?assertEqual("https://registry.test/epp/command/transfer", epp_router:route_request(<<"transfer">>)).