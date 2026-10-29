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

package org::allbinary::game::layer::item::RTSLayerCostAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::Animation','org::allbinary::game::rts::technology::event::TechEventListenerInterface','org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{primitiveLongUtil} = 'org::allbinary::logic::math::PrimitiveLongUtil'->createPowerOfTen(10000);
    $self->{DOLLAR} = "\$";
    $self->{image} = undef;
    $self->{layerInterfaceFactoryInterface} = undef;
    $self->{myFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{costString} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_CHAR_ARRAY};
    $self->{len} = 0;
    $self->{adjustedCostX} = 0;
    $self->{fontHeight} = 0;
}


sub new {
    my ($class, $image, $layerInterfaceFactoryInterface) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{image} = $image;
        $self->{layerInterfaceFactoryInterface} = $layerInterfaceFactoryInterface;
        $self->update();
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->{fontHeight} = $font->getHeight();
        $self->{adjustedCostX} = $font->stringWidth($self->{DOLLAR});
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub onEvent {
    my ($self, $event) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


sub onTechEvent {
    my ($self, $event) = @_;
        try {
            $self->update();
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "onTechEvent", $e);
        }
}


# throws Exception
sub update {
    my ($self) = @_;
        $self->{len} = 0;
        $self->{costString} = $self->{primitiveLongUtil}->getCharArray($self->{layerInterfaceFactoryInterface}->getCost());
        $self->{len} = $self->{primitiveLongUtil}->getCurrentTotalDigits();
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->{myFontProcessor}->process($graphics);
        $self->SUPER::paintXY($graphics, $x, $y);
        my $adjustedCostY = $self->{image}->getHeight() - $self->{fontHeight};
        my $xa = $x + 2;
        $graphics->drawString($self->{DOLLAR}, $xa, $y + $adjustedCostY, 0);
        $graphics->drawChars($self->{costString}, 0, $self->{len}, $x + $self->{adjustedCostX}, $y + $adjustedCostY, 0);
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
use org::allbinary::game::layer::CostLayerInterfaceFactoryInterface;
use org::allbinary::game::rts::technology::event::TechEventListenerInterface;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::animation::Animation;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::math::PrimitiveLongUtil;
use org::allbinary::logic::util::event::EventStrings;

1;

