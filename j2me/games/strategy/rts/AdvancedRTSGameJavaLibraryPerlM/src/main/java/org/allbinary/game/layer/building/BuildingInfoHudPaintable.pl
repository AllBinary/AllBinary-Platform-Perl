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

package org::allbinary::game::layer::building::BuildingInfoHudPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::SelectionHudPaintable';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::game::layer::building::BuildingInfoHudPaintable'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{HEALTH} = "Health:";
    $self->{productivityHud} = undef unless exists $self->{productivityHud};
    $self->{efficiencyHud} = undef unless exists $self->{efficiencyHud};
    $self->{healthHud} = undef unless exists $self->{healthHud};
    $self->{maxHealthHud} = undef unless exists $self->{maxHealthHud};
    $self->{rtsLayer} = $org::allbinary::game::layer::NullPathFindingLayer::NULL_PATH_FINDING_LAYER;
    $self->{currentHealth} = 0;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::building::BuildingInfoHudPaintable::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
        my $numberStringHudFactory = 'org::allbinary::game::ag::layer::hud::basic::NumberStringHudFactory'->getInstance();
        my $productivityHud = $numberStringHudFactory->{NULL_NUMBER_STRING_HUD};
        my $efficiencyHud = $numberStringHudFactory->{NULL_NUMBER_STRING_HUD};
        my $healthHud = $numberStringHudFactory->{NULL_NUMBER_STRING_HUD};
        my $maxHealthHud = $numberStringHudFactory->{NULL_NUMBER_STRING_HUD};
        try {
            my $basicHudFactory = 'org::allbinary::game::graphics::hud::BasicHudFactory'->getInstance();
            my $basicColor = $self->getBasicColorP();
            my $textX = $self->{textX};
            my $y = $self->{y};
            $productivityHud = 'org::allbinary::game::layer::building::BuildingNumberHud'->new("Productivity:", 999, $basicHudFactory, $basicColor, $textX, $y, 1, 0, 1);
            $efficiencyHud = 'org::allbinary::game::layer::building::BuildingNumberHud'->new("Efficiency:", 999, $basicHudFactory, $basicColor, $textX, $y, 2, 0, 0);
            $healthHud = 'org::allbinary::game::layer::building::BuildingNumberHud'->new($self->{HEALTH}, 99999, $basicHudFactory, $basicColor, $textX, $y, 3, 0, 1);
            $maxHealthHud = 'org::allbinary::game::layer::building::BuildingNumberHud'->new("/ ", 99999, $basicHudFactory, $basicColor, $textX, $y, 3, length($self->{HEALTH}) + 1, 0);
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{CONSTRUCTOR}, $e);
        }
        $self->{productivityHud} = $productivityHud;
        $self->{efficiencyHud} = $efficiencyHud;
        $self->{healthHud} = $healthHud;
        $self->{maxHealthHud} = $maxHealthHud;
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        my $totalLength = length($self->{HEALTH}) + 'org::allbinary::logic::math::MathUtil'->getInstance()->getTotalDigits($self->{currentHealth});
        $self->{maxHealthHud}->setX($self->{textX} + 'org::allbinary::graphics::font::MyFontProcessor'->defaultStringWidth($font, $totalLength));
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
        $self->SUPER::setBasicColorP($basicColor);
        $self->{productivityHud}->setBasicColorP($basicColor);
        $self->{efficiencyHud}->setBasicColorP($basicColor);
        $self->{healthHud}->setBasicColorP($basicColor);
        $self->{maxHealthHud}->setBasicColorP($basicColor);
}


sub paint {
    my ($self, $graphics) = @_;
        $self->SUPER::paint($graphics);
        $self->{myFontProcessor}->process($graphics);
        $self->{productivityHud}->paint($graphics);
        $self->{efficiencyHud}->paint($graphics);
        $self->{healthHud}->paint($graphics);
        $self->{maxHealthHud}->paint($graphics);
        $self->getAnimationInterface()->paintXY($graphics, $self->{imageX}, $self->{y});
}


sub updateSelectionInfo {
    my ($self) = @_;
        my $buildingLayer = $self->{rtsLayer};
        $self->setName($buildingLayer->getName());
        $self->setAnimationInterface($buildingLayer->getVerticleBuildAnimationInterface());
        $self->{productivityHud}->set($buildingLayer->getProductivity());
        $self->{efficiencyHud}->set($buildingLayer->getEfficiency() / 100);
        $self->{currentHealth} = $buildingLayer->getHealthInterface()->getHealth();
        $self->{healthHud}->set($self->{currentHealth});
        $self->{myFontProcessor} = $self->{updateMyFontProcessor};
        $self->{maxHealthHud}->set($buildingLayer->getHealthInterface()->getMaxHealth());
}


sub setRtsLayer {
    my ($self, $rtsLayer) = @_;
        $self->{rtsLayer} = $rtsLayer;
}
{
    package org::allbinary::game::layer::building::BuildingNumberHud;
    use strict;
    use warnings;
    use feature 'try';
    no warnings 'experimental::try';
    use parent -norequire,'org::allbinary::game::ag::layer::hud::basic::NumberStringHud';
    

    sub _init_fields {
        my ($self) = @_;
        $self->{baseTextX} = undef unless exists $self->{baseTextX};
        $self->{baseY} = undef unless exists $self->{baseY};
        $self->{row} = undef unless exists $self->{row};
        $self->{prefixLength} = undef unless exists $self->{prefixLength};
        $self->{positionBeforeMeasurement} = undef unless exists $self->{positionBeforeMeasurement};
    }
    

    sub new {
        my ($class, $label, $maximum, $basicHudFactory, $basicColor, $baseTextX, $baseY, $row, $prefixLength, $positionBeforeMeasurement) = @_;
        my $self = $class->SUPER::new($label, $maximum, $basicHudFactory->{ABSOLUTE}, $basicHudFactory->{HORIZONTAL}, 0, $basicColor);
        _init_fields($self);
            # super(...) made $self above
            $self->{baseTextX} = $baseTextX;
            $self->{baseY} = $baseY;
            $self->{row} = $row;
            $self->{prefixLength} = $prefixLength;
            $self->{positionBeforeMeasurement} = $positionBeforeMeasurement;
        return $self;
    }
    

    sub updateMeasurement {
        my ($self, $graphics) = @_;
            if (!$self->{positionBeforeMeasurement}) {
                $self->SUPER::updateMeasurement($graphics);
            }
            my $font = $graphics->getFont();
            $self->{updateMaxWidth} = $self->{baseTextX} + $self->{prefixLength} * $font->getHeight();
            $self->{updateMaxHeight} = $self->{baseY} + $self->{row} * $font->getHeight();
            if ($self->{positionBeforeMeasurement}) {
                $self->SUPER::updateMeasurement($graphics);
            }
    }
    }


use java::lang::Object ();
use java::lang::LazyStatic ();
use javax::microedition::lcdui::Font ();
use javax::microedition::lcdui::Graphics ();
use org::allbinary::game::ag::layer::hud::basic::NumberStringHud ();
use org::allbinary::game::ag::layer::hud::basic::NumberStringHudFactory ();
use org::allbinary::game::layer::SelectionHudPaintable ();
use org::allbinary::string::CommonStrings ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::game::graphics::hud::BasicHudFactory ();
use org::allbinary::game::layer::NullPathFindingLayer ();
use org::allbinary::game::layer::PathFindingLayerInterface ();
use org::allbinary::graphics::color::BasicColor ();
use org::allbinary::graphics::font::MyFontProcessor ();
use org::allbinary::logic::math::MathUtil ();

1;

