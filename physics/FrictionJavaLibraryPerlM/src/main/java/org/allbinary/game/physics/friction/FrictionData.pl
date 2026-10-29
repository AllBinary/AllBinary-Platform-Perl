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

package org::allbinary::game::physics::friction::FrictionData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $FRICTION_DENOMINATOR = 100;


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getFrictionDenominator {
    my ($class) = @_;
        return $org::allbinary::game::physics::friction::FrictionData::FRICTION_DENOMINATOR;
}


1;

