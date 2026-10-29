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

package org::allbinary::game::input::GameInputStrings;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::input::GameInputStrings'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{PROCESS_INPUT} = "processInput";
    $self->{KEY_PRESSED} = "keyPressed";
    $self->{KEY_RELEASED} = "keyReleased";
    $self->{KEY_REPEATED} = "keyRepeated";
    $self->{ON_PRESS_GAME_KEY} = "onPressGameKeyEvent";
    $self->{ON_DOWN_GAME_KEY} = "onDownGameKeyEvent";
    $self->{ON_UP_GAME_KEY} = "onUpGameKeyEvent";
    $self->{NO_KEY} = "Key Code Not Mapped For Game: ";
    $self->{ADD_KEY_EVENT} = "addGameKeyEvent";
    $self->{REMOVE_KEY_EVENT} = "removeGameKeyEvent";
    $self->{STRAFE_LEFT} = "strafeLeft";
    $self->{STRAFE_RIGHT} = "strafeRight";
    $self->{PROCESS_MOTION_INPUT} = "processMotionInput";
    $self->{UDPATE_CURRENT_TOUCH_INPUT_FACTORY} = "updateCurrentTouchInputFactory";
    $self->{ENABLE_PLAYER_GAME_INPUTS} = "Enabling PlayerGameInputs: ";
    $self->{ENABLE_PLAYER_GAME_INPUT} = "Enabling PlayerGameInput: ";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::GameInputStrings::instance;
}


1;

