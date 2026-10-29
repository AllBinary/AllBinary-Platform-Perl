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

package org::allbinary::game::GameStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::GameStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{PROCESS_TICK} = "processTick";
    $self->{ON_GAME_INITIALIZED} = "onGameInitialized";
    $self->{UPDATESURFACE} = "updateSurface";
    $self->{ON_SET_DISPLAYABLE} = "onSetDisplayable";
    $self->{UNPAUSE} = "unPause";
    $self->{TOGGLE_MENU} = "toggleMenu";
    $self->{SET_GAME_OVER} = "setGameOver";
    $self->{GAME_STATE} = "Game State: ";
    $self->{SET_GAME_STATE} = "setGameState";
    $self->{STOP_GAME_CANVAS_RUNNABLE_INTERFACE} = "stopGameCanvasRunnableInterface";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::GameStrings::instance;
}


1;

