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

package org::allbinary::game::input::motion::action::NoCompleteMotionGestureInputEventListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::CompleteMotionGestureInputEventListenerInterface';

our $instance = 'org::allbinary::game::input::motion::action::NoCompleteMotionGestureInputEventListener'->new();


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


sub onCompleteMotionGestureInputEvent {
    my ($self, $completeMotionGestureInputEvent) = @_;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::motion::action::NoCompleteMotionGestureInputEventListener::instance;
}

use org::allbinary::game::input::CompleteMotionGestureInputEvent;
use org::allbinary::game::input::CompleteMotionGestureInputEventListenerInterface;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;

1;

