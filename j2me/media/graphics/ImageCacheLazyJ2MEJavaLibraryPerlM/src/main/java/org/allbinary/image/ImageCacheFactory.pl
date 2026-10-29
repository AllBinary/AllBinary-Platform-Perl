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

package org::allbinary::image::ImageCacheFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $IMAGE_CACHE = 'org::allbinary::image::ImageCache'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::image::ImageCacheFactory::IMAGE_CACHE;
}


sub init {
    my ($class) = @_;
}

use org::allbinary::image::ImageCache;

1;

