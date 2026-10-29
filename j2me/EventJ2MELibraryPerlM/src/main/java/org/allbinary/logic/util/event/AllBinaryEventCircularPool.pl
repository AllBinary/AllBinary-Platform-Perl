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

package org::allbinary::logic::util::event::AllBinaryEventCircularPool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::cache::BaseCircularPool';



sub new {
    my ($class, $max) = @_;
    my $self = $class->SUPER::new();
        $self->{OBJECT_ARRAY} = [(undef) x ($max)];
        $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstance($max);
    return $self;
}


sub initAllBinaryEventCircularPool {
    my ($self, $allBinaryEventObjectFactoryInterface) = @_;
        $self->{circularIndexUtil}->setIndex(0);
        my $size = $self->{circularIndexUtil}->getSize();
        for (my $index = 0; $index < $size; $index++) {
            $self->{OBJECT_ARRAY}->[$index] = $allBinaryEventObjectFactoryInterface->getInstance();
        }
}

use org::allbinary::logic::util::cache::BaseCircularPool;
use org::allbinary::util::CircularIndexUtil;

1;

