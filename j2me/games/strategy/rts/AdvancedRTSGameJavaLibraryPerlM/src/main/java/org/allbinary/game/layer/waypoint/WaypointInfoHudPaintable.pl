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

package org::allbinary::game::layer::waypoint::WaypointInfoHudPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::SelectionHudPaintable';


sub _init_fields {
    my ($self) = @_;
    $self->{keyvalueDrawString} = undef;
    $self->{rtsLayerP} = $org::allbinary::game::layer::NullPathFindingLayer::NULL_PATH_FINDING_LAYER;
    $self->{textLine2Y} = 0;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{keyvalueDrawString} = 'org::allbinary::graphics::draw::KeyValueDrawString'->new("Owner: ", $self->{textX});
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        $self->SUPER::updateMeasurement($graphics);
        my $font = $graphics->getFont();
        $self->{textLine2Y} = ($self->{y} + $font->getHeight());
}


sub updateSelectionInfo {
    my ($self) = @_;
        my $rtsLayer = $self->{rtsLayerP};
        $self->setName($rtsLayer->getName());
        $self->setAnimationInterface($rtsLayer->getVerticleBuildAnimationInterface());
        $self->{keyvalueDrawString}->update($rtsLayer->getParentLayer()->getName());
}


sub setRtsLayer {
    my ($self, $rtsLayer) = @_;
        $self->{rtsLayerP} = $rtsLayer;
}


sub getRtsLayer {
    my ($self) = @_;
        return $self->{rtsLayerP};
}


sub paint {
    my ($self, $graphics) = @_;
        $self->SUPER::paint($graphics);
        $self->{keyvalueDrawString}->paint($graphics, $self->{textLine2Y});
        $self->getAnimationInterface()->paintXY($graphics, $self->{imageX}, $self->{y});
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::layer::NullPathFindingLayer;
use org::allbinary::game::layer::PathFindingLayerInterface;
use org::allbinary::game::layer::RTSLayer;
use org::allbinary::game::layer::SelectionHudPaintable;
use org::allbinary::graphics::draw::KeyValueDrawString;

1;

