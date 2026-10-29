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

package org::allbinary::game::ag::layer::hud::basic::life::LivesHudWidget;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::graphics::hud::BasicHud','org::allbinary::graphics::paint::PaintableInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{lifeInterface} = undef;
    $self->{xArray} = undef;
    $self->{animationInterface} = undef;
}


sub new {
    my ($class, $animationInterface, $lifeInterface, $location, $direction) = @_;
    my $self = $class->SUPER::new($location, $direction, 2, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE});
    $self->_init_fields();
        # super(...) made $self above
        $self->{lifeInterface} = $lifeInterface;
        my $size = int($self->getLifeInterface()->getMaxlives());
        $self->{xArray} = [(0) x ($size)];
        $self->{animationInterface} = $animationInterface;
        $self->{updateMaxWidth} = $self->{lifeInterface}->getMaxlives() * 16;
        $self->{updateMaxHeight} = 16;
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        $self->SUPER::updateMeasurement($graphics);
        my $maxLives = int($self->getLifeInterface()->getMaxlives());
        for (my $index = 0; $index < $maxLives; $index++) {
            $self->{xArray}->[$index] = $self->getX() + ($index * 16);
        }
}


sub onDisplayChangeEvent {
    my ($self, $displayChangeEvent) = @_;
        $self->SUPER::onDisplayChangeEvent($displayChangeEvent);
        $self->{myFontProcessor} = $self->{updateMyFontProcessor};
}


sub setX {
    my ($self, $x) = @_;
        $self->SUPER::setX($x);
        $self->{myFontProcessor} = $self->{updateMyFontProcessor};
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
        for (my $index = int($self->getLifeInterface()->get()); --$index >= 0; ) {
            $self->{animationInterface}->paintXY($graphics, $self->{xArray}->[$index], $self->getY());
        }
}


sub paintThreed {
    my ($self, $graphics) = @_;
}


sub getLifeInterface {
    my ($self) = @_;
        return $self->{lifeInterface};
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::Animation;
use org::allbinary::game::ag::life::Life;
use org::allbinary::game::graphics::hud::BasicHud;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::displayable::event::DisplayChangeEvent;
use org::allbinary::graphics::paint::PaintableInterface;

1;

