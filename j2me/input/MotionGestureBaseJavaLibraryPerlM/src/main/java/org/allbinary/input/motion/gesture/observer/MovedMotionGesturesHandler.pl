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

package org::allbinary::input::motion::gesture::observer::MovedMotionGesturesHandler;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::handler::BasicEventHandler';

our $SINGLETON = 'org::allbinary::input::motion::gesture::observer::MovedMotionGesturesHandler'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::motion::gesture::observer::MovedMotionGesturesHandler::SINGLETON;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


# throws Exception
sub process {
    my ($self, $eventObject, $eventListenerInterface) = @_;
        my $baseMotionGestureEventListener = $eventListenerInterface;
        $baseMotionGestureEventListener->onMotionGestureEvent($eventObject);
}

use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventListenerInterface;
use org::allbinary::logic::util::event::handler::BasicEventHandler;

1;

