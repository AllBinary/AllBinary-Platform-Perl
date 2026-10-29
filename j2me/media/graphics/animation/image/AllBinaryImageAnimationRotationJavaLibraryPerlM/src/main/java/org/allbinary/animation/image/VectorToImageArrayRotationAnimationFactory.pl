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

package org::allbinary::animation::image::VectorToImageArrayRotationAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::BaseImageAnimationFactory';


sub _init_fields {
    my ($self) = @_;
    $self->{imageArray} = $javax::microedition::lcdui::NullImage::NULL_IMAGE_ARRAY;
    $self->{angleIncrement} = 0;
}


sub new {
    my ($class, $vectorInfo, $basicColor, $animationBehaviorFactory) = @_;
    my $self = $class->SUPER::new('org::allbinary::image::AnimationFrameToImageUtil'->getInstance()->getInstanceTranslate($vectorInfo->getWidth(), $vectorInfo->getHeight(), 'org::allbinary::animation::VectorAnimation'->createVectorAnimation($vectorInfo->getPoints(), $basicColor, $animationBehaviorFactory->getOrCreateInstance())), 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance(), 0, 0, 0, 0, $animationBehaviorFactory);
    $self->_init_fields();
        # super(...) made $self above
        $self->init();
    return $self;
}


# throws Exception
sub init {
    my ($self) = @_;
        my $angleFactory = 'org::allbinary::math::AngleFactory'->getInstance();
        $self->{angleIncrement} = $angleFactory->{TOTAL_ANGLE} / 'org::allbinary::game::configuration::GameConfigurationCentral'->getInstance()->getGameControlFidelity();
        $self->{imageArray} = 'org::allbinary::media::image::ImageToRotationImageArrayUtil'->getInstance()->generate($self->getImage(), $self->getAngleIncrement(), int($angleFactory->{TOTAL_ANGLE}));
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        if ($self->{animationFactoryInitializationVisitor}->{dx} != 0 || $self->{animationFactoryInitializationVisitor}->{dy} != 0) {
            return 'org::allbinary::animation::image::AdjustedImageArrayRotationAnimation'->new($self->{imageArray}, 'org::allbinary::math::AngleInfo'->getInstance(((int($self->getAngleIncrement()) + 32768) % 65536 - 32768)), int('org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE}), $self->{animationFactoryInitializationVisitor}->{dx}, $self->{animationFactoryInitializationVisitor}->{dy}, $self->{animationBehaviorFactory}->getOrCreateInstance());
        } else {
            return 'org::allbinary::animation::image::AdjustedImageArrayRotationAnimation'->createAnimation($self->{imageArray}, 'org::allbinary::math::AngleInfo'->getInstance(((int($self->{angleIncrement}) + 32768) % 65536 - 32768)), int('org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE}), $self->{animationBehaviorFactory}->getOrCreateInstance());
        }
}


sub getAngleIncrement {
    my ($self) = @_;
        return $self->{angleIncrement};
}


sub setInitialScale {
    my ($self, $scaleProperties) = @_;
}

# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::NullImage;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::animation::VectorAnimation;
use org::allbinary::game::configuration::GameConfigurationCentral;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::image::AnimationFrameToImageUtil;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::math::AngleFactory;
use org::allbinary::math::AngleInfo;
use org::allbinary::media::ScaleProperties;
use org::allbinary::media::image::ImageToRotationImageArrayUtil;
use org::allbinary::vector::VectorInfo;
use org::allbinary::animation::image::BaseImageAnimationFactory;
use org::allbinary::animation::image::AdjustedImageArrayRotationAnimation;

1;

