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

package org::allbinary::math::AngleIncrementInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $INCREMENT = "Inc: ";

sub _init_fields {
    my ($self) = @_;
    $self->{angleIncrement} = undef;
    $self->{DOWN_FRAME} = undef;
    $self->{UP_FRAME} = undef;
    $self->{LEFT_FRAME} = undef;
    $self->{RIGHT_FRAME} = undef;
    $self->{frameUtil} = 'org::allbinary::math::FrameUtil'->getInstance();
}


sub new {
    my ($class, $angleIncrement) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{angleIncrement} = $angleIncrement;
        my $angleFactory = 'org::allbinary::math::AngleFactory'->getInstance();
        my $smallIntegerSingletonFactory = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
        $self->{DOWN_FRAME} = $smallIntegerSingletonFactory->getAt($angleFactory->{DOWN}->getValue() / $self->{angleIncrement});
        $self->{UP_FRAME} = $smallIntegerSingletonFactory->getAt(int($angleFactory->{UP}->getValue()));
        $self->{LEFT_FRAME} = $smallIntegerSingletonFactory->getAt($angleFactory->{LEFT}->getValue() / $self->{angleIncrement});
        $self->{RIGHT_FRAME} = $smallIntegerSingletonFactory->getAt($angleFactory->{RIGHT}->getValue() / $self->{angleIncrement});
    return $self;
}


sub getFrameAngle {
    my ($self, $frame) = @_;
        return $self->{frameUtil}->getFrameAngle($frame, $self->{angleIncrement});
}


sub getAngleIncrement {
    my ($self) = @_;
        return $self->{angleIncrement};
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringMaker'->new()->append($org::allbinary::math::AngleIncrementInfo::INCREMENT)->appendshort($self->{angleIncrement})->toString();
}


sub getClosestGeneralDirection {
    my ($self, $angle) = @_;
        my $closestDirection = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(360);
        if (int($self->{UP_FRAME}) - $angle < int($closestDirection) - $angle) {
            $closestDirection = $self->{UP_FRAME};
        }
        if (int($self->{DOWN_FRAME}) - $angle < int($closestDirection) - $angle) {
            $closestDirection = $self->{DOWN_FRAME};
        }
        if (int($self->{LEFT_FRAME}) - $angle < int($closestDirection) - $angle) {
            $closestDirection = $self->{LEFT_FRAME};
        }
        if (int($self->{RIGHT_FRAME}) - $angle < int($closestDirection) - $angle) {
            $closestDirection = $self->{RIGHT_FRAME};
        }
        return int($closestDirection);
}

# use jsinterop::annotations::JsType;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::logic::string::StringMaker;
# use jsinterop::annotations::JsProperty;
# use jsinterop::annotations::JsMethod;
# use jsinterop::annotations::JsConstructor;
use org::allbinary::math::AngleFactory;
use org::allbinary::math::FrameUtil;

1;

