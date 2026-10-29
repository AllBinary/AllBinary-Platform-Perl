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

package org::allbinary::game::layer::TechnologyRTSInterfaceImageItem;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::item::ABCustomImageItem','org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{rtsInterface} = undef;
    $self->{primitiveLongUtil} = 'org::allbinary::logic::math::PrimitiveLongUtil'->createPowerOfTen(10000);
    $self->{LEVEL} = "Level";
    $self->{COST} = "Cost";
    $self->{DOLLAR} = "\$";
    $self->{myFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{costString} = 'org::allbinary::logic::java::character::CharArrayFactory'->getInstance()->getZeroCharArray();
    $self->{costLength} = 0;
    $self->{levelString} = 'org::allbinary::logic::java::character::CharArrayFactory'->getInstance()->getZeroCharArray();
    $self->{levelLength} = 0;
    $self->{adjustedCostLabelY} = 0;
    $self->{adjustedCostX} = 0;
    $self->{adjustedCostY} = 0;
    $self->{adjustedLevelX} = 0;
    $self->{adjustedLevelY} = 0;
}


sub new {
    my ($class, $label, $img, $layout, $altText, $basicColor, $rtsInterface) = @_;
    my $self = $class->SUPER::new($label, $img, $layout, $altText, $basicColor, 0);
    $self->_init_fields();
        # super(...) made $self above
        $self->{rtsInterface} = $rtsInterface;
        $self->update();
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        my $fontHeight = $font->getHeight();
        my $imageHeight = 0;
        my $image = $self->getImage();
        if ($image != $javax::microedition::lcdui::NullImage::NULL_IMAGE) {
            $imageHeight = $image->getHeight();
        }
        $self->{adjustedCostLabelY} = -$self->{yOffset} + $imageHeight - (3 * $fontHeight);
        $self->{adjustedCostY} = -$self->{yOffset} + $imageHeight - (2 * $fontHeight);
        $self->{adjustedCostX} = 2 + (length($self->{DOLLAR}) * ($fontHeight - 1));
        $self->{adjustedLevelY} = -$self->{yOffset} + $imageHeight - $fontHeight;
        $self->{adjustedLevelX} = 2 + (length($self->{LEVEL}) * ($fontHeight - 1));
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub getRtsInterface {
    my ($self) = @_;
        return $self->{rtsInterface};
}


sub update {
    my ($self) = @_;
        $self->{costString} = $self->{primitiveLongUtil}->getCharArray($self->getRtsInterface()->getUpgradeCost());
        $self->{levelString} = $self->{primitiveLongUtil}->getCharArray($self->getRtsInterface()->getLevel());
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->{myFontProcessor}->process($graphics);
        $self->SUPER::paintXY($graphics, $x, $y);
        my $xa = $x + 2;
        $graphics->drawString($self->{COST}, $xa, $y + $self->{adjustedCostLabelY}, 0);
        $graphics->drawString($self->{DOLLAR}, $xa, $y + $self->{adjustedCostY}, 0);
        $graphics->drawChars($self->{costString}, 0, $self->{costLength}, $x + $self->{adjustedCostX}, $y + $self->{adjustedCostY}, 0);
        $graphics->drawString($self->{LEVEL}, $xa, $y + $self->{adjustedLevelY}, 0);
        $graphics->drawChars($self->{levelString}, 0, $self->{levelLength}, $x + $self->{adjustedLevelX}, $y + $self->{adjustedLevelY}, 0);
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::NullImage;
use org::allbinary::graphics::form::item::ABCustomImageItem;
use org::allbinary::logic::java::character::CharArrayFactory;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::logic::math::PrimitiveLongUtil;

1;

