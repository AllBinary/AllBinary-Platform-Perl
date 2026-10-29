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

package org::allbinary::graphics::opengles::shader::SimpleCompositeShaderUpdater;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::opengles::shader::CompositeShaderUpdater';



sub new {
    my ($class, $uniformBlockArray, $uniformArray, $attributeArray, $attributeHandleArray) = @_;
    my $self = $class->SUPER::new($uniformBlockArray, $uniformArray, $attributeArray, $attributeHandleArray);
        # super(...) made $self above
    return $self;
}

use org::allbinary::graphics::opengles::shader::CompositeShaderUpdater;

1;

