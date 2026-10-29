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

package org::allbinary::graphics::opengles::shader::ShaderManager;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::opengles::shader::ShaderManager'->new(-1, -1);

sub _init_fields {
    my ($self) = @_;
    $self->{LOAD_SHADER} = "loadShader";
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{GL_VERTEX_SHADER} = undef;
    $self->{GL_FRAGMENT_SHADER} = undef;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::opengles::shader::ShaderManager::instance;
}


sub new {
    my ($class, $GL_VERTEX_SHADER, $GL_FRAGMENT_SHADER) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{GL_VERTEX_SHADER} = $GL_VERTEX_SHADER;
        $self->{GL_FRAGMENT_SHADER} = $GL_FRAGMENT_SHADER;
    return $self;
}


sub load {
    my ($self, $gl, $resource, $shaderAsStringArray, $shaderType) = @_;
        return -1;
}


sub loadShader {
    my ($self, $gl, $resource, $stringList, $shaderType) = @_;
        return -1;
}

# use javax::microedition::khronos::opengles::GL10;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;

1;

