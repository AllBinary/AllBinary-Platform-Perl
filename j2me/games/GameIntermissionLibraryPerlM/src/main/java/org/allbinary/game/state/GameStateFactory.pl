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

package org::allbinary::game::state::GameStateFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{index} = 0;
    $self->{NO_GAME_STATE} = $self->createGameState("NO_GAME_STATE");
    $self->{PLAYING_GAME_STATE} = $self->createGameState("PLAYING_GAME_STATE");
    $self->{SHOW_END_RESULT_GAME_STATE} = $self->createGameState("SHOW_END_RESULT_GAME_STATE");
    $self->{SHOW_HIGH_SCORE_GAME_STATE} = $self->createGameState("SHOW_HIGH_SCORE_GAME_STATE");
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::state::GameStateFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::state::GameStateFactory::instance = 'org::allbinary::game::state::GameStateFactory'->new();
        }
        return $org::allbinary::game::state::GameStateFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub createGameState {
    my ($self, $name) = @_;
        return 'org::allbinary::game::state::GameState'->new($name, $self->{index}++);
}

use org::allbinary::logic::NullUtil;
use org::allbinary::game::state::GameState;

1;

