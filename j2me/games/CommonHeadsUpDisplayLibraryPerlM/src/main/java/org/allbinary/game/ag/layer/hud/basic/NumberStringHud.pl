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

package org::allbinary::game::ag::layer::hud::basic::NumberStringHud;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::graphics::hud::BasicHud','org::allbinary::graphics::paint::PaintableInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{primitiveLongUtil} = undef;
    $self->{prependString} = undef;
    $self->{PREPEND_STRING} = undef;
    $self->{value} = undef;
    $self->{max} = undef;
    $self->{offset} = 0;
    $self->{valueString} = undef;
    $self->{valueTotalDigits} = 0;
}


sub new {
    my ($class, $prependString, $max, $location, $direction, $bufferZone, $basicColor) = @_;
    my $self = $class->SUPER::new($location, $direction, $bufferZone, $basicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->{prependString} = $prependString;
        $self->{PREPEND_STRING} = [split(//, $prependString)];
        $self->{valueString} = 'org::allbinary::logic::math::PrimitiveLongSingleton'->getInstance()->{NUMBER_CHAR_ARRAYS}->[0];
        $self->{primitiveLongUtil} = 'org::allbinary::logic::math::PrimitiveLongUtil'->createPowerOfTen($max + 1);
        $self->{max} = $max;
        $self->{value} = 0;
        if ($direction == 0) {
            die ('org::allbinary::game::graphics::hud::BasicHudFactory'->getInstance()->{DIRECTION_EXCEPTION});
        }
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->{offset} = $font->stringWidth($self->{prependString}) + 'org::allbinary::graphics::font::MyFontProcessor'->defaultCharWidth($font);
        $self->SUPER::updateMeasurement($graphics);
}


sub get {
    my ($self) = @_;
        return $self->{value};
}


sub add {
    my ($self, $value) = @_;
        $self->set($self->{value} + $value);
}


sub set {
    my ($self, $value) = @_;
        $self->{value} = $value;
        if ($self->{value} > $self->{max}) {
            $self->{value} = 0;
        }
        $self->{valueString} = $self->{primitiveLongUtil}->getCharArray($self->{value});
        $self->{valueTotalDigits} = $self->{primitiveLongUtil}->getCurrentTotalDigits();
}


sub reduce {
    my ($self, $value) = @_;
        $self->set($self->{value} - $value);
}


sub paint {
    my ($self, $graphics) = @_;
        $self->SUPER::paintDX($graphics, $self->{PREPEND_STRING}, 0, scalar(@{$self->{PREPEND_STRING}}), $self->{valueString}, 0, $self->{valueTotalDigits}, $self->{offset});
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->{myFontProcessor}->process($graphics);
        my $charArray = $self->{PREPEND_STRING};
        my $len = scalar(@{$self->{PREPEND_STRING}});
        my $charArray2 = $self->{valueString};
        my $len2 = $self->{valueTotalDigits};
        $self->{basicSetColorUtil}->setBasicColorP($graphics, $self->getBasicColorP());
        $graphics->drawChars($charArray, 0, $len, $x, $y, 0);
        $graphics->drawChars($charArray2, 0, $len2, $x - $self->{offset}, $y, 0);
}


sub paintThreed {
    my ($self, $graphics) = @_;
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::game::graphics::hud::BasicHud;
use org::allbinary::game::graphics::hud::BasicHudFactory;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::paint::PaintableInterface;
use org::allbinary::logic::math::PrimitiveLongSingleton;
use org::allbinary::logic::math::PrimitiveLongUtil;

1;

