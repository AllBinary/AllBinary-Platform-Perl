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

package org::allbinary::game::physics::FrictionProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub friction {
    my ($self, $velocityProperties, $nominator) = @_;
        $org::allbinary::game::physics::velocity::DragVelocityBehavior::instance->reduce($velocityProperties, $nominator, 'org::allbinary::game::physics::friction::FrictionData'->getFrictionDenominator());
}

use org::allbinary::game::physics::friction::FrictionData;
use org::allbinary::game::physics::velocity::DragVelocityBehavior;
use org::allbinary::game::physics::velocity::VelocityProperties;

1;

