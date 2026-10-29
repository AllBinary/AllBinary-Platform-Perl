# 
# AllBinary Open License Version 1 
# Copyright (c) 2026 AllBinary 
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

package org::allbinary::animation::ShapeTypeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::animation::ShapeTypeFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{KEY_LINE} = "line";
    $self->{KEY_CIRCLE} = "circle";
    $self->{KEY_RECTANGLE} = "rectangle";
    $self->{KEY_RECT} = "rect";
    $self->{LINE} = 'org::allbinary::animation::ShapeType'->new($self->{KEY_LINE});
    $self->{CIRCLE} = 'org::allbinary::animation::ShapeType'->new($self->{KEY_CIRCLE});
    $self->{RECTANGLE} = 'org::allbinary::animation::ShapeType'->new($self->{KEY_RECTANGLE});
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::animation::ShapeTypeFactory::instance;
}

use org::allbinary::animation::ShapeType;

1;

