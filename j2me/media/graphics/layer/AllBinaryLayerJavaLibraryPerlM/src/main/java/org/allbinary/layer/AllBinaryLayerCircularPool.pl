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

package org::allbinary::layer::AllBinaryLayerCircularPool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::cache::BaseCircularPool';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


# throws Exception
sub initAllBinaryLayerCircularPool {
    my ($self, $allbinaryLayerFactoryInterface, $total) = @_;
        $self->{circularIndexUtil} = 'org::allbinary::util::CircularIndexUtil'->createInstance($total);
        $self->{OBJECT_ARRAY} = [(undef) x ($total)];
        for (my $localIndex = 0; $localIndex < $total; $localIndex++) {
            $self->{OBJECT_ARRAY}->[$localIndex] = $allbinaryLayerFactoryInterface->getInstance();
        }
}

use org::allbinary::logic::util::cache::BaseCircularPool;
use org::allbinary::util::CircularIndexUtil;

1;

