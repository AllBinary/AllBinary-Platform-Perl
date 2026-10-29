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

package org::allbinary::animation::image::ImageArrayRotationAnimationCacheable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::image::AdjustedImageArrayRotationAnimation','org::allbinary::logic::util::cache::CacheableInterface';



sub new {
    my ($class, $anyType, $animationBehavior) = @_;
    my $self = $class->SUPER::new(($anyType)->getImageArray(), ($anyType)->getAngleInfoP(), ($anyType)->getTotalAngle(), ($anyType)->getDx(), ($anyType)->getDy(), $animationBehavior);
        # super(...) made $self above
    return $self;
}


sub getKey {
    my ($self) = @_;
        return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}

use org::allbinary::animation::AnimationBehavior;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::util::cache::CacheableInterface;
use org::allbinary::animation::image::AdjustedImageArrayRotationAnimation;

1;

