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

package org::allbinary::logic::system::loader::WebappClassLoaderInfo;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $classLoader = 'org::allbinary::logic::NullUtil'->getInstance()->{NULL_OBJECT};


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub setLoader {
    my ($class, $classLoader) = @_;
        $org::allbinary::logic::system::loader::WebappClassLoaderInfo::classLoader = $classLoader;
}


sub getLoader {
    my ($class) = @_;
        return $org::allbinary::logic::system::loader::WebappClassLoaderInfo::classLoader;
}

use org::allbinary::logic::NullUtil;

1;

