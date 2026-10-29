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

#SwtToJ2ME
package org::allbinary::game::paint::FullScreenPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::graphics::paint::Paintable','org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{displayInfo} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
    $self->{myFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{FULLSCREEN_TEXT} = "F11 - Toggle Fullscreen";
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
    $self->{Y} = 0;
    $self->{beginWidth} = 0;
}


sub getInstance {
    my ($class) = @_;
        return 'org::allbinary::game::paint::FullScreenPaintable'->new();
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
        $self->{Y} = 4 * $font->getHeight();
        $self->{beginWidth} = (POSIX::floor(($font->stringWidth($self->{FULLSCREEN_TEXT})) / (2 ** (1))));
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
        my $halfWidth = $self->{displayInfo}->getLastHalfWidth();
        my $height = $self->{displayInfo}->getLastHeight();
        $graphics->drawString($self->{FULLSCREEN_TEXT}, $halfWidth - $self->{beginWidth}, $height - $self->{Y}, $self->{anchor});
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::Anchor;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::graphics::paint::Paintable;

1;

