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

package org::allbinary::game::displayable::canvas::BasicPaintablesCanvas;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::displayable::canvas::GameCommandCanvas';


sub _init_fields {
    my ($self) = @_;
    $self->{paintableArray} = undef;
    $self->{colorFillPaintable} = undef;
}


sub new {
    my ($class, $cmdListener, $name, $allBinaryGameLayerManager, $paintableArray) = @_;
    my $self = $class->SUPER::new($cmdListener, $name, $allBinaryGameLayerManager->getBackgroundBasicColor(), $allBinaryGameLayerManager->getForegroundBasicColor());
    $self->_init_fields();
        # super(...) made $self above
        $self->{paintableArray} = $paintableArray;
        $self->{colorFillPaintable} = 'org::allbinary::game::paint::ColorFillPaintableFactory'->getInstance()->getInstance($allBinaryGameLayerManager->getBackgroundBasicColor(), 0);
    return $self;
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{colorFillPaintable}->paint($graphics);
        $graphics->setColor($self->{foregroundColor});
        for (my $index = scalar(@{$self->{paintableArray}}) - 1; $index >= 0; $index--) {
            $self->{paintableArray}->[$index]->paint($graphics);
        }
        $self->SUPER::paint($graphics);
}

# use javax::microedition::lcdui::CommandListener;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::layer::AllBinaryGameLayerManager;
use org::allbinary::game::paint::ColorFillBasePaintable;
use org::allbinary::game::paint::ColorFillPaintableFactory;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::game::displayable::canvas::GameCommandCanvas;

1;

