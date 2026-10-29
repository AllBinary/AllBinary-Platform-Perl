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

package org::allbinary::input::motion::gesture::observer::MotionEventFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::AllBinaryEventObjectFactoryInterface';

our $index = 0;

sub _init_fields {
    my ($self) = @_;
    $self->{source} = undef;
    $self->{id} = undef;
}


sub new {
    my ($class, $source, $id) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{source} = $source;
        $self->{id} = $id;
        $org::allbinary::input::motion::gesture::observer::MotionEventFactory::index = 'org::allbinary::input::motion::gesture::TouchMotionGestureFactory'->getInstance()->{LAST_MOTION}->getId();
    return $self;
}


sub getInstance {
    my ($self) = @_;
        my $inputFactory = 'org::allbinary::game::input::InputFactory'->getInstance();
        my $input = $inputFactory->getInstanceById($org::allbinary::input::motion::gesture::observer::MotionEventFactory::index++);
        if ($input == $inputFactory->{NO_INPUT}) {
            return 'org::allbinary::input::motion::gesture::observer::MotionGestureEvent'->new($self->{source}, $self->{id}, 'org::allbinary::input::motion::gesture::TouchMotionGestureFactory'->getInstance()->{NO_MOTION});
        } else {
            return 'org::allbinary::input::motion::gesture::observer::MotionGestureEvent'->new($self->{source}, $self->{id}, $input);
        }
}

use org::allbinary::game::input::Input;
use org::allbinary::game::input::InputFactory;
use org::allbinary::input::motion::gesture::MotionGestureInput;
use org::allbinary::input::motion::gesture::TouchMotionGestureFactory;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::AllBinaryEventObjectFactoryInterface;
use org::allbinary::input::motion::gesture::observer::MotionGestureEvent;

1;

