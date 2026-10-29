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

package org::allbinary::animation::vector::AdjustedCircleAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::animation::vector::CircleAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{xAdjustment} = 0;
    $self->{yAdjustment} = 0;
}


sub createAnimation {
    my ($class, $width, $height, $xAdjustment, $yAdjustment, $basicColor) = @_;
        my $adjustedCircleAnimation = 'org::allbinary::animation::vector::AdjustedCircleAnimation'->new($width, $height, $basicColor);
        $adjustedCircleAnimation->initXY($xAdjustment, $yAdjustment);
        return $adjustedCircleAnimation;
}


sub createW {
    my ($class, $width, $height, $innerWidth, $basicColor) = @_;
        my $adjustedCircleAnimation = 'org::allbinary::animation::vector::AdjustedCircleAnimation'->new($width, $height, $basicColor);
        $adjustedCircleAnimation->init($innerWidth);
        return $adjustedCircleAnimation;
}


sub new {
    my ($class, $width, $height, $basicColor) = @_;
    my $self = $class->SUPER::new($width, $height, $basicColor);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub initXY {
    my ($self, $xAdjustment, $yAdjustment) = @_;
        $self->{xAdjustment} = $xAdjustment;
        $self->{yAdjustment} = $yAdjustment;
}


sub init {
    my ($self, $innerWidth) = @_;
        if ('org::allbinary::AndroidUtil'->isAndroid()) {
            my $widthPortion = (int(((int($innerWidth / 3)) * 10) / 7));
            $self->{xAdjustment} = -((POSIX::floor(($self->{width}) / (2 ** (1)))) - $widthPortion);
            $self->{yAdjustment} = $self->{xAdjustment};
        } else {
            $self->{xAdjustment} = -((POSIX::floor(($self->{width}) / (2 ** (1)))) - $innerWidth);
            $self->{yAdjustment} = $self->{xAdjustment};
        }
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->{basicSetColorUtil}->setBasicColorP3($graphics, $self->getBasicColorP(), $self->getColor());
        $graphics->drawArc($x + $self->{xAdjustment}, $y + $self->{yAdjustment}, $self->{width}, $self->{height}, 0, $self->{TOTAL_ANGLE});
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::AndroidUtil;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::animation::vector::CircleAnimation;

1;

