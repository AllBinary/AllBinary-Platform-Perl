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

package org::allbinary::game::paint::ColorFillBasePaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::Paintable','org::allbinary::graphics::color::ColorCompositeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{basicColor} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE};
    $self->{colorP} = 0;
}


sub new {
    my ($class, $basicColor) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->setBasicColorP($basicColor);
    return $self;
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
        $self->{basicColor} = $basicColor;
        $self->setColor(int($self->getBasicColorP()));
}


sub getBasicColorP {
    my ($self) = @_;
        return $self->{basicColor};
}


sub getColor {
    my ($self) = @_;
        return $self->{colorP};
}


sub setColor {
    my ($self, $color) = @_;
        $self->{colorP} = $color;
}


sub paint {
    my ($self, $graphics) = @_;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::color::ColorCompositeInterface;
use org::allbinary::graphics::paint::Paintable;

1;

