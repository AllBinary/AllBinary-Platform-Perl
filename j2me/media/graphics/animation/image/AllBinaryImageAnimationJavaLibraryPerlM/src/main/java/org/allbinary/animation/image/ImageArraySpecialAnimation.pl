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

package org::allbinary::animation::image::ImageArraySpecialAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::animation::image::ImageArrayAnimation','org::allbinary::animation::special::SpecialAnimationInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{timeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new(270);
    $self->{loopCount} = 0;
    $self->{loopCountTotal} = 1;
}


sub new {
    my ($class, $imageArray, $animationBehavior) = @_;
    my $self = $class->SUPER::new($imageArray, $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->reset();
    return $self;
}


sub getLoopCount {
    my ($self) = @_;
        return $self->{loopCount};
}


sub setLastFrame {
    my ($self) = @_;
        $self->{circularIndexUtil}->setIndex($self->{circularIndexUtil}->getSize() - 1);
}


sub reset {
    my ($self) = @_;
        $self->setFrame($self->getSize() - 1);
        $self->{loopCount} = 0;
}


sub nextFrame {
    my ($self) = @_;
        if ($self->getFrame() > 0) {
            if ($self->{timeDelayHelper}->isTime('org::allbinary::time::GameTickTimeDelayHelperFactory'->getInstance()->{startTime})) {
                $self->previousFrame();
                if ($self->getFrame() == 0) {
                    $self->{loopCount}++;
                }
            }
        }
}


sub isComplete {
    my ($self) = @_;
        if ($self->{loopCount} < $self->{loopCountTotal} || $self->getFrame() != 0) {
            return 0;
        } else {
            return 1;
        }
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $x = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance()->getLastHalfWidth() - (POSIX::floor(($self->getImage($self->{circularIndexUtil}->getIndex())->getWidth()) / (2 ** (1))));
        $y = 5;
        $self->SUPER::paintXY($graphics, $x, $y);
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::special::SpecialAnimationInterface;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::time::GameTickTimeDelayHelperFactory;
use org::allbinary::time::TimeDelayHelper;
use org::allbinary::animation::image::ImageArrayAnimation;

1;

