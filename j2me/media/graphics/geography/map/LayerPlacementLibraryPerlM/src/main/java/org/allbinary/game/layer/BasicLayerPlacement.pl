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

package org::allbinary::game::layer::BasicLayerPlacement;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{layerType} = undef;
    $self->{width} = undef;
    $self->{height} = undef;
}


sub new {
    my ($class, $layerType, $width, $height) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{layerType} = $layerType;
        $self->{width} = $width;
        $self->{height} = $height;
    return $self;
}


sub getWidth {
    my ($self) = @_;
        return $self->{width};
}


sub getHeight {
    my ($self) = @_;
        return $self->{height};
}


sub getLayerType {
    my ($self) = @_;
        return $self->{layerType};
}


sub setLayerType {
    my ($self, $layerType) = @_;
        $self->{layerType} = $layerType;
}


1;

