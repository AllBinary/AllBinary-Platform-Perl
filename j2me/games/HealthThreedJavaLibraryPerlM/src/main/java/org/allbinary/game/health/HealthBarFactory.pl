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

package org::allbinary::game::health::HealthBarFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $layerInterface, $healthInterface, $location, $direction) = @_;
        if ('org::allbinary::graphics::opengles::OpenGLFeatureUtil'->getInstance()->isAnyThreed()) {
            my $featuredAnimationInterfaceFactoryInterfaceFactory = 'org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory'->getInstance();
            my $healthBarAnimationInterfaceFactory = $featuredAnimationInterfaceFactoryInterfaceFactory->get($org::allbinary::game::health::Health::NAME);
            return 'org::allbinary::game::health::HealthBar'->new($layerInterface, $healthInterface, $healthBarAnimationInterfaceFactory->getInstanceByLocation($layerInterface, $location), $direction);
        } else {
            return 'org::allbinary::game::health::HealthBar'->new($layerInterface, $healthInterface, 'org::allbinary::game::health::HealthBarTwodAnimation'->new($layerInterface, $location), $direction);
        }
}

use org::allbinary::graphics::opengles::OpenGLFeatureUtil;
use org::allbinary::animation::FeaturedAnimationInterfaceFactoryInterfaceFactory;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::game::health::HealthBar;
use org::allbinary::game::health::HealthBarTwodAnimation;
use org::allbinary::game::health::Health;

1;

