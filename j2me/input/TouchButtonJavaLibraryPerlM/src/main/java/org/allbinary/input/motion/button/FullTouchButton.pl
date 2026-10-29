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

package org::allbinary::input::motion::button::FullTouchButton;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::input::motion::button::TouchButton';



# throws Exception
sub createButton {
    my ($class, $touchButtonInput, $touchButtonResource, $rawRectangle, $cellPosition, $xBorder, $yBorder) = @_;
        return 'org::allbinary::input::motion::button::FullTouchButton'->new($touchButtonInput, 'org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory'->getInstance()->get($touchButtonResource->{RESOURCE})->getInstance(0), 'org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory'->getInstance()->get($touchButtonResource->{HINT})->getInstance(0), $rawRectangle, $cellPosition, $xBorder, $yBorder);
}


sub new {
    my ($class, $touchButtonInput, $animationInterface, $hintAnimationInterface, $rawRectangle, $cellPosition, $xBorder, $yBorder) = @_;
    my $self = $class->SUPER::new($touchButtonInput, $animationInterface, $hintAnimationInterface, $rawRectangle, $cellPosition, $xBorder, $yBorder);
        # super(...) made $self above
    return $self;
}


sub updateRectangle {
    my ($self) = @_;
        try {
            my $pointFactory = 'org::allbinary::graphics::PointFactory'->getInstance();
            my $x = $self->{rawRectangle}->getWidth() * $self->{cellPositionP}->getColumn();
            my $y = $self->{rawRectangle}->getHeight() * $self->{cellPositionP}->getRow();
            $self->{rectangleP} = 'org::allbinary::graphics::Rectangle'->new($pointFactory->createXY($x, $y), $self->{rawRectangle}->getWidth() + (2 * $self->{xBorder}), $self->{rawRectangle}->getHeight() + (2 * $self->{yBorder}));
            my $point = $self->{rectangleP}->getPoint();
            $self->{animationX} = $point->getX() + $self->{xBorder};
            $self->{animationY} = $point->getY() + $self->{yBorder};
            $self->{hintAnimationY} = POSIX::floor(($self->{animationY} - $self->{rectangleP}->getHeight()) / (2 ** (1)));
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "updateRectangle", $e);
        }
}

use org::allbinary::animation::Animation;
use org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory;
use org::allbinary::graphics::CellPosition;
use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::input::motion::button::TouchButton;

1;

