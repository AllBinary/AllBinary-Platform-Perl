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

package org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactoryPool;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactoryPool'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{list} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
    return $self;
}


sub getList {
    my ($self) = @_;
        return $self->{list};
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactoryPool::SINGLETON;
}


sub init {
    my ($class) = @_;
        $org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactoryPool::SINGLETON = 'org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactoryPool'->new();
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;

1;

