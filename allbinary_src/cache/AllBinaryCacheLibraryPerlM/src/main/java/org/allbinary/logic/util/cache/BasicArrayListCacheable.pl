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

package org::allbinary::logic::util::cache::BasicArrayListCacheable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::util::BasicArrayListD','org::allbinary::logic::util::cache::CacheableInterface';


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub getKey {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}

use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::util::cache::CacheableInterface;

1;

