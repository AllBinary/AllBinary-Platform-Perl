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

package org::allbinary::animation::image::AllBinaryFlickerAndroidImageRotationAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::AnimationInterfaceFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{image} = $javax::microedition::lcdui::NullImage::NULL_IMAGE;
    $self->{angleIncrement} = undef;
    $self->{animationBehaviorFactory} = undef;
}


sub new {
    my ($class, $image, $width, $height, $angleIncrement, $animationBehaviorFactory) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setImage($image);
        $self->{angleIncrement} = $angleIncrement;
        $self->{animationBehaviorFactory} = $animationBehaviorFactory;
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        my $image = 'org::allbinary::media::image::ImageCopyUtil'->getInstance()->createImage($self->getImage());
        return 'org::allbinary::animation::image::AllBinaryFlickerAndroidImageRotationAnimation'->new($self->getImage(), $image, 'org::allbinary::math::AngleInfo'->getInstance($self->{angleIncrement}), 'org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE}, $self->{animationBehaviorFactory}->getOrCreateInstance());
}


sub getAngleIncrement {
    my ($self) = @_;
        return $self->{angleIncrement};
}


sub setImage {
    my ($self, $image) = @_;
        $self->{image} = $image;
}


sub getImage {
    my ($self) = @_;
        return $self->{image};
}


sub setInitialScale {
    my ($self, $scaleProperties) = @_;
}

# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::NullImage;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::media::image::ImageCopyUtil;
use org::allbinary::math::AngleFactory;
use org::allbinary::math::AngleInfo;
use org::allbinary::media::ScaleProperties;
use org::allbinary::animation::image::AllBinaryFlickerAndroidImageRotationAnimation;

1;

