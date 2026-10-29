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

package org::allbinary::animation::image::AllBinaryHTMLImageRotationAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::BaseImageAnimationFactory';


sub _init_fields {
    my ($self) = @_;
    $self->{angleIncrement} = undef;
}


# throws Exception
sub createFactoryADXY {
    my ($class, $image, $width, $height, $dx, $dy, $angleIncrement, $animationBehaviorFactory) = @_;
        my $htmlImageRotationAnimationFactory = 'org::allbinary::animation::image::AllBinaryHTMLImageRotationAnimationFactory'->new($image, $width, $height, $angleIncrement, $animationBehaviorFactory);
        $htmlImageRotationAnimationFactory->init($dx, $dy);
        return $htmlImageRotationAnimationFactory;
}


sub new {
    my ($class, $image, $width, $height, $angleIncrement, $animationBehaviorFactory) = @_;
    my $self = $class->SUPER::new($image, 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance(), $width, $height, 0, 0, $animationBehaviorFactory);
    $self->_init_fields();
        # super(...) made $self above
        $self->{angleIncrement} = $angleIncrement;
    return $self;
}


sub init {
    my ($self, $dx, $dy) = @_;
        $self->{animationFactoryInitializationVisitor}->{dx} = $dx;
        $self->{animationFactoryInitializationVisitor}->{dy} = $dy;
        $self->{animationFactoryInitializationVisitor}->{originalDx} = $dx;
        $self->{animationFactoryInitializationVisitor}->{originalDy} = $dy;
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        my $scaledImage = $self->{animationFactoryImageScaleUtil}->createImage($self->getImage(), $self->{animationFactoryInitializationVisitor}->{width}, $self->{animationFactoryInitializationVisitor}->{height}, $self->{scaleProperties}->{scaleWidth}, $self->{scaleProperties}->{scaleHeight});
        my $copyOfScaledImage = 'org::allbinary::media::image::ImageCopyUtil'->getInstance()->createImage($scaledImage);
        if ($self->{animationFactoryInitializationVisitor}->{dx} != 0 || $self->{animationFactoryInitializationVisitor}->{dy} != 0) {
            $self->{animationFactoryImageScaleUtil}->processAdjust($self);
            return 'org::allbinary::animation::image::AllBinaryAdjustedHTMLImageRotationAnimation'->new($scaledImage, $copyOfScaledImage, 'org::allbinary::math::AngleInfo'->getInstance($self->getAngleIncrement()), 'org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE}, $self->{animationFactoryInitializationVisitor}->{dx}, $self->{animationFactoryInitializationVisitor}->{dy}, $self->{animationBehaviorFactory}->getOrCreateInstance());
        } else {
            return 'org::allbinary::animation::image::AllBinaryHTMLImageRotationAnimation'->new($scaledImage, $copyOfScaledImage, 'org::allbinary::math::AngleInfo'->getInstance($self->{angleIncrement}), 'org::allbinary::math::AngleFactory'->getInstance()->{TOTAL_ANGLE}, $self->{animationBehaviorFactory}->getOrCreateInstance());
        }
}


sub getAngleIncrement {
    my ($self) = @_;
        return $self->{angleIncrement};
}

# use javax::microedition::lcdui::Image;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::game::configuration::GameConfigurationCentral;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::media::image::ImageCopyUtil;
use org::allbinary::math::AngleFactory;
use org::allbinary::math::AngleInfo;
use org::allbinary::animation::image::BaseImageAnimationFactory;
use org::allbinary::animation::image::AllBinaryHTMLImageRotationAnimation;
use org::allbinary::animation::image::AllBinaryAdjustedHTMLImageRotationAnimation;

1;

