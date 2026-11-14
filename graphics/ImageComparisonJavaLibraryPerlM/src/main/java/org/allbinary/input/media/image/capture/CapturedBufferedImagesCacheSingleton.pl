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

package org::allbinary::input::media::image::capture::CapturedBufferedImagesCacheSingleton;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $cacheInterface, 'java::lang::LazyStatic', sub { undef }, sub { __PACKAGE__->_static_initializer1(); };

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::media::image::capture::CapturedBufferedImagesCacheSingleton::cacheInterface;
}


# Java static initializer
sub _static_initializer1 {
    our $_static_initialized1;
    return if $_static_initialized1;
    $_static_initialized1 = 1;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $STATIC_BLOCK = "Static Block";
        my $instance = "CapturedBufferedImagesCacheSingleton";
        try {
            $logUtil->putF($commonStrings->{START}, $instance, $STATIC_BLOCK);
            $org::allbinary::input::media::image::capture::CapturedBufferedImagesCacheSingleton::cacheInterface = 'org::allbinary::logic::util::cache::CacheInterfaceFactory'->getInstance(('org::allbinary::logic::util::cache::CacheTypeFactory'->getInstance()->{SET}), ('org::allbinary::logic::util::cache::CachePolicyFactory'->getInstance()->{ONE_MINUTE_FIVE_MAX}));
            $logUtil->putF($commonStrings->{END}, $instance, $STATIC_BLOCK);
        } catch ($e) {
            $logUtil->put($commonStrings->{EXCEPTION}, $instance, $STATIC_BLOCK, $e);
        }
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::util::cache::AutomaticCacheInterface ();
use org::allbinary::logic::util::cache::CacheInterface ();
use org::allbinary::logic::util::cache::CacheInterfaceFactory ();
use org::allbinary::logic::util::cache::CachePolicyFactory ();
use org::allbinary::logic::util::cache::CacheTypeFactory ();
use org::allbinary::string::CommonStrings ();

1;

