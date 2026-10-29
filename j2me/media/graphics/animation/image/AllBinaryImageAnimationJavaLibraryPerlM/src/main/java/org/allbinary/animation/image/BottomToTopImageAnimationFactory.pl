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

package org::allbinary::animation::image::BottomToTopImageAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::BaseImageAnimationFactory';



sub new {
    my ($class, $image, $animationBehaviorFactory) = @_;
    my $self = $class->SUPER::new($image, 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance(), $image->getWidth(), $image->getHeight(), 0, 0, $animationBehaviorFactory);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        my $scaledImage = $self->{animationFactoryImageScaleUtil}->createImage($self->getImage(), $self->{animationFactoryInitializationVisitor}->{width}, $self->{animationFactoryInitializationVisitor}->{height}, $self->{scaleProperties}->{scaleWidth}, $self->{scaleProperties}->{scaleHeight});
        return 'org::allbinary::animation::image::BottomToTopImageAnimation'->new($scaledImage, $self->{animationBehaviorFactory}->getOrCreateInstance());
}

# use javax::microedition::lcdui::Image;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::animation::image::BaseImageAnimationFactory;
use org::allbinary::animation::image::BottomToTopImageAnimation;

1;

