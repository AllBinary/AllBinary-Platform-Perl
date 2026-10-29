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

package org::allbinary::animation::caption::CaptionIndexedAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::IndexedAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{animationInterface} = undef;
    $self->{movieIndexedAnimationInterface} = undef;
    $self->{captionDx} = undef;
    $self->{captionDy} = undef;
    $self->{dx} = undef;
    $self->{dy} = undef;
    $self->{time} = undef;
    $self->{END_EVENT} = undef;
    $self->{timeDelayHelper} = undef;
    $self->{player} = undef;
}


sub new {
    my ($class, $animationInterface, $movieIndexedAnimationInterface, $player, $captionDx, $captionDy, $dx, $dy, $time, $animationBehavior) = @_;
    my $self = $class->SUPER::new($animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{animationInterface} = $animationInterface;
        $self->{movieIndexedAnimationInterface} = $movieIndexedAnimationInterface;
        $self->{captionDx} = $captionDx;
        $self->{captionDy} = $captionDy;
        $self->{dx} = $dx;
        $self->{dy} = $dy;
        $self->{time} = $time;
        $self->{END_EVENT} = 'org::allbinary::logic::util::event::AllBinaryEventObject'->new($self);
        my $timePerFrame = int($self->{time} / $self->getSize());
        $self->{timeDelayHelper} = 'org::allbinary::time::TimeDelayHelper'->new($timePerFrame);
        $self->{player} = $player;
        $self->{player}->start();
    return $self;
}


# throws Exception
sub nextFrame {
    my ($self) = @_;
        if ($self->{timeDelayHelper}->isTime('org::allbinary::time::GameTickTimeDelayHelperFactory'->getInstance()->{startTime})) {
            $self->{movieIndexedAnimationInterface}->nextFrame();
        }
        if ($self->isLastFrame()) {
            'org::allbinary::animation::AnimationEventHandler'->getInstance()->fireEvent($self->{END_EVENT});
        }
}


sub isLastFrame {
    my ($self) = @_;
        if ($self->{movieIndexedAnimationInterface}->getFrame() == $self->getSize() - 1) {
            return 1;
        } else {
            return 0;
        }
}


sub previousFrame {
    my ($self) = @_;
        $self->{movieIndexedAnimationInterface}->previousFrame();
}


sub setFrame {
    my ($self, $index) = @_;
        $self->{movieIndexedAnimationInterface}->setFrame($index);
}


sub getFrame {
    my ($self) = @_;
        return $self->{movieIndexedAnimationInterface}->getFrame();
}


sub getSize {
    my ($self) = @_;
        return $self->{movieIndexedAnimationInterface}->getSize();
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
        $self->{animationInterface}->paintXY($graphics, $x + $self->{captionDx}, $y + $self->{captionDy});
        $self->{movieIndexedAnimationInterface}->paintXY($graphics, $x + $self->{captionDx} + $self->{dx}, $y + $self->{captionDy} + $self->{dy});
}


sub paintThreedXYZ {
    my ($self, $graphics, $x, $y, $z) = @_;
        $self->{animationInterface}->paintThreedXYZ($graphics, $x + $self->{captionDx}, $y + $self->{captionDy}, $z);
        $self->{movieIndexedAnimationInterface}->paintThreedXYZ($graphics, $x + $self->{captionDx} + $self->{dx}, $y + $self->{captionDy} + $self->{dy}, $z);
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::media::Player;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::AnimationEventHandler;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::time::GameTickTimeDelayHelperFactory;
use org::allbinary::time::TimeDelayHelper;

1;

