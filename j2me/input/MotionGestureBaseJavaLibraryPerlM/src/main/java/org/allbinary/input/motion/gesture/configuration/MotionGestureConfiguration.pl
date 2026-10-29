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

package org::allbinary::input::motion::gesture::configuration::MotionGestureConfiguration;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{diagonalMotionGestureAllowed} = 1;
    $self->{diagonalTolerance} = 7;
    $self->{minimumMotionGesture} = 9;
    $self->{button} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{color} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLUE};
    $self->{executingActions} = 1;
    $self->{mouseButtonMask} = 0;
    $self->{activeCommands} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub addMotionGestureAction {
    my ($self, $list, $commandAction) = @_;
        $self->{activeCommands}->add('org::allbinary::input::motion::gesture::MotionGestureToMotionGestureActionAssociation'->new($list, $commandAction));
}


sub clearMotionGestureAction {
    my ($self) = @_;
        $self->{activeCommands}->clear();
}


sub getAssociateCommandActionsList {
    my ($self) = @_;
        return $self->{activeCommands};
}


sub isDiagonalMotionGestureAllowed {
    my ($self) = @_;
        return $self->{diagonalMotionGestureAllowed};
}


sub isExecutingActionsAllowed {
    my ($self) = @_;
        return $self->{executingActions};
}


sub setExecutingActionsAllowed {
    my ($self, $executingActionAllowed) = @_;
        $self->{executingActions} = $executingActionAllowed;
}


sub setDiagonalMotionGestureAllowed {
    my ($self, $diagonalMotionGestureAllowed) = @_;
        $self->{diagonalMotionGestureAllowed} = $diagonalMotionGestureAllowed;
}


sub getDiagonalTolerance {
    my ($self) = @_;
        return $self->{diagonalTolerance};
}


sub setDiagonalTolerance {
    my ($self, $diagonalTolerance) = @_;
        $self->{diagonalTolerance} = $diagonalTolerance;
}


sub getMinimumMotionGesture {
    my ($self) = @_;
        return $self->{minimumMotionGesture};
}


sub setMinimumMotionGesture {
    my ($self, $minimumMotionGesture) = @_;
        $self->{minimumMotionGesture} = $minimumMotionGesture;
}


sub getButton {
    my ($self) = @_;
        return $self->{button};
}


sub setButton {
    my ($self, $button) = @_;
        $self->{button} = $button;
}


sub getColor {
    my ($self) = @_;
        return $self->{color};
}


sub setColor {
    my ($self, $color) = @_;
        $self->{color} = $color;
}


sub getMouseButtonMask {
    my ($self) = @_;
        return $self->{mouseButtonMask};
}


sub setMouseButtonMask {
    my ($self, $mouseButtonMask) = @_;
        $self->{mouseButtonMask} = $mouseButtonMask;
}

use org::allbinary::game::input::CompleteMotionGestureInputEvent;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::input::motion::gesture::MotionGestureToMotionGestureActionAssociation;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

