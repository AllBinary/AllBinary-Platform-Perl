# 
# AllBinary Open License Version 1 
# Copyright (c) 2007 AllBinary 
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

package org::allbinary::logic::util::cache::PoolType;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{cacheType} = undef;
}


sub new {
    my ($class, $cacheType) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{cacheType} = $cacheType;
    return $self;
}


sub getCacheType {
    my ($self) = @_;
        return $self->{cacheType};
}


sub toString {
    my ($self) = @_;
        my $POOL_TYPE = "PoolType: ";
        return $POOL_TYPE . $self->getCacheType()->toString();
}


1;

