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

package org::allbinary::animation::vector::RectangleFilledAdjustedAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::vector::RectangleFilledAnimation','org::allbinary::graphics::color::ColorCompositeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{offsetX} = undef;
    $self->{offsetY} = undef;
}


sub new {
    my ($class, $width, $height, $offsetX, $offsetY, $basicColor) = @_;
    my $self = $class->SUPER::new($width, $height, $basicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->{offsetX} = $offsetX;
        $self->{offsetY} = $offsetY;
        $self->setBasicColorP($basicColor);
    return $self;
}


sub nextFrame {
    my ($self) = @_;
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->{basicSetColorUtil}->setBasicColorP3($graphics, $self->getBasicColorP(), $self->getColor());
        $self->SUPER::paintXY($graphics, $x + $self->{offsetX}, $y + $self->{offsetY});
}


sub setOffsetX {
    my ($self, $offsetX) = @_;
        $self->{offsetX} = $offsetX;
}


sub setOffsetY {
    my ($self, $offsetY) = @_;
        $self->{offsetY} = $offsetY;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::ColorCompositeInterface;
use org::allbinary::animation::vector::RectangleFilledAnimation;

1;

