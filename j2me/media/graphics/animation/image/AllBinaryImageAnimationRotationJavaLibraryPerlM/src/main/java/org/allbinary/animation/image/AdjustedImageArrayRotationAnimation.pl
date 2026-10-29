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

#TWB - Adjustments should be done in the resource creation and not at the animation level
package org::allbinary::animation::image::AdjustedImageArrayRotationAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::animation::image::ImageArrayRotationAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{dx} = 0;
    $self->{dy} = 0;
}


# throws Exception
sub createAdjustedImageArrayRotationAnimationInfo {
    my ($class, $anyType, $animationBehavior) = @_;
        my $imageRotationAnimationInfo = $anyType;
        return 'org::allbinary::animation::image::AdjustedImageArrayRotationAnimation'->new($imageRotationAnimationInfo->getImageArray(), $imageRotationAnimationInfo->getAngleInfoP(), $imageRotationAnimationInfo->getTotalAngle(), $imageRotationAnimationInfo->getDx(), $imageRotationAnimationInfo->getDy(), $animationBehavior);
}


# throws Exception
sub createAnimation {
    my ($class, $imageArray, $angleInfo, $totalAngle, $animationBehavior) = @_;
        return 'org::allbinary::animation::image::AdjustedImageArrayRotationAnimation'->new($imageArray, $angleInfo, $totalAngle, -(POSIX::floor(($imageArray->[0]->getWidth()) / (2 ** (2)))), -(POSIX::floor(($imageArray->[0]->getHeight()) / (2 ** (2)))), $animationBehavior);
}


sub new {
    my ($class, $imageArray, $angleInfo, $totalAngle, $dx, $dy, $animationBehavior) = @_;
    my $self = $class->SUPER::new($imageArray, $angleInfo, $totalAngle, $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->init($dx, $dy);
    return $self;
}


# throws Exception
sub init {
    my ($self, $dx, $dy) = @_;
        $self->setDx($dx);
        $self->setDy($dy);
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        $self->SUPER::paintXY($graphics, $x + $self->{dx}, $y + $self->{dy});
}


sub setDx {
    my ($self, $dx) = @_;
        $self->{dx} = $dx;
}


sub getDx {
    my ($self) = @_;
        return $self->{dx};
}


sub setDy {
    my ($self, $dy) = @_;
        $self->{dy} = $dy;
}


sub getDy {
    my ($self) = @_;
        return $self->{dy};
}

# use javax::microedition::lcdui::Graphics;
# use javax::microedition::lcdui::Image;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::math::AngleInfo;
use org::allbinary::animation::image::ImageArrayRotationAnimation;

1;

