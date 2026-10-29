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
package org::allbinary::input::automation::module::game::HitPointGameObjectInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::module::game::MeteredGameObjectInterface';



sub isMoreThan {
    my ($self, $aFloat) = @_;
    die "abstract method isMoreThan";
}


sub isCloseDeath {
    my ($self) = @_;
    die "abstract method isCloseDeath";
}


sub isDamaged {
    my ($self) = @_;
    die "abstract method isDamaged";
}

use org::allbinary::input::automation::module::game::MeteredGameObjectInterface;

1;

