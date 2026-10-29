# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::animation::image::ImageAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::BaseImageAnimationFactory';



# throws Exception
sub createFactory {
    my ($class, $image) = @_;
        return 'org::allbinary::animation::image::ImageAnimationFactory'->new($image, $image->getWidth(), $image->getHeight(), 0, 0, 'org::allbinary::animation::AnimationBehaviorFactory'->getInstance());
}


sub new {
    my ($class, $image, $width, $height, $dx, $dy, $animationBehaviorFactory) = @_;
    my $self = $class->SUPER::new($image, 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance(), $width, $height, $dx, $dy, $animationBehaviorFactory);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        my $scaledImage = $self->{animationFactoryImageScaleUtil}->createImage($self->getImage(), $self->{animationFactoryInitializationVisitor}->{width}, $self->{animationFactoryInitializationVisitor}->{height}, $self->{scaleProperties}->{scaleWidth}, $self->{scaleProperties}->{scaleHeight});
        my $openGLUtil = 'org::allbinary::graphics::opengles::OpenGLUtil'->getInstance();
        $scaledImage = $openGLUtil->addImage($scaledImage);
        if ($self->{animationFactoryInitializationVisitor}->{dx} != 0 || $self->{animationFactoryInitializationVisitor}->{dy} != 0) {
            $self->{animationFactoryImageScaleUtil}->processAdjust($self);
            return 'org::allbinary::animation::image::AdjustedImageAnimation'->new($scaledImage, $self->{animationFactoryInitializationVisitor}->{dx}, $self->{animationFactoryInitializationVisitor}->{dy}, $self->{animationBehaviorFactory}->getOrCreateInstance());
        } else {
            return 'org::allbinary::animation::image::ImageAnimation'->new($scaledImage, $self->{animationBehaviorFactory}->getOrCreateInstance());
        }
}

# use javax::microedition::lcdui::Image;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::graphics::opengles::OpenGLUtil;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::animation::image::BaseImageAnimationFactory;
use org::allbinary::animation::image::ImageAnimation;
use org::allbinary::animation::image::AdjustedImageAnimation;

1;

