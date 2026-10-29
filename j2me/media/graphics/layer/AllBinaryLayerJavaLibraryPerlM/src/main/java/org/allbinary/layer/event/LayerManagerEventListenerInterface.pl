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
package org::allbinary::layer::event::LayerManagerEventListenerInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::util::event::EventListenerInterface';



# throws Exception
sub onCreateLayerManagerEvent {
    my ($self, $layerManagerEvent) = @_;
    die "abstract method onCreateLayerManagerEvent";
}


# throws Exception
sub onDeleteLayerManagerEvent {
    my ($self, $layerManagerEvent) = @_;
    die "abstract method onDeleteLayerManagerEvent";
}

use org::allbinary::logic::util::event::EventListenerInterface;

1;

