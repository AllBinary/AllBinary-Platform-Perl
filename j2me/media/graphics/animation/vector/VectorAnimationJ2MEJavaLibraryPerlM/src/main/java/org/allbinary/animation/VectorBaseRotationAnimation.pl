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

package org::allbinary::animation::VectorBaseRotationAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::RotationAnimation','org::allbinary::animation::VectorAnimationInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{currentPoints} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY_ARRAY_ARRAY};
}


sub new {
    my ($class, $angleInfo, $currentPoints, $basicColor, $animationBehavior) = @_;
    my $self = $class->SUPER::new($angleInfo, 'org::allbinary::util::CircularIndexUtil'->createInstance(360 / $angleInfo->getAngleIncrementInfo()->getAngleIncrement()), $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->setPoints($currentPoints);
        $self->setBasicColorP($basicColor);
    return $self;
}


# throws Exception
sub getAnimationSize {
    my ($self) = @_;
        return $self->getSize();
}


sub getFrame {
    my ($self) = @_;
        return $self->{circularIndexUtil}->getIndex();
}


sub setFrame {
    my ($self, $index) = @_;
        $self->{circularIndexUtil}->setIndex($index);
}


sub nextFrame {
    my ($self) = @_;
        $self->{circularIndexUtil}->next();
}


sub previousFrame {
    my ($self) = @_;
        $self->{circularIndexUtil}->previous();
}


sub getSize {
    my ($self) = @_;
        return scalar(@{$self->{currentPoints}});
}


sub setSequence {
    my ($self, $sequence) = @_;
}


sub getSequence {
    my ($self) = @_;
        return 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance();
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->{basicSetColorUtil}->setBasicColorP($graphics, $self->{basicColor});
        try {
            my $nextPointX = 0;
            my $nextPointY = 0;
            my $nextPoint = undef;
            my $point = undef;
            my $currentPointsFrame = $self->{currentPoints}->[$self->{circularIndexUtil}->getIndex()];
            my $size = scalar(@{$currentPointsFrame});
            my $index = $size - 2;
            while (--$index >= 0) {
                $nextPoint = $currentPointsFrame->[$index];
                $point = $currentPointsFrame->[$index + 1];
                $nextPointX = $nextPoint->[0];
                $nextPointY = $nextPoint->[1];
                if ($nextPointX != 1000) {
                    $graphics->drawLine($point->[0] + $x, $point->[1] + $y, $nextPointX + $x, $nextPointY + $y);
                } else {
                    $index--;
                }
            }
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "paintVectors", $e);
        }
}


sub getPoints {
    my ($self, $frame) = @_;
        return $self->{currentPoints}->[$frame];
}


sub setPoints {
    my ($self, $currentPoints) = @_;
        $self->{currentPoints} = $currentPoints;
        $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstance(scalar(@{$self->{currentPoints}}));
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::math::AngleInfo;
use org::allbinary::util::CircularIndexUtil;
use org::allbinary::animation::RotationAnimation;
use org::allbinary::animation::VectorAnimationInterface;

1;

