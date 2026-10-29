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
package org::allbinary::game::part::weapon::SalvoInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



# throws Exception
sub process {
    my ($self, $allbinaryLayerManager, $angle, $otherAngle) = @_;
    die "abstract method process";
}


# throws Exception
sub processScore {
    my ($self, $allbinaryLayerManager, $angle, $otherAngle, $weaponProperties, $scoreableInterface) = @_;
    die "abstract method processScore";
}

use org::allbinary::game::combat::weapon::WeaponProperties;
use org::allbinary::game::score::ScoreableInterface;
use org::allbinary::layer::AllBinaryLayerManager;

1;

