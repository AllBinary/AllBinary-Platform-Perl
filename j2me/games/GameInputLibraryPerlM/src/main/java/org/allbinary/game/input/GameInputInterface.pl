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
package org::allbinary::game::input::GameInputInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::layer::NamedInterface';



# throws Exception
sub processInput {
    my ($self, $layerManager) = @_;
    die "abstract method processInput";
}


sub initInputProcessors {
    my ($self) = @_;
    die "abstract method initInputProcessors";
}

use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::layer::NamedInterface;

1;

