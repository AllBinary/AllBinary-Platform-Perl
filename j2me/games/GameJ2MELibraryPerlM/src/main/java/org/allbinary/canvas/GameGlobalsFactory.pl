# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::canvas::GameGlobalsFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::canvas::GameGlobalsFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{newCanvas} = 1;
    $self->{newDisplaybleTime} = int((-2147483648));
    $self->{point} = 'org::allbinary::graphics::PointFactory'->getInstance()->{ZERO_ZERO};
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::canvas::GameGlobalsFactory::instance;
}

use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;

1;

