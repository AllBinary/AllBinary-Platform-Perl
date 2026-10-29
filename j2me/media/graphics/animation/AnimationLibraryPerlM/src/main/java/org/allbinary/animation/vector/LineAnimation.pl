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

package org::allbinary::animation::vector::LineAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::Animation','org::allbinary::graphics::color::ColorCompositeInterface','org::allbinary::layer::PositionInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{newLine} = [map { [(0) x (2)] } 1 .. (2)];
    $self->{tempLine} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY_ARRAY};
    $self->{line} = [map { [(0) x (2)] } 1 .. (2)];
}


sub new {
    my ($class, $basicColor) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->setBasicColorP($basicColor);
    return $self;
}


sub init {
    my ($self, $x, $y) = @_;
        $self->{newLine}->[0]->[0] = $x;
        $self->{newLine}->[0]->[1] = $y;
        $self->{newLine}->[1]->[0] = $x;
        $self->{newLine}->[1]->[1] = $y;
        $self->{tempLine} = $self->{line};
        $self->{line} = $self->{newLine};
        $self->{newLine} = $self->{tempLine};
}


sub setPosition {
    my ($self, $x, $y, $z) = @_;
        $self->{newLine}->[0]->[0] = $self->{line}->[1]->[0];
        $self->{newLine}->[0]->[1] = $self->{line}->[1]->[1];
        $self->{newLine}->[1]->[0] = $x;
        $self->{newLine}->[1]->[1] = $y;
        $self->{tempLine} = $self->{line};
        $self->{line} = $self->{newLine};
        $self->{newLine} = $self->{tempLine};
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        my $currentLine = $self->{line};
        $self->{basicSetColorUtil}->setBasicColorP3($graphics, $self->getBasicColorP(), $self->getColor());
        $graphics->drawLine($currentLine->[0]->[0], $currentLine->[0]->[1], $currentLine->[1]->[0], $currentLine->[1]->[1]);
}


sub nextFrame {
    my ($self) = @_;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::Animation;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::ColorCompositeInterface;
use org::allbinary::layer::PositionInterface;
use org::allbinary::logic::NullUtil;

1;

