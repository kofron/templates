-module().

-behaviour(gen_server).

%%%%%%%%%%%
%%% API %%%
%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% gen_server api and callbacks %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-export([start_link/0]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
         terminate/2, code_change/3]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% internal server state %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-record(state, {}).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% gen_server API and callback definitions %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
start_link() ->
  gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

init([]) ->
  {ok, #state{}}.

handle_call(_Request, _From, State) ->
  Reply = ok,
  {reply, Reply, State}.

handle_cast(_Msg, State) ->
  {noreply, State}.

handle_info(_Info, State) ->
  {noreply, State}.

terminate(_Reason, _State) ->
  ok.

code_change(_OldVsn, State, _Extra) ->
  {ok, State}.

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% internal functions %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%