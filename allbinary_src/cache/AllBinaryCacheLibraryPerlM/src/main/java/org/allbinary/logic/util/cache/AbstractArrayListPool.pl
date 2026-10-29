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

package org::allbinary::logic::util::cache::AbstractArrayListPool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::cache::PoolInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{buffers} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{cacheableInterfaceFactoryInterface} = undef;
}


sub new {
    my ($class, $cacheableInterfaceFactoryInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{cacheableInterfaceFactoryInterface} = $cacheableInterfaceFactoryInterface;
    return $self;
}


# throws Exception
sub clear {
    my ($self) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


# throws Exception
sub remove {
    my ($self, $key) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


# throws Exception
sub add {
    my ($self, $cacheableInterface) = @_;
        $self->{buffers}->add($cacheableInterface);
}


# throws Exception
sub addArray {
    my ($self, $cacheableInterfaces) = @_;
        for (my $index = 0; $index < scalar(@{$cacheableInterfaces}); $index++) {
            $self->{buffers}->add($cacheableInterfaces->[$index]);
        }
}

use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::util::cache::PoolInterface;

1;

