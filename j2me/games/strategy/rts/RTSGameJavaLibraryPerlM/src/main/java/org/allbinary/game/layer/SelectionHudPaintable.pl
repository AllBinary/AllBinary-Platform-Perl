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

package org::allbinary::game::layer::SelectionHudPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::InitUpdatePaintable','org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{y} = 'org::allbinary::input::motion::button::CommonButtons'->getInstance()->{STANDARD_BUTTON_SIZE} + 17;
    $self->{primitiveLongUtil} = undef;
    $self->{updateMyFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{myFontProcessor} = $self->{updateMyFontProcessor};
    $self->{x} = 0;
    $self->{textX} = 0;
    $self->{imageX} = 0;
    $self->{basicColor} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLACK};
    $self->{color} = 0;
    $self->{width} = 0;
    $self->{height} = 0;
    $self->{name} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{animationInterface} = 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0);
    $self->{backgroundColor} = int('org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{GREY});
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->update();
        $self->{primitiveLongUtil} = 'org::allbinary::logic::math::PrimitiveLongUtil'->createPowerOfTen(10000);
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $commonButtons = 'org::allbinary::input::motion::button::CommonButtons'->getInstance();
        my $font = $graphics->getFont();
        $self->setHeight($commonButtons->{STANDARD_BUTTON_SIZE} + $font->getHeight());
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub update {
    my ($self) = @_;
        my $commonButtons = 'org::allbinary::input::motion::button::CommonButtons'->getInstance();
        my $touchButtonLocationHelper = 'org::allbinary::input::motion::button::TouchButtonLocationHelper'->new();
        my $displayInfoSingleton = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        $self->{x} = $commonButtons->{STANDARD_BUTTON_SIZE} + $touchButtonLocationHelper->getColumnsRemainderHalf();
        $self->{textX} = $self->getX() + 4;
        $self->{width} = $displayInfoSingleton->getLastWidth() - $self->getX() * 2;
        $self->{imageX} = $self->getWidth() + $touchButtonLocationHelper->getColumnsRemainderHalf() - 10;
        $self->{myFontProcessor} = $self->{updateMyFontProcessor};
}


sub updateSelectionInfo {
    my ($self) = @_;
}


sub updateInfo {
    my ($self) = @_;
}


sub getPrimitiveLongUtil {
    my ($self) = @_;
        return $self->{primitiveLongUtil};
}


sub setAnimationInterface {
    my ($self, $animationInterface) = @_;
        $self->{animationInterface} = $animationInterface;
}


sub getAnimationInterface {
    my ($self) = @_;
        return $self->{animationInterface};
}


sub setName {
    my ($self, $name) = @_;
        $self->{name} = $name;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
        $self->{basicColor} = $basicColor;
        $self->setColor(int($basicColor));
}


sub getBasicColorP {
    my ($self) = @_;
        return $self->{basicColor};
}


sub setColor {
    my ($self, $color) = @_;
        $self->{color} = $color;
}


sub getColor {
    my ($self) = @_;
        return $self->{color};
}


sub getWidth {
    my ($self) = @_;
        return $self->{width};
}


sub setHeight {
    my ($self, $height) = @_;
        $self->{height} = $height;
}


sub getHeight {
    my ($self) = @_;
        return $self->{height};
}


sub getX {
    my ($self) = @_;
        return $self->{x};
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
        $graphics->setColor($self->{backgroundColor});
        $graphics->drawRect($self->getX(), $self->{y}, $self->getWidth(), $self->getHeight());
        $graphics->setColor($self->getColor());
        $graphics->drawString($self->getName(), $self->{textX}, $self->{y}, 0);
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::animation::Animation;
use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::graphics::paint::InitUpdatePaintable;
use org::allbinary::input::motion::button::CommonButtons;
use org::allbinary::input::motion::button::TouchButtonLocationHelper;
use org::allbinary::logic::math::PrimitiveLongUtil;

1;

