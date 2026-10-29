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

#AndroidToJ2ME
package org::allbinary::game::paint::OwnershipPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::graphics::paint::Paintable','org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{displayInfo} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
    $self->{myFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{COPYRIGHT} = "AllBinary Copyright (c) 2011";
    $self->{basicColor} = 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{WHITE};
    $self->{color} = int($self->{basicColor});
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
    $self->{COPYRIGHT_Y} = 0;
    $self->{beginWidth} = 0;
}


sub getInstance {
    my ($class) = @_;
        return 'org::allbinary::game::paint::OwnershipPaintable'->new();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->{COPYRIGHT_Y} = 2 * $font->getHeight();
        $self->{beginWidth} = (POSIX::floor(($font->stringWidth($self->{COPYRIGHT})) / (2 ** (1))));
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub setBasicColorP {
    my ($self, $basicColor) = @_;
        $self->{basicColor} = $basicColor;
        $self->{color} = int($basicColor);
}


sub getBasicColorP {
    my ($self) = @_;
        return $self->{basicColor};
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
        $graphics->setColor($self->{color});
        my $halfWidth = $self->{displayInfo}->getLastHalfWidth();
        my $height = $self->{displayInfo}->getLastHeight();
        $graphics->drawString($self->{COPYRIGHT}, $halfWidth - $self->{beginWidth}, $height - $self->{COPYRIGHT_Y}, $self->{anchor});
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::Anchor;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::graphics::paint::Paintable;
use org::allbinary::logic::communication::log::LogUtil;

1;

