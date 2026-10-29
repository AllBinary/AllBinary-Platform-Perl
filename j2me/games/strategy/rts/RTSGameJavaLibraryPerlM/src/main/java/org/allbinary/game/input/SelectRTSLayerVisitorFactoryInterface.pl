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
package org::allbinary::game::input::SelectRTSLayerVisitorFactoryInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub create {
    my ($self, $selectedRTSLayersPlayerGameInput) = @_;
    die "abstract method create";
}

use org::allbinary::logic::util::visitor::Visitor;

1;

