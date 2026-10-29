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

package org::allbinary::logic::visual::transform::info::TransformInfoHttpStoreFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::info::TransformInfoFactoryInterface';

our $instance = 'org::allbinary::logic::visual::transform::info::TransformInfoHttpStoreFactory'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::visual::transform::info::TransformInfoHttpStoreFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $databaseHashMap, $propertiesHashMap, $pageContext) = @_;
        return 'org::allbinary::logic::visual::transform::info::TransformInfoHttpStore'->new($databaseHashMap, $propertiesHashMap, $pageContext);
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use org::allbinary::logic::visual::transform::info::TransformInfoFactoryInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpStore;

1;

