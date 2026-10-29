# 
# AllBinary Open License Version 1 
# Copyright (c) 2006 AllBinary 
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

package org::allbinary::game::layer::TileLayerItem;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::item::ABCustomItem','org::allbinary::graphics::form::item::ABCustomItemInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{tiledLayer} = undef;
}


sub new {
    my ($class, $label, $tiledLayer, $layout, $altText, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($label, $backgroundBasicColor, $foregroundBasicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->{tiledLayer} = $tiledLayer;
    return $self;
}


sub setOwner {
    my ($self, $owner) = @_;
}


sub getMinimumWidth {
    my ($self) = @_;
        return $self->{tiledLayer}->getWidth();
}


sub getMinimumHeight {
    my ($self) = @_;
        return $self->{tiledLayer}->getHeight();
}


sub getMinContentHeight {
    my ($self) = @_;
        return $self->{tiledLayer}->getHeight();
}


sub getMinContentWidth {
    my ($self) = @_;
        return $self->{tiledLayer}->getWidth();
}


sub getPrefContentHeight {
    my ($self, $width) = @_;
        return $self->{tiledLayer}->getHeight();
}


sub getPrefContentWidth {
    my ($self, $height) = @_;
        return $self->{tiledLayer}->getWidth();
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->{tiledLayer}->setPosition($x, $y, $self->{tiledLayer}->getZP());
        $self->{tiledLayer}->paint($graphics);
}


sub paintUnselected {
    my ($self, $graphics, $x, $y) = @_;
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Screen;
use org::allbinary::graphics::form::item::ABCustomItem;
use org::allbinary::graphics::form::item::ABCustomItemInterface;
use org::allbinary::graphics::color::BasicColor;

1;

