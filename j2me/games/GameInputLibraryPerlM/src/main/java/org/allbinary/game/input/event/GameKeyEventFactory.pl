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

package org::allbinary::game::input::event::GameKeyEventFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{TOUCH_BUTTON_SOURCE_ID} = 2;
    $self->{MOTION_GESTURE_SOURCE_ID} = 3;
    $self->{MAX_SOURCES} = 4;
    $self->{ARRAY} = [map { [(undef) x ('org::allbinary::game::input::InputFactory'->getInstance()->{MAX})] } 1 .. ($self->{MAX_SOURCES})];
}


sub getInstance {
    my ($class) = @_;
        if ($org::allbinary::game::input::event::GameKeyEventFactory::instance == 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT}) {
            $org::allbinary::game::input::event::GameKeyEventFactory::instance = 'org::allbinary::game::input::event::GameKeyEventFactory'->new();
        }
        return $org::allbinary::game::input::event::GameKeyEventFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub init {
    my ($self) = @_;
        my $nullUtil = 'org::allbinary::logic::NullUtil'->getInstance();
        my $size = 'org::allbinary::game::input::InputFactory'->getInstance()->{MAX};
        for (my $index = $self->{MAX_SOURCES}; --$index >= 0; ) {
            for (my $index2 = $size; --$index2 >= 0; ) {
                $self->{ARRAY}->[$index]->[$index2] = 'org::allbinary::game::input::event::GameKeyEvent'->createEvent($nullUtil->{NULL_OBJECT}, $index, $index2);
            }
        }
}


# throws Exception
sub getInstanceForKey {
    my ($self, $anyType, $key) = @_;
        my $gameKeyEvent = $self->{ARRAY}->[$anyType->getSourceId()]->[$key];
        return $gameKeyEvent;
}


# throws Exception
sub getInstanceForInput {
    my ($self, $anyType, $input) = @_;
        my $gameKeyEvent = $self->{ARRAY}->[$anyType->getSourceId()]->[$input->getId()];
        return $gameKeyEvent;
}

use org::allbinary::game::input::GameKeyEventSourceInterface;
use org::allbinary::game::input::Input;
use org::allbinary::game::input::InputFactory;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::game::input::event::GameKeyEvent;

1;

