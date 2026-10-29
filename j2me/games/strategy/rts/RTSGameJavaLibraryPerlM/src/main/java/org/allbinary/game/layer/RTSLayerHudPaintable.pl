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

package org::allbinary::game::layer::RTSLayerHudPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::SelectionHudPaintable','org::allbinary::graphics::font::UpdateMyFontInterface';

our $instance = 'org::allbinary::game::layer::RTSLayerHudPaintable'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{weaponProperties} = 'org::allbinary::logic::string::StringUtil'->getInstance()->getArrayInstance();
    $self->{rtsLayer} = 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance();
    $self->{costY} = 0;
    $self->{costY1} = 0;
    $self->{fontHeight} = 0;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::RTSLayerHudPaintable::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        $self->SUPER::updateMeasurement($graphics);
        my $font = $graphics->getFont();
        $self->{fontHeight} = $font->getHeight();
        $self->{costY1} = ($self->{y} + ((scalar(@{$self->{weaponProperties}}) + 1) * $self->{fontHeight}));
        if (!'org::allbinary::AndroidUtil'->isAndroid()) {
            $self->{costY} = $self->{costY1};
        } else {
            $self->{costY} = ($self->{y} + ((scalar(@{$self->{weaponProperties}}) + 2) * $self->{fontHeight}));
        }
}


sub updateSelectionInfo {
    my ($self) = @_;
        $self->setName($self->getRtsLayer()->getName());
        my $partInterface = $self->getRtsLayer()->getPartInterfaceArray()->[0];
        $self->{weaponProperties} = $partInterface->getWeaponProperties()->toStringArray();
        $self->{myFontProcessor} = $self->{updateMyFontProcessor};
}


sub paint {
    my ($self, $graphics) = @_;
        $self->SUPER::paint($graphics);
        my $size = scalar(@{$self->{weaponProperties}});
        for (my $index = 0; $index < $size; $index++) {
            $graphics->drawString($self->{weaponProperties}->[$index], $self->{textX}, $self->{y} + (($index + 1) * $self->{fontHeight}), 0);
        }
}


sub setRtsLayer {
    my ($self, $rtsLayer) = @_;
        $self->{rtsLayer} = $rtsLayer;
}


sub getRtsLayer {
    my ($self) = @_;
        return $self->{rtsLayer};
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::AndroidUtil;
use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::game::part::weapon::BasicWeaponPart;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::game::layer::SelectionHudPaintable;

1;

