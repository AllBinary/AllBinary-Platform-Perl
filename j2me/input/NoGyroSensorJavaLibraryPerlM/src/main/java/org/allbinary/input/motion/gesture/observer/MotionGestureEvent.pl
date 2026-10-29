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

package org::allbinary::input::motion::gesture::observer::MotionGestureEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::AllBinaryEventObject';

our $PREVIOUS = " Previous: ";
our $HASHCODE = " hashcode: ";

sub _init_fields {
    my ($self) = @_;
    $self->{motionGesture} = 'org::allbinary::input::motion::gesture::TouchMotionGestureFactory'->getInstance()->{NO_MOTION};
    $self->{id} = undef;
    $self->{previousPoint} = 'org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO};
    $self->{currentPoint} = 'org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO};
    $self->{commonLabels} = 'org::allbinary::string::CommonLabels'->getInstance();
}


sub new {
    my ($class, $source, $id, $motionGesture) = @_;
    my $self = $class->SUPER::new($source);
    $self->_init_fields();
        # super(...) made $self above
        $self->{id} = $id;
        $self->setMotionGesture($motionGesture);
    return $self;
}


sub getMotionGesture {
    my ($self) = @_;
        return $self->{motionGesture};
}


sub setMotionGesture {
    my ($self, $motionGesture) = @_;
        $self->{motionGesture} = $motionGesture;
}


sub getPreviousPoint {
    my ($self) = @_;
        return $self->{previousPoint};
}


sub setPreviousPoint {
    my ($self, $previousPoint) = @_;
        $self->{previousPoint} = $previousPoint;
}


sub getCurrentPoint {
    my ($self) = @_;
        return $self->{currentPoint};
}


sub setCurrentPoint {
    my ($self, $currentPoint) = @_;
        $self->{currentPoint} = $currentPoint;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        $stringBuffer->append($stringUtil->toString($self->{motionGesture}));
        $stringBuffer->append($self->{commonLabels}->{CURRENT});
        $stringBuffer->append($stringUtil->toString($self->{currentPoint}));
        $stringBuffer->append($org::allbinary::input::motion::gesture::observer::MotionGestureEvent::PREVIOUS);
        $stringBuffer->append($stringUtil->toString($self->{previousPoint}));
        $stringBuffer->append($org::allbinary::input::motion::gesture::observer::MotionGestureEvent::HASHCODE);
        $stringBuffer->appendint(int('org::allbinary::TsUtil'->getInstance()->hashCode($self)));
        return $stringBuffer->toString();
}


sub getId {
    my ($self) = @_;
        return $self->{id};
}

use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;
use org::allbinary::input::motion::gesture::MotionGestureInput;
use org::allbinary::input::motion::gesture::TouchMotionGestureFactory;
use org::allbinary::TsUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::string::CommonLabels;

1;

