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

package org::allbinary::animation::special::TitleAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();
use parent -norequire,'org::allbinary::animation::special::SpecialAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{systemWrapper} = 'org::allbinary::logic::ABSystemWrapper'->getInstance();
    $self->{deltaX} = 0.0;
    $self->{deltaY} = 0.0;
    $self->{deltaZ} = 0.0;
    $self->{basicColorArray} = undef;
    $self->{dxArray} = undef;
    $self->{dyArray} = undef;
    $self->{widthP} = undef;
    $self->{animationInterfaceArray} = undef;
    $self->{sizeP} = undef;
    $self->{y} = undef;
    $self->{lastFrameStartTime} = undef;
    $self->{displayInfoSingleton} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
    $self->{CLEAR_COLOR} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{CLEAR_COLOR};
}


sub createAnimation {
    my ($class, $animationInterfaceArray, $basicColorArray, $dxArray, $dyArray, $y, $width) = @_;
        return 'org::allbinary::animation::special::TitleAnimation'->new($animationInterfaceArray, $basicColorArray, $dxArray, $dyArray, $y, $width, 'org::allbinary::animation::IndexedAnimationBehavior'->new(1, 250));
}


sub new {
    my ($class, $animationInterfaceArray, $basicColorArray, $dxArray, $dyArray, $y, $width, $animationBehavior) = @_;
    my $self = $class->SUPER::new($animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{lastFrameStartTime} = $self->{systemWrapper}->currentTimeMillis();
        $self->{animationInterfaceArray} = $animationInterfaceArray;
        $self->{sizeP} = scalar(@{$self->{animationInterfaceArray}});
        $self->{basicColorArray} = $basicColorArray;
        $self->{dxArray} = $dxArray;
        $self->{dyArray} = $dyArray;
        $self->{y} = $y;
        $self->{widthP} = $width;
        $self->reset();
    return $self;
}


sub nextFrame {
    my ($self) = @_;
        my $currentTime = $self->{systemWrapper}->currentTimeMillis();
        my $totalTimeElapsed = $currentTime - $self->{lastFrameStartTime};
        my $indexedAnimationBehavior = $self->getAnimationBehavior();
        if ($totalTimeElapsed > $indexedAnimationBehavior->{frameDelayTime}) {
            $self->previousFrame();
            $self->{lastFrameStartTime} = $currentTime;
        }
        if ($self->{animationInterfaceArray}->[0]->getFrame() == 0) {
            $indexedAnimationBehavior->{loopIndex}++;
        }
}


sub isComplete {
    my ($self) = @_;
        my $indexedAnimationBehavior = $self->getAnimationBehavior();
        if ($indexedAnimationBehavior->{loopTotal} == -1 || $indexedAnimationBehavior->{loopIndex} < $indexedAnimationBehavior->{loopTotal} || $self->getFrame() != 0) {
            return 0;
        } else {
            return 1;
        }
}


sub setSequence {
    my ($self, $sequence) = @_;
}


sub getSequence {
    my ($self) = @_;
        return 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance();
}


sub getSize {
    my ($self) = @_;
        return $self->{animationInterfaceArray}->[0]->getSize();
}


sub getFrame {
    my ($self) = @_;
        return $self->{animationInterfaceArray}->[0]->getFrame();
}


sub setFrame {
    my ($self, $frame) = @_;
        for (my $index = 0; $index < $self->{sizeP}; $index++) {
            $self->{animationInterfaceArray}->[$index]->setFrame($frame);
        }
}


sub setLastFrame {
    my ($self) = @_;
        $self->setFrame($self->getSize() - 1);
}


sub reset {
    my ($self) = @_;
        $self->setLastFrame();
        my $indexedAnimationBehavior = ($self->getAnimationBehavior());
        $indexedAnimationBehavior->reset();
}


sub previousFrame {
    my ($self) = @_;
        for (my $index = 0; $index < $self->{sizeP}; $index++) {
            $self->{animationInterfaceArray}->[$index]->previousFrame();
        }
}


sub paintFrameXY {
    my ($self, $graphics, $frame, $x, $y) = @_;
        $self->setFrame($frame);
        $self->paintXY($graphics, $x, $y);
}


sub paintXY {
    my ($self, $graphics, $ax, $ay) = @_;
        my $x = 0;
        if ($self->{widthP} != (-2147483648)) {
            $x = (($self->{displayInfoSingleton}->getLastWidth() - $self->{widthP}) / 2);
        }
        my $deltaX = 0;
        my $deltaY = 0;
        for (my $index = 0; $index < $self->{sizeP}; $index++) {
            $deltaX = $self->{dxArray}->[$index] + $x;
            $deltaY = $self->{dyArray}->[$index] + $self->{y};
            if ($self->{basicColorArray}->[$index] != $self->{CLEAR_COLOR}) {
                $self->{basicSetColorUtil}->setBasicColorP($graphics, $self->{basicColorArray}->[$index]);
            }
            $self->{animationInterfaceArray}->[$index]->paintXY($graphics, $deltaX, $deltaY);
        }
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::animation::IndexedAnimationBehavior;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::logic::ABSystemWrapper;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::animation::special::SpecialAnimation;

1;

