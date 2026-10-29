# 
# AllBinary Open License Version 1 
# Copyright (c) 2003 AllBinary 
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
package org::allbinary::game::layer::CostLayerInterfaceFactoryInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::LayerInterfaceFactoryInterface';



# throws Exception
sub getCost {
    my ($self) = @_;
    die "abstract method getCost";
}

use org::allbinary::layer::LayerInterfaceFactoryInterface;

1;

