# 
# AllBinary Open License Version 1 
# Copyright (c) 2006 AllBinary 
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

package org::allbinary::game::layer::geological::resources::GeologicalResource;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{total} = 0;
    $self->{initTotal} = undef;
}


sub new {
    my ($class, $initTotal) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{initTotal} = $initTotal;
        $self->init();
    return $self;
}


sub init {
    my ($self) = @_;
        $self->setTotal($self->{initTotal});
}


sub add {
    my ($self, $value) = @_;
        my $max = 2147483647;
        if ($self->getTotal() + $value > $max) {
            $self->setTotal($max);
        } else {
            $self->setTotal($self->getTotal() + $value);
        }
}


sub remove {
    my ($self, $value) = @_;
        if ($self->getTotal() - $value < 0) {
            $self->setTotal(0);
        } else {
            $self->setTotal($self->getTotal() - $value);
        }
}


sub getTotal {
    my ($self) = @_;
        return $self->{total};
}


sub setTotal {
    my ($self, $total) = @_;
        $self->{total} = $total;
}


1;

