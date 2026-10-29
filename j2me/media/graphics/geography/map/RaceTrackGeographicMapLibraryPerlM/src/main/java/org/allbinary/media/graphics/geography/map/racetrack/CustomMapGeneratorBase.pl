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

package org::allbinary::media::graphics::geography::map::racetrack::CustomMapGeneratorBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub copyMapIntoCustomMap {
    my ($self) = @_;
}


sub getCustomMapArray {
    my ($self) = @_;
        return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_INT_ARRAY_ARRAY};
}


# throws Exception
sub getCustomType {
    my ($self, $column, $row, $currentType) = @_;
        return -1;
}

use org::allbinary::logic::NullUtil;

1;

