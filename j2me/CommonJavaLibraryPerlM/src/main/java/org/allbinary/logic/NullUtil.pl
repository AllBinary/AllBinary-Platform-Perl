# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

#ActualPlatform
package org::allbinary::logic::NullUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::NullUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NULL_OBJECT} = {};
    $self->{NULL_CLASS} = ref($self->{NULL_OBJECT});
    $self->{NULL_OBJECT_ARRAY} = [(undef) x (0)];
    $self->{NULL_CHAR_ARRAY} = [("\0") x (0)];
    $self->{NULL_BYTE_ARRAY} = [(0) x (0)];
    $self->{NULL_SHORT_ARRAY_ARRAY} = [map { [(0) x (0)] } 1 .. (0)];
    $self->{NULL_INT_ARRAY} = [(0) x (0)];
    $self->{NULL_INT_ARRAY_ARRAY} = [map { [(0) x (0)] } 1 .. (0)];
    $self->{NULL_INT_ARRAY_ARRAY_ARRAY} = [map { [map { [(0) x (0)] } 1 .. (0)] } 1 .. (0)];
    $self->{NULL_FLOAT_ARRAY} = [(0.0) x (0)];
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::NullUtil::instance;
}

# use jsinterop::annotations::JsType;

1;

