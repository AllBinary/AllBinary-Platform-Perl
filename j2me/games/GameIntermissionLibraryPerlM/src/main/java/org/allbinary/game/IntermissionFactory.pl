#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
# 
# By agreeing to this license you and any business entity you represent are
# legally bound to the AllBinary Open License Version 1 legal agreement.
# 
# You may obtain the AllBinary Open License Version 1 legal agreement from
# AllBinary or the root directory of AllBinary's AllBinary Platform repository.
# 
# Created By: Travis Berthelot
#  
# Generated Code Do Not Modify

package org::allbinary::game::IntermissionFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::IntermissionFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{START_LEVEL_INTERMISSION_GAME_STATE} = 'org::allbinary::game::state::GameStateFactory'->getInstance()->createGameState("START_LEVEL_INTERMISSION_GAME_STATE");
    $self->{WAIT_LEVEL_INTERMISSION_GAME_STATE} = 'org::allbinary::game::state::GameStateFactory'->getInstance()->createGameState("WAIT_LEVEL_INTERMISSION_GAME_STATE");
    $self->{SHOW_RESULTS_LEVEL_INTERMISSION_GAME_STATE} = 'org::allbinary::game::state::GameStateFactory'->getInstance()->createGameState("SHOW_RESULTS_LEVEL_INTERMISSION_GAME_STATE");
    $self->{SHOW_HIGH_SCORE_LEVEL_INTERMISSION_GAME_STATE} = 'org::allbinary::game::state::GameStateFactory'->getInstance()->createGameState("SHOW_HIGH_SCORE_LEVEL_INTERMISSION_GAME_STATE");
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::IntermissionFactory::instance;
}

use org::allbinary::game::state::GameState;
use org::allbinary::game::state::GameStateFactory;

1;

