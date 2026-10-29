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

package org::allbinary::graphics::opengles::shader::AppRendererShaderUpdaterFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::opengles::shader::ShaderUpdater';

our $instanceC = 'org::allbinary::graphics::opengles::shader::AppRendererShaderUpdaterFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NULL_SHADER_COMPOSITE_ARRAY} = [(undef) x (0)];
    $self->{shaderCompositeArray} = $self->{NULL_SHADER_COMPOSITE_ARRAY};
    $self->{shaderOpenGLProcessorArray} = [(undef) x (0)];
}

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::opengles::shader::AppRendererShaderUpdaterFactory::instanceC;
}


sub getTestShaders {
    my ($self) = @_;
        return $self->{shaderOpenGLProcessorArray};
}


sub setShaderComposite {
    my ($self, $object3d) = @_;
}

use org::allbinary::graphics::opengles::shader::ShaderUpdater;

1;

