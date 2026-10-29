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

# Java interface
package min3d::core::Renderer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub onSurfaceCreated {
    my ($self, $gl, $config) = @_;
    die "abstract method onSurfaceCreated";
}


sub onSurfaceChanged {
    my ($self, $gl, $width, $height) = @_;
    die "abstract method onSurfaceChanged";
}


sub onDrawFrame {
    my ($self, $gl) = @_;
    die "abstract method onDrawFrame";
}

# use javax::microedition::khronos::egl::EGLConfig;
# use javax::microedition::khronos::opengles::GL10;

1;

