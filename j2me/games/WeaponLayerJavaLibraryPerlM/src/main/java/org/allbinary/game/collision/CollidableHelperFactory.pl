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

package org::allbinary::game::collision::CollidableHelperFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        if ('org::allbinary::game::configuration::feature::Features'->getInstance()->isFeature('org::allbinary::game::configuration::feature::GameFeatureFactory'->getInstance()->{COLLISIONS_WITH_SOURCE})) {
            return 'org::allbinary::game::collision::CollisionHelper'->new($org::allbinary::layer::AllBinaryLayer::NULL_ALLBINARY_LAYER);
        } else {
            return 'org::allbinary::game::collision::SourceCollisionHelper'->new($org::allbinary::layer::AllBinaryLayer::NULL_ALLBINARY_LAYER);
        }
}

use org::allbinary::game::configuration::feature::Features;
use org::allbinary::game::configuration::feature::GameFeatureFactory;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::game::collision::SourceCollisionHelper;
use org::allbinary::game::collision::CollisionHelper;

1;

