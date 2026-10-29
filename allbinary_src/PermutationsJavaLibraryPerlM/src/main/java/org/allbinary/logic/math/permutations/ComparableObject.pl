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

package org::allbinary::logic::math::permutations::ComparableObject;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub compareTo {
    my ($self, $anyType) = @_;
        if ('org::allbinary::TsUtil'->getInstance()->hashCode($self) < 'org::allbinary::TsUtil'->getInstance()->hashCode($anyType)) {
            return -1;
        } elsif ('org::allbinary::TsUtil'->getInstance()->hashCode($self) > 'org::allbinary::TsUtil'->getInstance()->hashCode($anyType)) {
            return 1;
        }
        return 0;
}

use org::allbinary::TsUtil;

1;

