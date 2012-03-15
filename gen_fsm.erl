-module().
-behavior(gen_fsm).

%%%%%%%%%%%%%%%%%%%%
%%% External API %%%
%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% gen_fsm API and callbacks %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
-export([start_link/N]).
-export([init/1, handle_event/3, handle_sync_event/4, handle_info/3, 
		terminate/3, code_change/4]).

%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% internal fsm state %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
-record(state,{}).

%%%%%%%%%%%%%%%%%%%%%%
%%% gen_fsm states %%%
%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%
%%% Macros %%%
%%%%%%%%%%%%%%
-define(NOW,0).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% gen_fsm API and callback definitions %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
start_link() ->
	gen_fsm:start_link({local,?MODULE},?MODULE,[],[]).

init([]) ->
	InitialState = #state{},
	{ok, connecting, InitialState, ?NOW}.

handle_event(_Event, StateName, StateData) ->
	{next_state, StateName, StateData}.

handle_sync_event(_Event, _From, StateName, StateData) ->
	{reply, ok, StateName, StateData}.

handle_info(_Info, StateName, StateData) ->
	{next_state, StateName, StateData}.

terminate(_Reason, _StateName, _StateData) ->
	ok.

code_change(_Vsn, StateName, StateData, _Extra) ->
	{ok, StateName, StateData}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% gen_fsm state definitions %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%