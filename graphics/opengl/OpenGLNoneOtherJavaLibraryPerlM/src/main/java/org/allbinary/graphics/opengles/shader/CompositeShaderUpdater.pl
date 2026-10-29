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

package org::allbinary::graphics::opengles::shader::CompositeShaderUpdater;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::opengles::shader::ShaderUpdater';

our $instanceC = 'org::allbinary::graphics::opengles::shader::CompositeShaderUpdater'->new('org::allbinary::logic::string::StringUtil'->getInstance()->getArrayInstance(), 'org::allbinary::logic::string::StringUtil'->getInstance()->getArrayInstance(), 'org::allbinary::logic::string::StringUtil'->getInstance()->getArrayInstance(), 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY});

sub _init_fields {
    my ($self) = @_;
    $self->{commonSeps} = 'org::allbinary::string::CommonSeps'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::opengles::shader::CompositeShaderUpdater::instanceC;
}


sub new {
    my ($class, $uniformBlockArray, $uniformArray, $attributeArray, $attributeHandleArray) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
    return $self;
}


sub onSurfaceCreated {
    my ($self, $gl, $eglConfig, $programHandle) = @_;
}


sub onSurfaceDestroyed {
    my ($self, $gl) = @_;
}

# use javax::microedition::khronos::egl::EGLConfig;
# use javax::microedition::khronos::opengles::GL10;
use org::allbinary::logic::NullUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonSeps;
use org::allbinary::graphics::opengles::shader::ShaderUpdater;

1;

