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

package org::allbinary::game::ag::layer::hud::basic::time::TimeHudWidget;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::graphics::hud::BasicHud';


sub _init_fields {
    my ($self) = @_;
    $self->{TIME_STRING} = "Time ";
    $self->{TIME_CHAR_ARRAY} = ["T", "i", "m", "e", " "];
    $self->{offset} = 0;
    $self->{string} = 'org::allbinary::logic::math::PrimitiveLongSingleton'->getInstance()->{ZERO};
    $self->{totalDigits} = 1;
    $self->{timer} = undef;
}


# throws Exception
sub getInstance {
    my ($class, $location, $direction, $basicColor, $timer) = @_;
        return 'org::allbinary::game::ag::layer::hud::basic::time::TimeHudWidget'->new($location, $direction, 2, $basicColor, $timer);
}


sub new {
    my ($class, $location, $direction, $bufferZone, $basicColor, $timer) = @_;
    my $self = $class->SUPER::new($location, $direction, $bufferZone, $basicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->{timer} = $timer;
        $self->set();
        $self->{updateMaxHeight} = 14;
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->{updateMaxWidth} = $font->getSize() * 5;
        $self->{offset} = $font->stringWidth($self->{TIME_STRING}) + 'org::allbinary::graphics::font::MyFontProcessor'->defaultStringWidth($font, 3);
        $self->SUPER::updateMeasurement($graphics);
}


sub update {
    my ($self) = @_;
        $self->{timer}->update();
        $self->set();
}


sub set {
    my ($self) = @_;
        $self->{string} = $self->{timer}->getTimeChars();
        $self->{totalDigits} = $self->{timer}->getCurrentTotalDigits();
}


sub getTimer {
    my ($self) = @_;
        return $self->{timer};
}


sub paint {
    my ($self, $graphics) = @_;
        $self->SUPER::paintDX($graphics, $self->{TIME_CHAR_ARRAY}, 0, scalar(@{$self->{TIME_CHAR_ARRAY}}), $self->{string}, 0, $self->{totalDigits}, $self->{offset});
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::graphics::hud::BasicHud;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::logic::math::PrimitiveLongSingleton;

1;

