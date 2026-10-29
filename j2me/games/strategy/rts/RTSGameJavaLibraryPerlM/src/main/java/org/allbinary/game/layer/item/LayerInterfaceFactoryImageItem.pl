# 
# AllBinary Open License Version 1 
# Copyright (c) 2003 AllBinary 
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

package org::allbinary::game::layer::item::LayerInterfaceFactoryImageItem;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::item::ABCustomImageItem';


sub _init_fields {
    my ($self) = @_;
    $self->{animationArray} = undef;
    $self->{layerInterfaceFactoryInterface} = undef;
}


sub new {
    my ($class, $label, $img, $layout, $altText, $basicColor, $animationArray, $layerInterfaceFactoryInterface) = @_;
    my $self = $class->SUPER::new($label, $img, $layout, $altText, $basicColor, 0);
    $self->_init_fields();
        # super(...) made $self above
        $self->{animationArray} = $animationArray;
        $self->{layerInterfaceFactoryInterface} = $layerInterfaceFactoryInterface;
    return $self;
}


sub getLayerInterfaceFactoryInterface {
    my ($self) = @_;
        return $self->{layerInterfaceFactoryInterface};
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->SUPER::paintXY($graphics, $x, $y);
        for (my $index = scalar(@{$self->{animationArray}}); --$index >= 0; ) {
            $self->{animationArray}->[$index]->paintXY($graphics, $x, $y);
        }
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
use org::allbinary::graphics::form::item::ABCustomImageItem;
use org::allbinary::animation::Animation;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::layer::LayerInterfaceFactoryInterface;

1;

