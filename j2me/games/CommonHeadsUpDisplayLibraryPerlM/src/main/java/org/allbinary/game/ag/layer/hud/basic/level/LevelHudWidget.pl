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

package org::allbinary::game::ag::layer::hud::basic::level::LevelHudWidget;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::graphics::hud::BasicHud','org::allbinary::graphics::paint::PaintableInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{level} = undef unless exists $self->{level};
    $self->{maxlevel} = undef unless exists $self->{maxlevel};
    $self->{levelString} = undef unless exists $self->{levelString};
    $self->{levelNumberCharArray} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_CHAR_ARRAY};
    $self->{levelNumberTotalDigits} = 0 unless exists $self->{levelNumberTotalDigits};
    $self->{offset} = 0 unless exists $self->{offset};
    $self->{primitiveLongUtil} = undef unless exists $self->{primitiveLongUtil};
}


# throws Exception
sub createHud {
    my ($class, $maxlevel, $location, $direction) = @_;
        return 'org::allbinary::game::ag::layer::hud::basic::level::LevelHudWidget'->new($maxlevel, $location, $direction);
}


sub new {
    my ($class, $maxlevel, $location, $direction) = @_;
    my $self = $class->SUPER::new($location, $direction, 2, 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{GREY});
    _init_fields($self);
        # super(...) made $self above
        $self->{primitiveLongUtil} = 'org::allbinary::logic::math::PrimitiveLongUtil'->createPowerOfTen(1000);
        my $LEVEL = "Lv ";
        $self->{levelString} = [split(//, $LEVEL)];
        $self->{maxlevel} = $maxlevel;
        $self->{level} = $maxlevel;
        $self->update();
        $self->{updateMaxHeight} = 14;
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->{updateMaxWidth} = $font->getSize() * 4;
        $self->{offset} = $font->charsWidth($self->{levelString}, 0, scalar(@{$self->{levelString}})) + $font->getSize();
        $self->SUPER::updateMeasurement($graphics);
}


sub update {
    my ($self) = @_;
        $self->{levelNumberCharArray} = $self->{primitiveLongUtil}->getCharArray($self->{level});
        $self->{levelNumberTotalDigits} = $self->{primitiveLongUtil}->getCurrentTotalDigits();
}


sub setLevel {
    my ($self, $level) = @_;
        $self->{level} = $level;
        $self->update();
}


sub nextLevel {
    my ($self) = @_;
        $self->{level}++;
        $self->update();
}


sub previousLevel {
    my ($self) = @_;
        $self->{level}--;
        if ($self->{level} < 0) {
            $self->{level} = 0;
        }
        $self->update();
}


sub isComplete {
    my ($self) = @_;
        if ($self->{level} <= $self->{maxlevel}) {
            return 0;
        } else {
            return 1;
        }
}


sub paint {
    my ($self, $graphics) = @_;
        $self->SUPER::paintDX($graphics, $self->{levelString}, 0, scalar(@{$self->{levelString}}), $self->{levelNumberCharArray}, 0, $self->{levelNumberTotalDigits}, $self->{offset});
}


sub paintThreed {
    my ($self, $graphics) = @_;
}

use java::lang::Object ();
use javax::microedition::lcdui::Font ();
use javax::microedition::lcdui::Graphics ();
use org::allbinary::game::graphics::hud::BasicHud ();
use org::allbinary::graphics::color::BasicColorFactory ();
use org::allbinary::graphics::paint::PaintableInterface ();
use org::allbinary::logic::NullUtil ();
use org::allbinary::logic::math::PrimitiveLongUtil ();

1;

