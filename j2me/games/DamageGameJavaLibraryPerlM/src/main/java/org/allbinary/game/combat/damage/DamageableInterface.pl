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

# Java interface
package org::allbinary::game::combat::damage::DamageableInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::NamedInterface';



# throws Exception
sub damage {
    my ($self, $damage, $damageType) = @_;
    die "abstract method damage";
}


# throws Exception
sub getDamage {
    my ($self, $damageType) = @_;
    die "abstract method getDamage";
}

use org::allbinary::layer::NamedInterface;

1;

