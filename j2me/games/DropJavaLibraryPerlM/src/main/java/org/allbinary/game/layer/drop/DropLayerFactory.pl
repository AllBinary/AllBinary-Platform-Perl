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

package org::allbinary::game::layer::drop::DropLayerFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $DROP_LAYER_FACTORY = 'org::allbinary::game::layer::drop::DropLayerFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
    $self->{basicArrayListUtil} = 'org::allbinary::util::BasicArrayListUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub clear {
    my ($self) = @_;
        $self->{list}->clear();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::drop::DropLayerFactory::DROP_LAYER_FACTORY;
}


sub getSize {
    my ($self) = @_;
        return $self->{list}->size();
}


sub getRandomInstance {
    my ($self) = @_;
        return $self->{basicArrayListUtil}->getRandom($self->{list});
}


sub add {
    my ($self, $layerInterfaceFactoryInterface) = @_;
        $self->{list}->add($layerInterfaceFactoryInterface);
}


sub getList {
    my ($self) = @_;
        return $self->{list};
}

use org::allbinary::game::layer::pickup::PickedUpLayerInterfaceFactoryInterface;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::util::BasicArrayListUtil;

1;

