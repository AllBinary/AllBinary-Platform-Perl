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

package org::allbinary::image::GameFeatureImageCacheFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return java::lang::Object::jstatic('org::allbinary::image::GameFeatureImageCacheFactory', 'ImageCacheFactory')->getInstance();
}


sub init {
    my ($class) = @_;
        java::lang::Object::jstatic('org::allbinary::image::GameFeatureImageCacheFactory', 'ImageCacheFactory')->init();
}


sub releaseAll {
    my ($class) = @_;
        java::lang::Object::jstatic('org::allbinary::image::GameFeatureImageCacheFactory', 'ImageCacheFactory')->getInstance()->releaseAll();
}

use java::lang::Object ();

1;

