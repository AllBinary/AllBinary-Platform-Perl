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

package org::allbinary::game::layer::hud::basic::VelocityWidget;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::graphics::hud::BasicHud';


sub _init_fields {
    my ($self) = @_;
    $self->{KILOMETERS_PER_HOUR_STR} = [" ", "k", "m", "/", "h"];
    $self->{totalChars} = scalar(@{$self->{KILOMETERS_PER_HOUR_STR}});
    $self->{velocity} = undef;
    $self->{maxVelocity} = undef;
    $self->{string} = 'org::allbinary::logic::math::PrimitiveLongSingleton'->getInstance()->{ZERO};
    $self->{totalDigits} = 1;
    $self->{powerOfTenVelocity} = undef;
    $self->{primitiveLongUtil} = undef;
    $self->{offset} = 0;
    $self->{offset2} = 0;
}


sub new {
    my ($class, $powerOfTenVelocity, $location, $direction, $basicColor) = @_;
    my $self = $class->SUPER::new($location, $direction, 2, $basicColor);
    $self->_init_fields();
        # super(...) made $self above
        $self->{powerOfTenVelocity} = $powerOfTenVelocity;
        $self->{maxVelocity} = $powerOfTenVelocity;
        $self->{velocity} = 0;
        $self->{primitiveLongUtil} = 'org::allbinary::logic::math::PrimitiveLongUtil'->createPowerOfTen($powerOfTenVelocity);
        $self->{updateMaxHeight} = 14;
    return $self;
}


sub updateMeasurement {
    my ($self, $graphics) = @_;
        my $font = $graphics->getFont();
        $self->{updateMaxWidth} = $font->getSize() * (5 + 'org::allbinary::logic::math::MathUtil'->getInstance()->getTotalDigits($self->{powerOfTenVelocity}) + 1);
        $self->SUPER::updateMeasurement($graphics);
        $self->{offset} = 'org::allbinary::graphics::font::MyFontProcessor'->defaultStringWidth($font, $self->{primitiveLongUtil}->getMaxDigits()) + 'org::allbinary::graphics::font::MyFontProcessor'->defaultStringWidth($font, 2);
        $self->{offset2} = $self->{offset} - 'org::allbinary::graphics::font::MyFontProcessor'->defaultStringWidth($font, $self->{totalDigits}) - 'org::allbinary::graphics::font::MyFontProcessor'->defaultStringWidth($font, 2);
}


sub get {
    my ($self) = @_;
        return $self->{velocity};
}


sub add {
    my ($self, $value) = @_;
        $self->set($self->{velocity} + $value);
}


sub set {
    my ($self, $value) = @_;
        my $lastVelocity = $self->{velocity};
        $self->{velocity} = $value;
        if ($self->{velocity} > $self->{maxVelocity}) {
            $self->{velocity} = 0;
        }
        if ($lastVelocity != $self->{velocity}) {
            $self->{string} = $self->{primitiveLongUtil}->getCharArray($self->{velocity} * 18);
            if ('org::allbinary::graphics::opengles::OpenGLFeatureUtil'->getInstance()->isAnyThreed()) {
                $self->{totalDigits} = $self->{primitiveLongUtil}->getCurrentTotalDigits() + 1;
            } else {
                $self->{totalDigits} = $self->{primitiveLongUtil}->getCurrentTotalDigits();
            }
            $self->{myFontProcessor} = $self->{updateMyFontProcessor};
        }
}


sub reduce {
    my ($self, $value) = @_;
        $self->set($self->{velocity} - $value);
}


sub paint {
    my ($self, $graphics) = @_;
        $self->SUPER::paintDXY($graphics, $self->{string}, 0, $self->{totalDigits}, $self->{KILOMETERS_PER_HOUR_STR}, 0, $self->{totalChars}, $self->{offset2}, $self->{offset});
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::graphics::opengles::OpenGLFeatureUtil;
use org::allbinary::game::graphics::hud::BasicHud;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::logic::math::MathUtil;
use org::allbinary::logic::math::PrimitiveLongSingleton;
use org::allbinary::logic::math::PrimitiveLongUtil;

1;

