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
package org::allbinary::logic::StdUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::StdUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{EMPTY_VECTOR} = $self->createVector();
    $self->{NULL_TABLE} = $self->createHashtable();
    $self->{NULL_MAP} = $self->createHashMap();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::StdUtil::instance;
}


sub createStack {
    my ($self) = @_;
        return 'org::allbinary::util::ABStack'->new();
}


sub createVector {
    my ($self) = @_;
        return 'org::allbinary::util::ABVector'->new();
}


sub createHashtable {
    my ($self) = @_;
        return 'org::allbinary::util::ABHashtable'->new();
}


sub createHashMap {
    my ($self) = @_;
        return 'org::allbinary::util::ABHashMap'->new();
}

# use jsinterop::annotations::JsType;
# use jsinterop::annotations::JsProperty;
# use jsinterop::annotations::JsMethod;
use org::allbinary::util::ABHashMap;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::ABStack;
use org::allbinary::util::ABVector;

1;

