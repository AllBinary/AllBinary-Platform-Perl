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

package org::allbinary::game::part::CountedLayersHudPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::PaintableInterface','org::allbinary::graphics::font::UpdateMyFontInterface';

our $XXStringWidth = 0;

sub _init_fields {
    my ($self) = @_;
    $self->{displayInfoSingleton} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
    $self->{partInterfaceArray} = undef;
    $self->{countedTotalStringColor} = undef;
    $self->{countedPartsBorder} = undef;
    $self->{startIndex} = undef;
    $self->{dropSize} = undef;
    $self->{myFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{height} = 0;
}


sub new {
    my ($class, $partInterfaceArray, $dropSize, $startIndex, $countedTotalStringColor, $countedPartsBorder) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{partInterfaceArray} = $partInterfaceArray;
        $self->{startIndex} = $startIndex;
        $self->{countedTotalStringColor} = $countedTotalStringColor;
        $self->{countedPartsBorder} = $countedPartsBorder;
        $self->{dropSize} = $dropSize;
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->{height} = $font->getHeight();
        if ($self->{dropSize} > $font->getHeight()) {
            $self->{height} = $self->{dropSize};
        }
        if ($org::allbinary::game::part::CountedLayersHudPaintable::XXStringWidth == 0) {
            my $XXString = "XX";
            $org::allbinary::game::part::CountedLayersHudPaintable::XXStringWidth = $font->stringWidth($XXString);
        }
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
        my $lastWidth = $self->{displayInfoSingleton}->getLastWidth();
        my $widthEdge = $lastWidth - $self->{dropSize};
        my $size = scalar(@{$self->{partInterfaceArray}});
        my $count = 0;
        my $y = 0;
        my $countedLayerInterfaceFactory = undef;
        my $pickedUpLayerInterfaceFactoryInterface = undef;
        my $layerInterface = undef;
        my $charArray = undef;
        for (my $index = $self->{startIndex}; $index < $size; $index++) {
            $countedLayerInterfaceFactory = $self->{partInterfaceArray}->[$index];
            if ($countedLayerInterfaceFactory->getTotal() > 0) {
                $pickedUpLayerInterfaceFactoryInterface = $countedLayerInterfaceFactory->getCountedPickedUpLayerInterfaceFactory();
                $layerInterface = $pickedUpLayerInterfaceFactoryInterface->getIconLayer();
                $y = 40 + ($count * $self->{height});
                $layerInterface->setPosition($widthEdge, $y, $layerInterface->getZP());
                $layerInterface->paint($graphics);
                $graphics->setColor($self->{countedTotalStringColor});
                $countedLayerInterfaceFactory->paint($graphics);
                $charArray = $countedLayerInterfaceFactory->getTotalString();
                $graphics->drawChars($charArray, 0, scalar(@{$charArray}), $widthEdge - $countedLayerInterfaceFactory->getXOffset(), $y, 0);
                $count++;
            }
        }
        if ($count > 0) {
            $graphics->setColor($self->{countedPartsBorder});
            $graphics->drawRect($lastWidth - ($org::allbinary::game::part::CountedLayersHudPaintable::XXStringWidth + $self->{dropSize}), 40, $org::allbinary::game::part::CountedLayersHudPaintable::XXStringWidth + $self->{dropSize}, ($count * $self->{height}) + 3);
        }
}


sub paintThreed {
    my ($self, $graphics) = @_;
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::layer::pickup::PickedUpLayerInterfaceFactoryInterface;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::graphics::paint::PaintableInterface;
use org::allbinary::layer::AllBinaryLayer;

1;

