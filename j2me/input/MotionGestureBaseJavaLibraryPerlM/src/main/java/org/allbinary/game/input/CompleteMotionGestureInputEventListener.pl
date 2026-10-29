# Generated Code Do Not Modify

package org::allbinary::game::input::CompleteMotionGestureInputEventListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::CompleteMotionGestureInputEventListenerInterface';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub onEvent {
    my ($self, $eventObject) = @_;
}


sub onCompleteMotionGestureInputEvent {
    my ($self, $completeMotionGestureInputEvent) = @_;
}

use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::game::input::CompleteMotionGestureInputEventListenerInterface;

1;

