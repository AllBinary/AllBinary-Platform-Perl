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

package org::allbinary::media::image::cache::BufferedImagePoolSingleton;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $poolInterface, 'java::lang::LazyStatic', sub { undef }, sub { __PACKAGE__->_static_initializer1(); };


# Java static initializer
sub _static_initializer1 {
    our $_static_initialized1;
    return if $_static_initialized1;
    $_static_initialized1 = 1;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $STATIC_BLOCK = "Static Block";
        my $instance = "BufferedImagePoolSingleton";
        try {
            $logUtil->putF($commonStrings->{START}, $instance, $STATIC_BLOCK);
            $org::allbinary::media::image::cache::BufferedImagePoolSingleton::poolInterface = 'org::allbinary::logic::util::cache::PoolInterfaceFactory'->getInstance('org::allbinary::media::image::cache::BufferedImageCacheableFactory'->new(), 'org::allbinary::logic::util::cache::PoolTypeFactory'->getInstance()->{VECTOR_POOL}, 'org::allbinary::logic::util::cache::CachePolicyFactory'->getInstance()->{MAX_TIME_THOUSAND_MAX});
            $logUtil->putF($commonStrings->{END}, $instance, $STATIC_BLOCK);
        } catch ($e) {
            $logUtil->put($commonStrings->{EXCEPTION}, $instance, $STATIC_BLOCK, $e);
        }
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::media::image::cache::BufferedImagePoolSingleton::poolInterface;
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::util::cache::CachePolicyFactory ();
use org::allbinary::logic::util::cache::PoolInterface ();
use org::allbinary::logic::util::cache::PoolInterfaceFactory ();
use org::allbinary::logic::util::cache::PoolTypeFactory ();
use org::allbinary::string::CommonStrings ();
use org::allbinary::media::image::cache::BufferedImageCacheableFactory ();

1;

