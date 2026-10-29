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

package org::allbinary::graphics::opengles::WithNormalAttributePointerOpenGLProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::threed::min3d::renderer::processor::ObjectThreedOpenGLProcessor';

our $instance = 'org::allbinary::graphics::opengles::WithNormalAttributePointerOpenGLProcessor'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::opengles::WithNormalAttributePointerOpenGLProcessor::instance;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub process {
    my ($self, $gl, $aObject3d) = @_;
        die ("RuntimeException");
}

# use javax::microedition::khronos::opengles::GL10;
use org::allbinary::graphics::threed::min3d::renderer::processor::ObjectThreedOpenGLProcessor;

1;

