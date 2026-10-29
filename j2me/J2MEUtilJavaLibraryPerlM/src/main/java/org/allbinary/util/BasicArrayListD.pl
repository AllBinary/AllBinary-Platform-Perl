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

package org::allbinary::util::BasicArrayListD;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::util::BasicArrayListS';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new(7);
        # super(...) made $self above
    return $self;
}

# use jsinterop::annotations::JsType;
# use jsinterop::annotations::JsConstructor;
use org::allbinary::util::BasicArrayListS;

1;

