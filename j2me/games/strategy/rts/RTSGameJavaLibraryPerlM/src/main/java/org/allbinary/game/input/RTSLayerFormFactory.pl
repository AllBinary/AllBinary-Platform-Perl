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

package org::allbinary::game::input::RTSLayerFormFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::RTSLayerFormFactoryInterface';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($self, $rtsLayer) = @_;
        die ("RuntimeException");
}

use org::allbinary::game::layer::RTSLayer;
use org::allbinary::graphics::form::ScrollSelectionForm;
use org::allbinary::game::input::RTSLayerFormFactoryInterface;

1;

