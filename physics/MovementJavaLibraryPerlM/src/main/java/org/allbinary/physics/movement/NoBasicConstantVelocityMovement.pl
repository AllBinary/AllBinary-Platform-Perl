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

package org::allbinary::physics::movement::NoBasicConstantVelocityMovement;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::physics::movement::BasicConstantVelocityMovement';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new($org::allbinary::logic::math::BasicDecimal::ZERO_BIGDECIMAL, 'org::allbinary::game::physics::velocity::BasicVelocityProperties'->new());
        # super(...) made $self above
    return $self;
}


# throws Exception
sub process {
    my ($self, $layer) = @_;
}

use org::allbinary::game::layer::AllBinaryGameLayer;
use org::allbinary::game::physics::velocity::BasicVelocityProperties;
use org::allbinary::logic::math::BasicDecimal;
use org::allbinary::physics::movement::BasicConstantVelocityMovement;

1;

