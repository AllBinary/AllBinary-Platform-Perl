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

our $instance = 'org::allbinary::game::layer::building::BuildingInfoHudPaintable'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{HEALTH} = "Health:";
    $self->{productivityHud} = undef;
    $self->{efficiencyHud} = undef;
    $self->{healthHud} = undef;
    $self->{maxHealthHud} = undef;
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
    $self->_init_fields();
        my $numberStringHudFactory = 'org::allbinary::game::ag::layer::hud::basic::NumberStringHudFactory'->getInstance();
        my $productivityHud = $numberStringHudFactory->{NULL_NUMBER_STRING_HUD};
        my $efficiencyHud = $numberStringHudFactory->{NULL_NUMBER_STRING_HUD};
        my $healthHud = $numberStringHudFactory->{NULL_NUMBER_STRING_HUD};
        my $maxHealthHud = $numberStringHudFactory->{NULL_NUMBER_STRING_HUD};
        try {
            my $index = 0;
            my $basicHudFactory = 'org::allbinary::game::graphics::hud::BasicHudFactory'->getInstance();
            my $basicColor = $self->getBasicColorP();
            my $textX = $self->{textX};
            my $y = $self->{y};
            my $firstIndex = $index;
            {
            package org::allbinary::game::layer::building::ProductivityNumberStringHud;
            use strict;
            use warnings;
            use feature 'try';
            no warnings 'experimental::try';
            use parent -norequire,'org::allbinary::game::ag::layer::hud::basic::NumberStringHud';
            
            

            sub new {
                my ($class) = @_;
                my $self = $class->SUPER::new("Productivity:", 999, $self->{basicHudFactory}->{ABSOLUTE}, $self->{basicHudFactory}->{HORIZONTAL}, 0, $self->{basicColor});
                    # super(...) made $self above
                return $self;
            }
            

            sub updateMeasurement {
                my ($self, $graphics) = @_;
                    my $font = $graphics->getFont();
                    $self->{updateMaxWidth} = $self->{textX};
                    $self->{updateMaxHeight} = $self->{y} + (($self->{firstIndex} + 1) * $font->getHeight());
                    $self->SUPER::updateMeasurement($graphics);
            }
            }

            $productivityHud = 'org::allbinary::game::layer::building::ProductivityNumberStringHud'->new();
            $index++;
            my $secondIndex = $index;
            {
            package org::allbinary::game::layer::building::EfficiencyNumberStringHud;
            use strict;
            use warnings;
            use feature 'try';
            no warnings 'experimental::try';
            use parent -norequire,'org::allbinary::game::ag::layer::hud::basic::NumberStringHud';
            
            

            sub new {
                my ($class) = @_;
                my $self = $class->SUPER::new("Efficiency:", 999, $self->{basicHudFactory}->{ABSOLUTE}, $self->{basicHudFactory}->{HORIZONTAL}, 0, $self->{basicColor});
                    # super(...) made $self above
                return $self;
            }
            

            sub updateMeasurement {
                my ($self, $graphics) = @_;
                    $self->SUPER::updateMeasurement($graphics);
                    my $font = $graphics->getFont();
                    $self->{updateMaxWidth} = $self->{textX};
                    $self->{updateMaxHeight} = $self->{y} + (($self->{secondIndex} + 1) * $font->getHeight());
            }
            }

            $efficiencyHud = 'org::allbinary::game::layer::building::EfficiencyNumberStringHud'->new();
            $index++;
            my $HEALTH = $self->{HEALTH};
            my $thirdIndex = $index;
            {
            package org::allbinary::game::layer::building::HealthNumberStringHud;
            use strict;
            use warnings;
            use feature 'try';
            no warnings 'experimental::try';
            use parent -norequire,'org::allbinary::game::ag::layer::hud::basic::NumberStringHud';
            
            

            sub new {
                my ($class) = @_;
                my $self = $class->SUPER::new($self->{HEALTH}, 99999, $self->{basicHudFactory}->{ABSOLUTE}, $self->{basicHudFactory}->{HORIZONTAL}, 0, $self->{basicColor});
                    # super(...) made $self above
                return $self;
            }
            

            sub updateMeasurement {
                my ($self, $graphics) = @_;
                    my $font = $graphics->getFont();
                    $self->{updateMaxWidth} = $self->{textX};
                    $self->{updateMaxHeight} = $self->{y} + (($self->{thirdIndex} + 1) * $font->getHeight());
                    $self->SUPER::updateMeasurement($graphics);
            }
            }

            my $totalLength = length($HEALTH) + 1;
            $healthHud = 'org::allbinary::game::layer::building::HealthNumberStringHud'->new();
            my $fourthIndex = $index;
            {
            package org::allbinary::game::layer::building::MaxHealthNumberStringHud;
            use strict;
            use warnings;
            use feature 'try';
            no warnings 'experimental::try';
            use parent -norequire,'org::allbinary::game::ag::layer::hud::basic::NumberStringHud';
            
            

            sub new {
                my ($class) = @_;
                my $self = $class->SUPER::new("/ ", 99999, $self->{basicHudFactory}->{ABSOLUTE}, $self->{basicHudFactory}->{HORIZONTAL}, 0, $self->{basicColor});
                    # super(...) made $self above
                return $self;
            }
            

            sub updateMeasurement {
                my ($self, $graphics) = @_;
                    $self->SUPER::updateMeasurement($graphics);
                    my $font = $graphics->getFont();
                    $self->{updateMaxWidth} = $self->{textX} + ($self->{totalLength} * $font->getHeight());
                    $self->{updateMaxHeight} = $self->{y} + (($self->{fourthIndex} + 1) * $font->getHeight());
            }
            }

            $maxHealthHud = 'org::allbinary::game::layer::building::MaxHealthNumberStringHud'->new();
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

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::ag::layer::hud::basic::NumberStringHud;
use org::allbinary::game::ag::layer::hud::basic::NumberStringHudFactory;
use org::allbinary::game::layer::SelectionHudPaintable;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::game::graphics::hud::BasicHudFactory;
use org::allbinary::game::layer::NullPathFindingLayer;
use org::allbinary::game::layer::PathFindingLayerInterface;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::logic::math::MathUtil;

1;

