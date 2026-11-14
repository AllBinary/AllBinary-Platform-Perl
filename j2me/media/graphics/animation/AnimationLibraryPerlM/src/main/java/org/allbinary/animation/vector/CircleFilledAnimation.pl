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

package org::allbinary::animation::vector::CircleFilledAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::Animation','org::allbinary::graphics::color::ColorCompositeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{width} = undef;
    $self->{height} = undef;
}


sub new {
    my ($class, $width, $height, $basicColor) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
        # super(...) made $self above
        $self->{width} = $width;
        $self->{height} = $height;
        $self->setBasicColorP($basicColor);
    return $self;
}


sub nextFrame {
    my ($self) = @_;
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->{basicSetColorUtil}->setBasicColorP3($graphics, $self->getBasicColorP(), $self->getColor());
        $graphics->fillRect($x, $y, $self->{width}, $self->{height});
}


sub getBasicColorP {
    my ($self) = @_;
        return $self->SUPER::getBasicColorP();
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
        $self->SUPER::setBasicColorP($basicColor);
}

use java::lang::Object ();
use javax::microedition::lcdui::Graphics ();
use org::allbinary::animation::Animation ();
use org::allbinary::graphics::color::BasicColor ();
use org::allbinary::graphics::color::ColorCompositeInterface ();

1;

