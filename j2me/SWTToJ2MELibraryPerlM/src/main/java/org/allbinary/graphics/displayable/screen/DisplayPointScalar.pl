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

package org::allbinary::graphics::displayable::screen::DisplayPointScalar;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::displayable::screen::DisplayPointScalar'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::displayable::screen::DisplayPointScalar::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub processX {
    my ($self, $value) = @_;
        return $value;
}


sub processY {
    my ($self, $value) = @_;
        return $value;
}


sub process {
    my ($self, $point) = @_;
        return $point;
}

use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;
use org::allbinary::graphics::Rectangle;
use org::allbinary::graphics::displayable::DisplayInfoSingleton;

1;

