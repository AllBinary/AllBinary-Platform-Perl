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

package org::allbinary::game::layer::geological::resources::GeologicalResourceInfoHudPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::waypoint::WaypointInfoHudPaintable';

our $RESOURCES = "Resources: ";

sub _init_fields {
    my ($self) = @_;
    $self->{keyvalueDrawString} = undef;
    $self->{fontHeight} = 0;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{keyvalueDrawString} = 'org::allbinary::graphics::draw::KeyValueDrawCharArray'->new($org::allbinary::game::layer::geological::resources::GeologicalResourceInfoHudPaintable::RESOURCES, $self->{textX});
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        $self->SUPER::updateMeasurement($graphics);
        my $font = $graphics->getFont();
        $self->{fontHeight} = (2 * $font->getHeight());
}


sub updateSelectionInfo {
    my ($self) = @_;
        $self->SUPER::updateSelectionInfo();
        my $rtsLayer = $self->{rtsLayerP};
        my $list = $rtsLayer->{geographicMapCellPositionAreaBase}->getOccupyingGeographicMapCellPositionList();
        my $total = 0;
        for (my $index = $list->size(); --$index >= 0; ) {
            my $geographicMapCellPosition = $list->get($index);
            $total += $geographicMapCellPosition->getGeologicalResource()->getTotal();
        }
        $self->{keyvalueDrawString}->update($self->getPrimitiveLongUtil()->getCharArray($total), $self->getPrimitiveLongUtil()->getCurrentTotalDigits());
}


sub paint {
    my ($self, $graphics) = @_;
        $self->SUPER::paint($graphics);
        $self->{keyvalueDrawString}->paint($graphics, ($self->{y} + $self->{fontHeight}));
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::layer::RTSLayer;
use org::allbinary::game::layer::waypoint::WaypointInfoHudPaintable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::graphics::draw::KeyValueDrawCharArray;

1;

