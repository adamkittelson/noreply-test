-module(bad_server).
-behaviour(gen_server).
-export([start_link/3, init/1, boom/1, handle_cast/2]).

start_link(Name, Args, Opts) -> gen_server:start_link(Name, ?MODULE, Args, Opts).

init(State) -> {ok, State}.

boom(Pid) -> gen_server:cast(Pid, boom).

handle_cast(boom, State) ->
  {noreply, State, oops_this_shouldnt_be_here_or_should_at_least_be_an_integer}.
