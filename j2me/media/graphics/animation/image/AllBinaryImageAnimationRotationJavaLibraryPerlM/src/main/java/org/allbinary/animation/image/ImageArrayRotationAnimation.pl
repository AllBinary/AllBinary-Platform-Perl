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

package org::allbinary::animation::image::ImageArrayRotationAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::ImageArrayBaseRotationAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{expectedTotalFrames} = 0;
}


# throws Exception
sub createAnimation {
    my ($class, $anyType, $animationBehavior) = @_;
        my $imageRotationAnimationInfo = $anyType;
        return 'org::allbinary::animation::image::ImageArrayRotationAnimation'->new($imageRotationAnimationInfo->getImageArray(), $imageRotationAnimationInfo->getAngleInfoP(), $imageRotationAnimationInfo->getTotalAngle(), $animationBehavior);
}


sub new {
    my ($class, $imageArray, $angleInfo, $totalAngle, $animationBehavior) = @_;
    my $self = $class->SUPER::new($imageArray, $angleInfo, $animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->init($imageArray, $angleInfo, $totalAngle);
    return $self;
}


# throws Exception
sub init {
    my ($self, $imageArray, $angleInfo, $totalAngle) = @_;
        $self->{expectedTotalFrames} = $totalAngle / $self->{angleInfo}->getAngleIncrementInfo()->getAngleIncrement();
        $self->{angleInfo}->adjustAngle(0);
        if ($self->{expectedTotalFrames} != $self->getSize()) {
            die ("Wrong Number of Frames");
        }
}


sub setImageArray {
    my ($self, $imageArray) = @_;
        $self->SUPER::setImageArray($imageArray);
        $self->{angleInfo}->adjustAngle(0);
}

# use javax::microedition::lcdui::Image;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::math::AngleInfo;
use org::allbinary::animation::image::ImageArrayBaseRotationAnimation;

1;

