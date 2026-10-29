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

package org::allbinary::input::motion::gesture::MotionGestureToMotionGestureActionAssociation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{list} = undef;
    $self->{motionGestureAction} = undef;
}


sub new {
    my ($class, $list, $commandAction) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{list} = $list;
        $self->{motionGestureAction} = $commandAction;
    return $self;
}


sub getMotionGesture {
    my ($self) = @_;
        return $self->{list};
}


sub setMotionGestures {
    my ($self, $list) = @_;
        $self->{list} = $list;
}


sub getCommandAction {
    my ($self) = @_;
        return $self->{motionGestureAction};
}


sub setMotionGestureAction {
    my ($self, $commandAction) = @_;
        $self->{motionGestureAction} = $commandAction;
}


sub isMotionGestureArrayEquals {
    my ($self, $aList) = @_;
        my $size = $aList->size();
        if ($self->{list}->size() != $size) {
            return 0;
        }
        for (my $i = $size - 1; $i >= 0; $i--) {
            if ($aList->{objectArray}->[$i] != $self->{list}->{objectArray}->[$i]) {
                return 0;
            }
        }
        return 1;
}

use org::allbinary::game::input::CompleteMotionGestureInputEvent;
use org::allbinary::util::BasicArrayList;

1;

