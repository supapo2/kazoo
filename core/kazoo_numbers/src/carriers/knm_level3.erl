%%%-----------------------------------------------------------------------------
%%% @copyright (C) 2015-2020, 2600Hz
%%% @doc Handle client requests for phone number
%%% @end
%%%-----------------------------------------------------------------------------
-module(knm_level3).
-behaviour(knm_gen_carrier).

-export([info/0]).
-export([is_local/0]).
-export([find_numbers/3]).
-export([acquire_number/1]).
-export([disconnect_number/1]).
-export([is_number_billable/1]).
-export([should_lookup_cnam/0]).
-export([check_numbers/1]).

-include("knm.hrl").

-define(KNM_CARRIER_NAME, "level3").
-define(KNM_CARRIER_CONFIG_CAT, <<(?KNM_CONFIG_CAT)/binary, ".", ?KNM_CARRIER_NAME>>).

%%------------------------------------------------------------------------------
%% @doc
%% @end
%%------------------------------------------------------------------------------
-spec info() -> map().
info() ->
    #{?CARRIER_INFO_MAX_PREFIX => 3
     }.

%%------------------------------------------------------------------------------
%% @doc Is this carrier handling numbers local to the system?
%%
%% <div class="notice">A non-local (foreign) carrier module makes HTTP requests.</div>
%% @end
%%------------------------------------------------------------------------------
-spec is_local() -> boolean().
is_local() -> 'false'.

%%------------------------------------------------------------------------------
%% @doc Check with carrier if these numbers are registered with it.
%% @end
%%------------------------------------------------------------------------------
-spec check_numbers(kz_term:ne_binaries()) -> {ok, kz_json:object()} |
          {error, any()}.
check_numbers(_Numbers) -> {error, not_implemented}.

%%------------------------------------------------------------------------------
%% @doc Query Simwood for available numbers.
%% @end
%%------------------------------------------------------------------------------
-spec find_numbers(kz_term:ne_binary(), pos_integer(), knm_carriers:options()) ->
          {'error', 'not_implemented'}.
find_numbers(_Prefix, _Quantity, _Options) ->
    {'error', 'not_implemented'}.

%%------------------------------------------------------------------------------
%% @doc Acquire a given number from Simwood.
%% @end
%%------------------------------------------------------------------------------
-spec acquire_number(knm_phone_number:record()) ->
          knm_phone_number:record().
acquire_number(Number) ->
    knm_errors:by_carrier(?MODULE, not_implemented, knm_phone_number:number(Number)).

%%------------------------------------------------------------------------------
%% @doc Return number back to Simwood.
%% @end
%%------------------------------------------------------------------------------
-spec disconnect_number(knm_phone_number:record()) ->
          knm_phone_number:record().
disconnect_number(Number) ->
    knm_errors:by_carrier(?MODULE, not_implemented, knm_phone_number:number(Number)).

%%------------------------------------------------------------------------------
%% @doc
%% @end
%%------------------------------------------------------------------------------
-spec is_number_billable(knm_phone_number:knm_phone_number()) -> boolean().
is_number_billable(_Number) -> 'true'.

%%------------------------------------------------------------------------------
%% @doc
%% @end
%%------------------------------------------------------------------------------
-spec should_lookup_cnam() -> boolean().
should_lookup_cnam() -> 'true'.

%%%=============================================================================
%%% Internal functions
%%%=============================================================================
