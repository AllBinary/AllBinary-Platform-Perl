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

package org::allbinary::game::paint::help::HelpPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::graphics::paint::Paintable','org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{displayInfo} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
    $self->{updateMyFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{myFontProcessor} = $self->{updateMyFontProcessor};
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
    $self->{title} = undef;
    $self->{inputInfo} = 'org::allbinary::logic::string::StringUtil'->getInstance()->getArrayInstance();
    $self->{basicColor} = undef;
    $self->{titleBeginWidth} = 0;
    $self->{beginWidthArray} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY};
    $self->{charHeight} = 0;
}


sub new {
    my ($class, $title, $backgroundBasicColor, $basicColor) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{title} = $title;
        $self->{basicColor} = $basicColor;
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->{titleBeginWidth} = (POSIX::floor(($font->stringWidth($self->{title})) / (2 ** (1))));
        $self->{charHeight} = $font->getHeight();
        my $size = scalar(@{$self->{inputInfo}});
        for (my $index = 0; $index < $size; $index++) {
            $self->{beginWidthArray}->[$index] = (POSIX::floor(($font->stringWidth($self->{inputInfo}->[$index])) / (2 ** (1))));
        }
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub setInputInfoP {
    my ($self, $inputInfo) = @_;
        $self->{inputInfo} = $inputInfo;
        $self->{beginWidthArray} = [(0) x (scalar(@{$self->{inputInfo}}))];
        $self->{myFontProcessor} = $self->{updateMyFontProcessor};
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
        my $halfWidth = $self->{displayInfo}->getLastHalfWidth();
        $graphics->setColor(int($self->{basicColor}));
        $graphics->drawString($self->{title}, $halfWidth - $self->{titleBeginWidth}, $self->{charHeight}, $self->{anchor});
        my $size = scalar(@{$self->{inputInfo}});
        for (my $index = 0; $index < $size; $index++) {
            $graphics->drawString($self->{inputInfo}->[$index], $halfWidth - $self->{beginWidthArray}->[$index], ($index + 3) * $self->{charHeight}, $self->{anchor});
        }
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::Anchor;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::string::StringUtil;

1;

