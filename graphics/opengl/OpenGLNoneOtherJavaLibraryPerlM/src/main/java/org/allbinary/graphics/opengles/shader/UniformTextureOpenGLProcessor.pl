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

package org::allbinary::graphics::opengles::shader::UniformTextureOpenGLProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::opengles::shader::OpenGLObject3dProcessor';



sub new {
    my ($class, $shaderComposite, $handleIndex) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub process {
    my ($self, $gl, $unused, $index) = @_;
}

# use javax::microedition::khronos::opengles::GL10;
use org::allbinary::graphics::opengles::shader::OpenGLObject3dProcessor;

1;

