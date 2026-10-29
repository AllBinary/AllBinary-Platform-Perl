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

package org::allbinary::media::image::cache::BufferedImageInfoFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class, $width, $height, $type) = @_;
        my $stringbuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringbuffer->appendint($width);
        $stringbuffer->appendint($height);
        $stringbuffer->appendint($type);
        my $key = $stringbuffer->toString();
        my $bufferedImageInfo = $org::allbinary::media::image::cache::BufferedImageInfoFactory::hashMap->get($key);
        if (!defined($bufferedImageInfo)) {
            $bufferedImageInfo = 'org::allbinary::media::image::cache::BufferedImageInfo'->new($width, $height, $type);
            $org::allbinary::media::image::cache::BufferedImageInfoFactory::hashMap->put($key, $bufferedImageInfo);
        }
        return $bufferedImageInfo;
}

use java::util::HashMap;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::media::image::cache::BufferedImageInfo;

1;

