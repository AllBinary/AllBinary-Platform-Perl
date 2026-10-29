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

package org::allbinary::game::displayable::canvas::GamePerformanceInitUpdatePaintable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::paint::InitUpdatePaintable','org::allbinary::graphics::font::UpdateMyFontInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{halfHeight} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance()->getLastHalfHeight();
    $self->{yArray} = [$self->{halfHeight} + 30, $self->{halfHeight} + 30, $self->{halfHeight} + 30 + 15, $self->{halfHeight} + 30 + 15, $self->{halfHeight} + 30 + 30, $self->{halfHeight} + 30 + 30, $self->{halfHeight} + 30 + 45, $self->{halfHeight} + 30 + 45];
    $self->{myFontProcessor} = 'org::allbinary::graphics::font::UpdateMyFontProcessor'->new($self);
    $self->{baseRefreshHelperCharArray} = [map { [("\0") x (0)] } 1 .. (0)];
    $self->{defaultStringWidth} = 0;
    $self->{RED} = int('org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{RED});
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
        $self->{defaultStringWidth} = 'org::allbinary::graphics::font::MyFontProcessor'->defaultStringWidth($font, 2);
        $self->{myFontProcessor} = 'org::allbinary::graphics::font::MyFontProcessor'->getInstance();
}


sub init {
    my ($self) = @_;
}


sub update {
    my ($self) = @_;
        $self->{baseRefreshHelperCharArray} = 'org::allbinary::canvas::GameStatisticsFactory'->getInstance()->to2DCharArray();
}


sub paint {
    my ($self, $graphics) = @_;
        $self->{myFontProcessor}->process($graphics);
        $graphics->setColor($self->{RED});
        my $charArray = undef;
        my $charArray2 = undef;
        my $size2 = 0;
        my $size3 = 0;
        my $size = scalar(@{$self->{baseRefreshHelperCharArray}}) - 2;
        for (my $index = $size; $index >= 0; $index -= 2) {
            $charArray = $self->{baseRefreshHelperCharArray}->[$index];
            $charArray2 = $self->{baseRefreshHelperCharArray}->[$index + 1];
            $size2 = scalar(@{$charArray});
            $size3 = scalar(@{$charArray2});
            $graphics->drawChars($charArray, 0, $size2, 0, $self->{yArray}->[$index], 0);
            $graphics->drawChars($charArray2, 0, $size3, $size2 * $self->{defaultStringWidth}, $self->{yArray}->[$index + 1], 0);
        }
}

# use javax::microedition::lcdui::Font;
# use javax::microedition::lcdui::Graphics;
use org::allbinary::canvas::GameStatisticsFactory;
use org::allbinary::graphics::color::BasicColorFactory;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use org::allbinary::graphics::font::MyFontProcessor;
use org::allbinary::graphics::font::UpdateMyFontInterface;
use org::allbinary::graphics::font::UpdateMyFontProcessor;
use org::allbinary::graphics::paint::InitUpdatePaintable;

1;

