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

package org::allbinary::animation::image::AllBinaryScreenRelationalImageAnimationInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::BaseImageAnimationFactory';


sub _init_fields {
    my ($self) = @_;
    $self->{lastImage} = $javax::microedition::lcdui::NullImage::NULL_IMAGE;
}


sub new {
    my ($class, $image, $animationBehaviorFactory) = @_;
    my $self = $class->SUPER::new($image, 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance(), 0, 0, 0, 0, $animationBehaviorFactory);
    $self->_init_fields();
        # super(...) made $self above
        if ($self->{lastImage} != $javax::microedition::lcdui::NullImage::NULL_IMAGE) {
            my $androidImageInterface = $self->{lastImage};
            $androidImageInterface->getBitmap()->recycle();
        }
        my $scale = 'org::allbinary::graphics::displayable::ScreenRelationalUtil'->getInstance()->getScaleImage($image);
        $self->{lastImage} = 'org::allbinary::media::image::ImageScaleUtil'->getInstance()->createImage('org::allbinary::image::GameFeatureImageCacheFactory'->getInstance(), $self->getImage(), $scale, $scale, 0);
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        return 'org::allbinary::animation::image::ImageAnimation'->new($self->{lastImage}, $self->{animationBehaviorFactory}->getOrCreateInstance());
}

# use javax::microedition::lcdui::Image;
# use javax::microedition::lcdui::NullImage;
use org::allbinary::image::GameFeatureImageCacheFactory;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::graphics::displayable::ScreenRelationalUtil;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::media::image::ImageScaleUtil;
use org::microemu::android::device::AndroidImageInterface;
use org::allbinary::animation::image::BaseImageAnimationFactory;
use org::allbinary::animation::image::ImageAnimation;

1;

