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

#J2SEForJ2ME
package org::allbinary::game::paint::AboutPaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::graphics::paint::Paintable','org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{displayInfoSingleton} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
    $self->{ABOUT} = 'org::allbinary::graphics::displayable::CanvasStrings'->getInstance()->{ABOUT};
    $self->{info} = undef;
    $self->{developers} = undef;
    $self->{paintableArray} = [$self];
    $self->{myFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{charHeight} = 0;
    $self->{aboutBeginWidth} = 0;
    $self->{infoBeginWidth} = undef;
    $self->{developersBeginWidth} = undef;
    $self->{anchor} = $org::allbinary::graphics::Anchor::TOP_LEFT;
}


sub getInstance {
    my ($class, $info, $developers) = @_;
        return 'org::allbinary::game::paint::AboutPaintable'->new($info, $developers);
}


sub new {
    my ($class, $info, $developers) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{info} = $info;
        $self->{infoBeginWidth} = [(0) x (scalar(@{$self->{info}}))];
        $self->{developers} = $developers;
        $self->{developersBeginWidth} = [(0) x (scalar(@{$self->{developers}}))];
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->{charHeight} = $font->getHeight();
        $self->{aboutBeginWidth} = (POSIX::floor(($font->stringWidth($self->{ABOUT})) / (2 ** (1))));
        my $infoSize = scalar(@{$self->{info}});
        for (my $index = 0; $index < $infoSize; $index++) {
            $self->{infoBeginWidth}->[$index] = (POSIX::floor(($font->stringWidth($self->{info}->[$index])) / (2 ** (1))));
        }
        my $size = scalar(@{$self->{developers}});
        for (my $index = 0; $index < $size; $index++) {
            $self->{developersBeginWidth}->[$index] = (POSIX::floor(($font->stringWidth($self->{developers}->[$index])) / (2 ** (1))));
        }
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub getPaintableArrayInstance {
    my ($self) = @_;
        return $self->{paintableArray};
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
        my $halfWidth = $self->{displayInfoSingleton}->getLastHalfWidth();
        $graphics->drawString($self->{ABOUT}, $halfWidth - $self->{aboutBeginWidth}, 2 * $self->{charHeight}, $self->{anchor});
        my $infoSize = scalar(@{$self->{info}});
        for (my $index = 0; $index < $infoSize; $index++) {
            $graphics->drawString($self->{info}->[$index], $halfWidth - $self->{infoBeginWidth}->[$index], (4 + $index) * $self->{charHeight}, $self->{anchor});
        }
        my $size = scalar(@{$self->{developers}});
        for (my $index = 0; $index < $size; $index++) {
            $graphics->drawString($self->{developers}->[$index], $halfWidth - $self->{developersBeginWidth}->[$index], (5 + $infoSize + $index) * $self->{charHeight}, $self->{anchor});
        }
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::Anchor;
use org::allbinary::graphics::displayable::CanvasStrings;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::graphics::paint::Paintable;

1;

