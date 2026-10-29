# 
# AllBinary Open License Version 1 
# Copyright (c) 2006 AllBinary 
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

package org::allbinary::game::layer::unit::DecalAnimationInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::layer::unit::DecalAnimationInterfaceFactory'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::unit::DecalAnimationInterfaceFactory::instance;
}


# throws Exception
sub getAnimationFactory {
    my ($self, $basicGameResources, $basicColor) = @_;
        my $animationInterfaceFactoryInterface = undef;
        if ($basicColor == 'org::allbinary::graphics::color::BasicColorFactory'->getInstance()->{RED}) {
            $animationInterfaceFactoryInterface = 'org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory'->getInstance()->get($basicGameResources->{RESOURCE});
        } else {
            $animationInterfaceFactoryInterface = 'org::allbinary::animation::NullRotationAnimationFactory'->getFactoryInstance();
        }
        return $animationInterfaceFactoryInterface;
}

use org::allbinary::game::layer::resources::BasicGameResources;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory;
use org::allbinary::animation::NullRotationAnimationFactory;
use org::allbinary::graphics::color::BasicColor;
use org::allbinary::graphics::color::BasicColorFactory;

1;

