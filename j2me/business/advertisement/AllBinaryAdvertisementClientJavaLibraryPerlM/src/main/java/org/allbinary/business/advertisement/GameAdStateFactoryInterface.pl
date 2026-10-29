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

# Java interface
package org::allbinary::business::advertisement::GameAdStateFactoryInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



# throws Exception
sub getInstanceForApp {
    my ($self, $softwareInformation) = @_;
    die "abstract method getInstanceForApp";
}

use org::allbinary::logic::system::SoftwareInformation;

1;

