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
package org::allbinary::animation::image::PooledImageArrayRotationAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use POSIX ();
use parent -norequire,'org::allbinary::animation::AnimationInterfaceFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{allBinaryImageRotationAnimationInfo} = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
    $self->{animationBehaviorFactory} = undef;
}


# throws Exception
sub createFactory {
    my ($class, $image, $animationBehaviorFactory) = @_;
        my $totalAngle = int('org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE});
        my $angleIncrement = ($totalAngle / 'org::allbinary::game::configuration::GameConfigurationCentral'->getInstance()->getGameControlFidelity());
        return 'org::allbinary::animation::image::PooledImageArrayRotationAnimationFactory'->new($image, $image->getWidth(), $image->getHeight(), -(POSIX::floor(($image->getWidth()) / (2 ** (2)))), -(POSIX::floor(($image->getHeight()) / (2 ** (2)))), $angleIncrement, $animationBehaviorFactory);
}


# throws Exception
sub createDXY {
    my ($class, $image, $dx, $dy, $animationBehaviorFactory) = @_;
        my $totalAngle = int('org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE});
        my $angleIncrement = ($totalAngle / 'org::allbinary::game::configuration::GameConfigurationCentral'->getInstance()->getGameControlFidelity());
        return 'org::allbinary::animation::image::PooledImageArrayRotationAnimationFactory'->new($image, $image->getWidth(), $image->getHeight(), $dx, $dy, $angleIncrement, $animationBehaviorFactory);
}


sub new {
    my ($class, $image, $width, $height, $dx, $dy, $angleIncrement, $animationBehaviorFactory) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{animationBehaviorFactory} = $animationBehaviorFactory;
        my $totalAngle = int('org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE});
        my $imageArray = 'org::allbinary::media::image::ImageToRotationImageArrayUtil'->getInstance()->generate($image, $angleIncrement, $totalAngle);
        $self->{allBinaryImageRotationAnimationInfo} = 'org::allbinary::animation::image::ImageArrayRotationAnimationInfo'->new($imageArray, $angleIncrement, $totalAngle, $dx, $dy);
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        return 'org::allbinary::animation::image::AdjustedImageArrayRotationAnimation'->createAdjustedImageArrayRotationAnimationInfo($self->{allBinaryImageRotationAnimationInfo}, $self->{animationBehaviorFactory}->getOrCreateInstance());
}


sub setInitialScale {
    my ($self, $scaleProperties) = @_;
}

# use javax::microedition::lcdui::Image;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::game::configuration::GameConfigurationCentral;
use org::allbinary::logic::NullUtil;
use org::allbinary::math::AngleFactory;
use org::allbinary::media::ScaleProperties;
use org::allbinary::media::image::ImageToRotationImageArrayUtil;
use org::allbinary::animation::image::ImageArrayRotationAnimationInfo;
use org::allbinary::animation::image::AdjustedImageArrayRotationAnimation;

1;

