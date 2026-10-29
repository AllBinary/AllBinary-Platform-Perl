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

package org::osgi::framework::NullServiceReference;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getProperty {
    my ($self, $key) = @_;
        return 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};
}


sub getPropertyKeys {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->getArrayInstance();
}


sub compareTo {
    my ($self, $o) = @_;
        die ("RuntimeException");
}

use org::allbinary::logic::NullUtil;
use org::allbinary::logic::string::StringUtil;

1;

