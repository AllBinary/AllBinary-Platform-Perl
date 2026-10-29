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

package org::allbinary::graphics::displayable::BaseScalable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::graphics::displayable::ScalableListener';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getRatio {
    my ($self, $ratio) = @_;
        return 1.0;
}


sub getLeft {
    my ($self, $xOffset) = @_;
        return -1;
}


sub getTop {
    my ($self, $yOffset) = @_;
        return -1;
}


sub scale {
    my ($self, $ratio) = @_;
}

use org::allbinary::graphics::displayable::ScalableListener;

1;

