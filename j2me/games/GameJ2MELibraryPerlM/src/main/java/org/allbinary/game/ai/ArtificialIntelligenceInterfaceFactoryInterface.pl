#
# AllBinary Open License Version 1
# Copyright (c) 2011 AllBinary
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
package org::allbinary::game::ai::ArtificialIntelligenceInterfaceFactoryInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



# throws Exception
sub getInstance {
    my ($self, $hashtable, $ownerLayerInterface, $gameInput) = @_;
    die "abstract method getInstance";
}

use org::allbinary::ai::ArtificialIntelligenceInterface;
use org::allbinary::game::input::GameInput;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::util::ABHashtable;

1;

