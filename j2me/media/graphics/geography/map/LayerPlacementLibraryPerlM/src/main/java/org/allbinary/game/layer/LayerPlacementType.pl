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

package org::allbinary::game::layer::LayerPlacementType;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{type} = undef;
}


sub new {
    my ($class, $type) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{type} = $type;
    return $self;
}


sub getType {
    my ($self) = @_;
        return $self->{type};
}


sub setType {
    my ($self, $type) = @_;
        $self->{type} = $type;
}


1;

