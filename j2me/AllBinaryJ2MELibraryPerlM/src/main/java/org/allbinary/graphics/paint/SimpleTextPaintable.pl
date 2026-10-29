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

package org::allbinary::graphics::paint::SimpleTextPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::graphics::paint::Paintable','org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{displayInfoSingleton} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
    $self->{updateMyFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{myFontProcessor} = $self->{updateMyFontProcessor};
    $self->{text} = undef;
    $self->{basicColor} = undef;
    $self->{topScoresWidth} = 0;
    $self->{fontHeight} = 0;
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
}


sub new {
    my ($class, $text, $basicColor) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{text} = $text;
        $self->{basicColor} = $basicColor;
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->{topScoresWidth} = (POSIX::floor(($font->stringWidth($self->{text})) / (2 ** (1))));
        $self->{fontHeight} = $font->getHeight();
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
        my $width = $self->{displayInfoSingleton}->getLast()->[$self->{displayInfoSingleton}->{WIDTH}];
        $graphics->setColor(int($self->getBasicColorP()));
        $graphics->drawString($self->{text}, (POSIX::floor(($width) / (2 ** (1)))) - $self->{topScoresWidth}, $self->{fontHeight}, $self->{anchor});
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
        $self->{basicColor} = $basicColor;
}


sub getBasicColorP {
    my ($self) = @_;
        return $self->{basicColor};
}


sub setText {
    my ($self, $text) = @_;
        $self->{text} = $text;
        $self->{myFontProcessor} = $self->{updateMyFontProcessor};
}


sub getText {
    my ($self) = @_;
        return $self->{text};
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

1;

