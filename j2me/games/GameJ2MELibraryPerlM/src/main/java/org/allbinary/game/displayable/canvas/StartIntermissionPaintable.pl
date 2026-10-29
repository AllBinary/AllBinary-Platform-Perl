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

package org::allbinary::game::displayable::canvas::StartIntermissionPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::graphics::paint::InitUpdatePaintable','org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{fontDebugFactory} = 'org::allbinary::graphics::font::FontDebugFactory'->getInstance();
    $self->{basicSetColorUtil} = 'org::allbinary::graphics::color::BasicColorSetUtil'->getInstance();
    $self->{gameCanvas} = undef;
    $self->{stringArray} = undef;
    $self->{fontSize} = undef;
    $self->{font} = undef;
    $self->{lastWidth} = undef;
    $self->{updateMyFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{myFontProcessor} = $self->{updateMyFontProcessor};
    $self->{basicColor} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{BLACK};
    $self->{color} = undef;
    $self->{lineYOffsetArray} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY};
    $self->{hasChanged} = 1;
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
    $self->{fontHeightP} = 0;
    $self->{BEGIN_LEVEL} = "Begin Level ";
    $self->{EMPTY_STRING} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub new {
    my ($class, $gameCanvas, $stringArray, $basicColor, $font) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{gameCanvas} = $gameCanvas;
        $self->{stringArray} = $stringArray;
        $self->{lastWidth} = [(0) x (scalar(@{$self->{stringArray}}))];
        $self->setBasicColorP($basicColor);
        $self->{color} = int($basicColor);
        $self->{fontSize} = $font->getSize();
        $self->{font} = $font;
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->{fontHeightP} = $font->getHeight();
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
        my $existingFont = $graphics->getFont();
        $self->{fontDebugFactory}->setFont($self->{font}, $graphics);
        my $displayInfo = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
        $self->{basicSetColorUtil}->setBasicColorP3($graphics, $self->{basicColor}, $self->{color});
        my $beginWidth = 0;
        for (my $index = scalar(@{$self->{lineYOffsetArray}}) - 1; $index >= 0; $index--) {
            if ($self->{hasChanged}) {
                $self->{lastWidth}->[$index] = (POSIX::floor(($graphics->getFont()->stringWidth($self->{stringArray}->[$index])) / (2 ** (1))));
            }
            $beginWidth = $self->{lastWidth}->[$index];
            $graphics->drawString($self->{stringArray}->[$index], $displayInfo->getLastHalfWidth() - $beginWidth, $displayInfo->getLastHalfHeight() - $self->{lineYOffsetArray}->[$index], $self->{anchor});
        }
        $self->{hasChanged} = 0;
        $self->{fontDebugFactory}->setFont($existingFont, $graphics);
}


sub update {
    my ($self) = @_;
        my $level = $self->{gameCanvas}->getLayerManager()->getGameInfo()->getCurrentLevel();
        $self->{stringArray}->[0] = 'org::allbinary::logic::string::StringMaker'->new()->append($self->{BEGIN_LEVEL})->appendint($level)->toString();
        for (my $index = scalar(@{$self->{stringArray}}) - 1; $index >= 1; $index--) {
            $self->{stringArray}->[$index] = $self->{EMPTY_STRING};
        }
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
        $self->{basicColor} = $basicColor;
}


sub getBasicColorP {
    my ($self) = @_;
        return $self->{basicColor};
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::Anchor;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::color::BasicColorSetUtil;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::font::FontDebugFactory;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::graphics::paint::InitUpdatePaintable;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;

1;

