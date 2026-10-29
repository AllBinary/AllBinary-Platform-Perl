# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::game::state::RaceGameStateFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{START_GAME_STATE} = 'org::allbinary::game::state::GameStateFactory'->getInstance()->createGameState("START_GAME_STATE");
    $self->{YELLOW_LIGHT_GAME_STATE} = 'org::allbinary::game::state::GameStateFactory'->getInstance()->createGameState("YELLOW_LIGHT_GAME_STATE");
    $self->{RED_LIGHT_GAME_STATE} = 'org::allbinary::game::state::GameStateFactory'->getInstance()->createGameState("RED_LIGHT_GAME_STATE");
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::state::RaceGameStateFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::state::RaceGameStateFactory::instance = 'org::allbinary::game::state::RaceGameStateFactory'->new();
        }
        return $org::allbinary::game::state::RaceGameStateFactory::instance;
}

use org::allbinary::logic::NullUtil;
use org::allbinary::game::state::GameStateFactory;

1;

