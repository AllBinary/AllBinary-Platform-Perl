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

package org::allbinary::logic::util::cache::BasicArrayListResetablePool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::cache::AbstractArrayListPool';



sub new {
    my ($class, $cacheableInterfaceFactoryInterface) = @_;
    my $self = $class->SUPER::new($cacheableInterfaceFactoryInterface);
        # super(...) made $self above
    return $self;
}


sub clear {
    my ($self) = @_;
}


# throws Exception
sub remove {
    my ($self, $key) = @_;
        my $size = $self->{buffers}->size();
        if ($size > 0) {
            return $self->{buffers}->removeAt($size - 1);
        } else {
            return $self->{cacheableInterfaceFactoryInterface}->getInstance($key);
        }
}

use org::allbinary::logic::util::cache::AbstractArrayListPool;

1;

