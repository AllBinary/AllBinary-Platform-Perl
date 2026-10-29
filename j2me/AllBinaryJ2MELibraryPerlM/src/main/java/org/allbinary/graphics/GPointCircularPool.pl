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

package org::allbinary::graphics::GPointCircularPool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::cache::BaseCircularPool';



sub new {
    my ($class, $size) = @_;
    my $self = $class->SUPER::new();
        $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstance($size);
        $self->{OBJECT_ARRAY} = [(undef) x ($size)];
        for (my $index = $size - 1; $index >= 0; $index--) {
            $self->{OBJECT_ARRAY}->[$index] = 'org::allbinary::graphics::CustomGPoint'->getInstance3(0, 0);
        }
    return $self;
}

use org::allbinary::logic::util::cache::BaseCircularPool;
use org::allbinary::util::CircularIndexUtil;
use org::allbinary::graphics::CustomGPoint;

1;

