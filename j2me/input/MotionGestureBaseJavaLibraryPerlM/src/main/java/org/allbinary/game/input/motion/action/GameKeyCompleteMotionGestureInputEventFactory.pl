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

package org::allbinary::game::input::motion::action::GameKeyCompleteMotionGestureInputEventFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::game::input::motion::action::GameKeyCompleteMotionGestureInputEventFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{eventList} = 'org::allbinary::util::BasicArrayListD'->new();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::input::motion::action::GameKeyCompleteMotionGestureInputEventFactory::SINGLETON;
}


sub add {
    my ($self, $gameKeyCompleteMotionGestureInputEvent) = @_;
        $self->{eventList}->add($gameKeyCompleteMotionGestureInputEvent);
}


sub updateAll {
    my ($self) = @_;
        $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append('org::allbinary::string::CommonLabels'->getInstance()->{START_LABEL})->appendint($self->{eventList}->size())->toString(), $self, "updateAll");
        for (my $index = $self->{eventList}->size() - 1; $index >= 0; $index--) {
            my $gameKeyCompleteMotionGestureInputEvent = $self->{eventList}->{objectArray}->[$index];
            $gameKeyCompleteMotionGestureInputEvent->update();
        }
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonLabels;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

