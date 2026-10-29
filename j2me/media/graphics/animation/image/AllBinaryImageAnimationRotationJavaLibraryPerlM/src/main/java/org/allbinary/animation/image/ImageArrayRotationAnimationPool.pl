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

package org::allbinary::animation::image::ImageArrayRotationAnimationPool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::cache::BasicArrayListResetablePool';

our $IMAGE_ROTATION_ANIMATION_POOL = 'org::allbinary::animation::image::ImageArrayRotationAnimationPool'->new('org::allbinary::animation::image::ImageArrayRotationAnimationCacheableInterfaceFactory'->new());


sub new {
    my ($class, $cacheableInterfaceFactoryInterface) = @_;
    my $self = $class->SUPER::new($cacheableInterfaceFactoryInterface);
        # super(...) made $self above
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::animation::image::ImageArrayRotationAnimationPool::IMAGE_ROTATION_ANIMATION_POOL;
}


# throws Exception
sub remove {
    my ($self, $key) = @_;
        my $cacheableInterface = $self->SUPER::remove($key);
        my $allBinaryImageRotationAnimationInfo = $key;
        my $imageArrayRotationAnimationCacheable = ($cacheableInterface);
        $imageArrayRotationAnimationCacheable->setImageArray($allBinaryImageRotationAnimationInfo->getImageArray());
        return $cacheableInterface;
}

use org::allbinary::logic::util::cache::BasicArrayListResetablePool;
use org::allbinary::logic::util::cache::CacheableInterface;
use org::allbinary::logic::util::cache::CacheableInterfaceFactoryInterface;
use org::allbinary::logic::util::cache::PoolInterface;
use org::allbinary::animation::image::ImageArrayRotationAnimationCacheableInterfaceFactory;

1;

