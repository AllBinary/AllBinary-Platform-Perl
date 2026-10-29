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

package org::allbinary::graphics::opengles::OpenGLVersionValidator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::opengles::OpenGLVersionValidator'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{EGL_CONTEXT_CLIENT_VERSION_VALUE} = -1;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::opengles::OpenGLVersionValidator::instance;
}


sub isGL31OrHigher {
    my ($self) = @_;
        return 0;
}


sub isAvailable {
    my ($self, $glVersionRequired) = @_;
        return 0;
}


sub setShaderComposite {
    my ($self, $shaderComposite, $anyType) = @_;
}

use org::allbinary::graphics::opengles::shader::ShaderComposite;

1;

