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

package org::allbinary::animation::vector::RectangleAnimation;
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
    $self->_init_fields();
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
        $graphics->drawRect($x, $y, $self->{width}, $self->{height});
}


sub setWidth {
    my ($self, $width) = @_;
        $self->{width} = $width;
}


sub setHeight {
    my ($self, $height) = @_;
        $self->{height} = $height;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::Animation;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::ColorCompositeInterface;

1;

