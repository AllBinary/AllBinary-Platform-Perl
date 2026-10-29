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

package org::allbinary::graphics::form::CommandCurrentSelectionForm;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::form::ScrollCurrentSelectionForm','org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{selectedAnimationArray} = [(undef) x (16)];
    $self->{unSelectedAnimationArray} = [(undef) x (16)];
}


sub new {
    my ($class, $title, $items, $border, $moveForSmallScreen, $backgroundBasicColor, $foregroundBasicColor) = @_;
    my $self = $class->SUPER::new($title, $items, 'org::allbinary::graphics::form::ItemPaintableFactory'->getInstance(), $border, -3, $moveForSmallScreen, $backgroundBasicColor, $foregroundBasicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->initAnimations();
        $self->addAll($items);
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        $self->updateAll($graphics, $self->getAllitems());
        $self->SUPER::updateMeasurement($graphics);
}


sub initAnimations {
    my ($self) = @_;
        my $nullAnimation = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0);
        for (my $index = scalar(@{$self->{selectedAnimationArray}}); --$index >= 0; ) {
            $self->{selectedAnimationArray}->[$index] = $nullAnimation;
        }
        for (my $index = scalar(@{$self->{unSelectedAnimationArray}}); --$index >= 0; ) {
            $self->{unSelectedAnimationArray}->[$index] = $nullAnimation;
        }
}


sub addAll {
    my ($self, $items) = @_;
        for (my $index = scalar(@{$items}); --$index >= 0; ) {
            $self->addAt($index, $items->[$index]);
        }
}


sub addAt {
    my ($self, $index, $item) = @_;
        my $basicColorFactory = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance();
        my $buttonColor = $basicColorFactory->{TRANSPARENT_GREY};
        my $selectedButtonColor = $basicColorFactory->{TRANSPARENT_RED};
        my $width = $item->getMinimumWidth();
        my $height = $item->getMinimumHeight();
        my $adjustedBorder = 3;
        my $offset = -($self->{halfBorder} + $adjustedBorder);
        my $rectWidth = $width + $self->{border} - $adjustedBorder;
        my $rectHeight = $height + $self->{border} - $adjustedBorder;
        if ('org::allbinary::J2MEUtil'->isJ2ME() || 'org::allbinary::J2MEUtil'->isHTML()) {
            $self->{selectedAnimationArray}->[$index] = 'org::allbinary::animation::vector::RectangleAdjustedAnimation'->new($rectWidth, $rectHeight, $offset, $offset, $selectedButtonColor);
        } else {
            $self->{selectedAnimationArray}->[$index] = 'org::allbinary::animation::vector::RectangleFilledAdjustedAnimation'->new($rectWidth, $rectHeight, $offset, $offset, $selectedButtonColor);
        }
        $adjustedBorder = 4;
        if ('org::allbinary::J2MEUtil'->isJ2ME() || 'org::allbinary::J2MEUtil'->isHTML()) {
            $self->{unSelectedAnimationArray}->[$index] = 'org::allbinary::animation::vector::RectangleAdjustedAnimation'->new($rectWidth, $rectHeight, $offset, $offset, $buttonColor);
        } else {
            $self->{unSelectedAnimationArray}->[$index] = 'org::allbinary::animation::vector::RectangleFilledAdjustedAnimation'->new($rectWidth, $rectHeight, $offset, $offset, $buttonColor);
        }
}


sub updateAll {
    my ($self, $graphics, $items) = @_;
        for (my $index = scalar(@{$items}); --$index >= 0; ) {
            $items->[$index]->preMeasurement($graphics);
            $self->updateAt($index, $items->[$index]);
        }
}


sub updateAt {
    my ($self, $index, $item) = @_;
        my $basicColorFactory = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance();
        my $buttonColor = $basicColorFactory->{TRANSPARENT_GREY};
        my $selectedButtonColor = $basicColorFactory->{TRANSPARENT_RED};
        my $width = $item->getMinimumWidth();
        my $height = $item->getMinimumHeight();
        my $adjustedBorder = 3;
        my $offset = -($self->{halfBorder} + $adjustedBorder);
        my $rectWidth = $width + $self->{border} - $adjustedBorder;
        my $rectHeight = $height + $self->{border} - $adjustedBorder;
        if ('org::allbinary::J2MEUtil'->isJ2ME() || 'org::allbinary::J2MEUtil'->isHTML()) {
            my $rectangleAdjustedAnimation = $self->{selectedAnimationArray}->[$index];
            $rectangleAdjustedAnimation->setWidth($rectWidth);
            $rectangleAdjustedAnimation->setHeight($rectHeight);
            $rectangleAdjustedAnimation->setOffsetX($offset);
            $rectangleAdjustedAnimation->setOffsetY($offset);
            $rectangleAdjustedAnimation->setBasicColorP($selectedButtonColor);
        } else {
            my $rectangleAdjustedAnimation = $self->{selectedAnimationArray}->[$index];
            $rectangleAdjustedAnimation->setWidth($rectWidth);
            $rectangleAdjustedAnimation->setHeight($rectHeight);
            $rectangleAdjustedAnimation->setOffsetX($offset);
            $rectangleAdjustedAnimation->setOffsetY($offset);
            $rectangleAdjustedAnimation->setBasicColorP($selectedButtonColor);
        }
        $adjustedBorder = 4;
        if ('org::allbinary::J2MEUtil'->isJ2ME() || 'org::allbinary::J2MEUtil'->isHTML()) {
            my $rectangleAdjustedAnimation = $self->{unSelectedAnimationArray}->[$index];
            $rectangleAdjustedAnimation->setWidth($rectWidth);
            $rectangleAdjustedAnimation->setHeight($rectHeight);
            $rectangleAdjustedAnimation->setOffsetX($offset);
            $rectangleAdjustedAnimation->setOffsetY($offset);
            $rectangleAdjustedAnimation->setBasicColorP($buttonColor);
        } else {
            my $rectangleAdjustedAnimation = $self->{unSelectedAnimationArray}->[$index];
            $rectangleAdjustedAnimation->setWidth($rectWidth);
            $rectangleAdjustedAnimation->setHeight($rectHeight);
            $rectangleAdjustedAnimation->setOffsetX($offset);
            $rectangleAdjustedAnimation->setOffsetY($offset);
            $rectangleAdjustedAnimation->setBasicColorP($buttonColor);
        }
}


sub getSelectedCommand {
    my ($self) = @_;
        my $index = $self->SUPER::getSelectedIndex();
        my $commandTextItem = $self->get($index);
        return $commandTextItem->getCommand();
}


sub append {
    my ($self, $item) = @_;
        my $result = $self->SUPER::append($item);
        $self->addAt($result, $item);
        return $result;
}


sub delete {
    my ($self, $itemNum) = @_;
        $self->SUPER::delete($itemNum);
}


sub deleteAll {
    my ($self) = @_;
        $self->initAnimations();
        $self->SUPER::deleteAll();
}


sub insert {
    my ($self, $itemNum, $item) = @_;
        $self->SUPER::insert($itemNum, $item);
}


sub set {
    my ($self, $itemNum, $item) = @_;
        $self->SUPER::set($itemNum, $item);
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
        $self->SUPER::paint($graphics);
}


# throws Exception
sub paintItem {
    my ($self, $graphics, $index, $item, $x, $y) = @_;
        $self->{selectedAnimationArray}->[$index]->paintXY($graphics, $x, $y);
        return $self->SUPER::paintItem($graphics, $index, $item, $x, $y);
}


# throws Exception
sub paintUnselectedItem {
    my ($self, $graphics, $index, $item, $x, $y) = @_;
        $self->{unSelectedAnimationArray}->[$index]->paintXY($graphics, $x, $y);
        return $self->SUPER::paintUnselectedItem($graphics, $index, $item, $x, $y);
}

# use javax::microedition::lcdui::Command;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::J2MEUtil;
use org::allbinary::animation::Animation;
use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::animation::vector::RectangleAdjustedAnimation;
use org::allbinary::animation::vector::RectangleFilledAdjustedAnimation;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::form::item::CommandTextItem;
use org::allbinary::graphics::form::item::ABCustomItem;
use org::allbinary::graphics::form::ScrollCurrentSelectionForm;
use org::allbinary::graphics::form::ItemPaintableFactory;

1;

