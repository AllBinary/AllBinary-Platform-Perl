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

package org::allbinary::animation::VectorAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::IndexedAnimation','org::allbinary::animation::VectorAnimationInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{currentPoints} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY_ARRAY_ARRAY};
    $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstance(0);
}


sub createVectorAnimation {
    my ($class, $currentPoints2, $basicColor, $animationBehavior) = @_;
        my $currentPoints = [map { [map { [(0) x (2)] } 1 .. (scalar(@{$currentPoints2}))] } 1 .. (1)];
        my $size = scalar(@{$currentPoints2});
        for (my $index = 0; $index < $size; $index++) {
            $currentPoints->[0]->[$index]->[0] = $currentPoints2->[$index]->[0];
            $currentPoints->[0]->[$index]->[1] = $currentPoints2->[$index]->[1];
        }
        return 'org::allbinary::animation::VectorAnimation'->new($currentPoints, $basicColor, $animationBehavior);
}


sub new {
    my ($class, $currentPoints, $basicColor, $animationBehavior) = @_;
    my $self = $class->SUPER::new($animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->setPoints($currentPoints);
        $self->setBasicColorP($basicColor);
    return $self;
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
        my $changed = 0;
        if (!defined($self->getBasicColorP()) || int($self->getBasicColorP()) != int($basicColor)) {
            $changed = 1;
        }
        $self->SUPER::setBasicColorP($basicColor);
        if ($changed) {
            $self->updateModifiers();
        }
}


sub changeBasicColor {
    my ($self, $basicColor) = @_;
        my $changed = 0;
        if (!defined($self->getChangeBasicColor()) || int($self->getChangeBasicColor()) != int($basicColor)) {
            $changed = 1;
        }
        $self->SUPER::changeBasicColor($basicColor);
        if ($changed) {
            $self->updateModifiers();
        }
}


sub setAlpha {
    my ($self, $alpha) = @_;
        my $changed = 0;
        if ($self->{alphaP} != $alpha) {
            $changed = 1;
        }
        $self->SUPER::setAlpha($alpha);
        if ($changed) {
            $self->updateModifiers();
        }
}


sub setScale {
    my ($self, $scaleX, $scaleY) = @_;
}


sub setMaxScale {
    my ($self, $maxScaleX, $maxScaleY) = @_;
}


sub updateModifiers {
    my ($self) = @_;
}


# throws Exception
sub getAnimationSize {
    my ($self) = @_;
        return $self->getSize();
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


sub nextFrame {
    my ($self) = @_;
        $self->{circularIndexUtil}->next();
}


sub previousFrame {
    my ($self) = @_;
        $self->{circularIndexUtil}->previous();
}


sub paintVectors {
    my ($self, $graphics, $x, $y) = @_;
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


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->{basicSetColorUtil}->setBasicColorP($graphics, $self->{basicColor});
        $self->paintVectors($graphics, $x, $y);
}


sub getFrame {
    my ($self) = @_;
        return $self->{circularIndexUtil}->getIndex();
}


sub setFrame {
    my ($self, $index) = @_;
        $self->{circularIndexUtil}->setIndex($index);
}


sub getPoints {
    my ($self, $frame) = @_;
        return $self->{currentPoints}->[$frame];
}


sub setPoints {
    my ($self, $currentPoints) = @_;
        $self->{currentPoints} = $currentPoints;
        $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstance(scalar(@{$currentPoints}));
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::NullImage;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::util::CircularIndexUtil;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::animation::VectorAnimationInterface;

1;

