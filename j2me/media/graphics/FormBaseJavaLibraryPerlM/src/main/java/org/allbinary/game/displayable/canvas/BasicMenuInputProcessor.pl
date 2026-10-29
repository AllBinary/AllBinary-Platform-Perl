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

package org::allbinary::game::displayable::canvas::BasicMenuInputProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::PlayerGameInput','org::allbinary::input::motion::gesture::observer::BaseMotionGestureEventListener';


sub _init_fields {
    my ($self) = @_;
    $self->{motionGestureEventList} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{canvas} = $javax::microedition::lcdui::NullCanvas::NULL_CANVAS;
}


sub new {
    my ($class, $gameKeyEventList, $playerInputId, $gameCanvas) = @_;
    my $self = $class->SUPER::new($gameKeyEventList, 'org::allbinary::util::BasicArrayListD'->new(), $playerInputId);
    $self->_init_fields();
        # super(...) made $self above
        $self->{canvas} = $gameCanvas;
    return $self;
}


sub onMotionGestureEvent {
    my ($self, $motionGestureEvent) = @_;
        $self->{motionGestureEventList}->add($motionGestureEvent);
}


sub onScrolledMotionGestureEvent {
    my ($self, $motionGestureEvent) = @_;
}


sub setCanvas {
    my ($self, $canvas) = @_;
        $self->{canvas} = $canvas;
}


sub getCanvas {
    my ($self) = @_;
        return $self->{canvas};
}


# throws Exception
sub processInputList {
    my ($self) = @_;
        return -1;
}

# use javax::microedition::lcdui::Canvas;
# use javax::microedition::lcdui::NullCanvas;
use org::allbinary::game::input::PlayerGameInput;
use org::allbinary::graphics::displayable::MyCanvas;
use org::allbinary::input::motion::gesture::observer::BaseMotionGestureEventListener;
use org::allbinary::input::motion::gesture::observer::MotionGestureEvent;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

