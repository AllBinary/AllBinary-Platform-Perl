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

package org::allbinary::game::layer::UpgradableRTSLayerHudPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::SelectionHudPaintable';

our $instance = 'org::allbinary::game::layer::UpgradableRTSLayerHudPaintable'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{PERCENT} = "%";
    $self->{rtsLayer} = 'org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer'->getNullInstance();
    $self->{costY} = 0;
    $self->{costY1} = 0;
    $self->{percentCompleteX2} = 0;
    $self->{rtsLayerCompositePaintableLateInit} = undef;
    $self->{charHeight} = 0;
    $self->{charWidth} = 0;
    $self->{percentComplete} = 0;
    $self->{percentCompleteX} = 0;
    $self->{percentCompleteArray} = 'org::allbinary::logic::java::character::CharArrayFactory'->getInstance()->getZeroCharArray();
    $self->{currentTotalDigits} = 0;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::UpgradableRTSLayerHudPaintable::instance;
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
        $self->{charHeight} = $font->getHeight();
        $self->{charWidth} = 'org::allbinary::graphics::font::MyFontProcessor'->defaultCharWidth($font);
}


sub update {
    my ($self) = @_;
        $self->SUPER::update();
        my $commonButtons = 'org::allbinary::input::motion::button::CommonButtons'->getInstance();
        $self->{costY} = ($self->{y} + $commonButtons->{STANDARD_BUTTON_SIZE});
        $self->{costY1} = ($self->{y} + $commonButtons->{STANDARD_BUTTON_SIZE} - $self->{charHeight});
        $self->{percentCompleteX2} = $self->{imageX} + $commonButtons->{STANDARD_BUTTON_SIZE} - $self->{charWidth};
        my $displayInfoSingleton = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        if ($displayInfoSingleton->getLastWidth() > 320) {
            $self->{rtsLayerCompositePaintableLateInit} = 'org::allbinary::game::layer::UpgradableWideRTSLayerPaintable'->new($self);
        } else {
            $self->{rtsLayerCompositePaintableLateInit} = 'org::allbinary::game::layer::RTSLayerCompositePaintable'->new($self);
        }
}


sub updateSelectionInfo {
    my ($self) = @_;
        my $rtsLayer = $self->getRtsLayer();
        $self->{rtsLayerCompositePaintableLateInit}->update($rtsLayer);
        $self->setAnimationInterface($rtsLayer->getVerticleBuildAnimationInterface());
        $self->setName($rtsLayer->getName());
}


sub updateInfo {
    my ($self) = @_;
        my $rtsLayer = $self->getRtsLayer();
        $self->{percentComplete} = $rtsLayer->getPercentComplete();
        if ($self->{percentComplete} < 10) {
            $self->{percentCompleteX} = 32;
        } elsif ($self->{percentComplete} < 100) {
            $self->{percentCompleteX} = 24;
        } else {
            $self->{percentCompleteX} = 16;
        }
        $self->{percentCompleteArray} = $self->getPrimitiveLongUtil()->getCharArray($self->{percentComplete});
        $self->{currentTotalDigits} = $self->getPrimitiveLongUtil()->getCurrentTotalDigits();
}


sub paint {
    my ($self, $graphics) = @_;
        $self->SUPER::paint($graphics);
        $self->{rtsLayerCompositePaintableLateInit}->paint($graphics);
        $graphics->drawChars($self->{percentCompleteArray}, 0, $self->{currentTotalDigits}, $self->{imageX} + $self->{percentCompleteX}, $self->{costY}, 0);
        $graphics->drawString($self->{PERCENT}, $self->{percentCompleteX2}, $self->{costY}, 0);
        $self->getAnimationInterface()->paintXY($graphics, $self->{imageX}, $self->{y});
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
use org::allbinary::game::layer::special::CollidableDestroyableDamageableLayer;
use org::allbinary::logic::java::character::CharArrayFactory;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::input::motion::button::CommonButtons;
use org::allbinary::game::layer::SelectionHudPaintable;
use org::allbinary::game::layer::RTSLayerCompositePaintable;
use org::allbinary::game::layer::UpgradableWideRTSLayerPaintable;

1;

