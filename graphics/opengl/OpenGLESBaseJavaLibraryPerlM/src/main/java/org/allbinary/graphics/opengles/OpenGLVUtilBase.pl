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

package org::allbinary::graphics::opengles::OpenGLVUtilBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub glTexEnvix {
    my ($self, $gl, $target, $pname, $param) = @_;
}


sub glTexParameterix {
    my ($self, $gl, $target, $pname, $param) = @_;
}


sub glGenerateMipmap {
    my ($self, $gl, $textureId, $target, $generateMipMap) = @_;
}

# use javax::microedition::khronos::opengles::GL10;

1;

