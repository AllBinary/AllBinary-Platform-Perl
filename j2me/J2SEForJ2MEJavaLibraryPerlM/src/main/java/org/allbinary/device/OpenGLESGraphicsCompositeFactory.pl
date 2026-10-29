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

package org::allbinary::device::OpenGLESGraphicsCompositeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::device::OpenGLESGraphicsCompositeFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{openGLESGraphicsFactory} = 'org::allbinary::device::OpenGLESGraphicsFactory'->new();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::device::OpenGLESGraphicsCompositeFactory::instance;
}


sub set {
    my ($self, $openGLESGraphicsFactory) = @_;
        $self->{openGLESGraphicsFactory} = $openGLESGraphicsFactory;
}


sub get {
    my ($self) = @_;
        return $self->{openGLESGraphicsFactory};
}

use org::allbinary::device::OpenGLESGraphicsFactory;

1;

