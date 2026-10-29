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

package org::allbinary::logic::system::PlatformAssetManager;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::system::PlatformAssetManager'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::PlatformAssetManager::instance;
}


# throws Exception
sub getResourceAsStream {
    my ($self, $resource) = @_;
        my $resourceUtil = 'org::allbinary::data::resource::ResourceUtil'->getInstance();
        my $inputStream = $resourceUtil->getResourceAsStream($resource);
        return $inputStream;
}

# use java::io::InputStream;
use org::allbinary::data::resource::ResourceUtil;

1;

