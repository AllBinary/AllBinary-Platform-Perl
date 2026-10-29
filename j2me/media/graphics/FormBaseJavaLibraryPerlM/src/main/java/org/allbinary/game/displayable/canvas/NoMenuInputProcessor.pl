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

package org::allbinary::game::displayable::canvas::NoMenuInputProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::displayable::canvas::BasicMenuInputProcessor';

our $SINGLETON = 'org::allbinary::game::displayable::canvas::NoMenuInputProcessor'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::displayable::canvas::NoMenuInputProcessor::SINGLETON;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance(), -1, $javax::microedition::lcdui::NullCanvas::NULL_CANVAS);
        # super(...) made $self above
    return $self;
}


sub onDownGameKeyEvent {
    my ($self, $gameKeyEvent) = @_;
}


sub onUpGameKeyEvent {
    my ($self, $gameKeyEvent) = @_;
}


sub onMotionGestureEvent {
    my ($self, $motionGestureEvent) = @_;
}

# use javax::microedition::lcdui::NullCanvas;
use org::allbinary::game::input::event::GameKeyEvent;
use org::allbinary::input::motion::gesture::observer::MotionGestureEvent;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::game::displayable::canvas::BasicMenuInputProcessor;

1;

