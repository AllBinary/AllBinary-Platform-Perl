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

package org::allbinary::graphics::color::ColorCacheFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $cacheInterface = undef;


{ # Java static initializer
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $STATIC_BLOCK = "Static Block";
        try {
            $logUtil->putF($commonStrings->{START}, 'org::allbinary::graphics::color::ColorCacheFactory', $STATIC_BLOCK);
            $org::allbinary::graphics::color::ColorCacheFactory::cacheInterface = 'org::allbinary::logic::util::cache::AutomaticCacheInterfaceFactory'->getInstance('org::allbinary::graphics::color::ColorCacheableFactory'->new(), 'org::allbinary::logic::util::cache::CacheTypeFactory'->getInstance()->{CACHE}, 'org::allbinary::logic::util::cache::CachePolicyFactory'->getInstance()->{THIRTY_MINUTES_TEN_THOUSAND_MAX});
            $logUtil->putF($commonStrings->{END}, 'org::allbinary::graphics::color::ColorCacheFactory', $STATIC_BLOCK);
        } catch ($e) {
            $logUtil->put($commonStrings->{EXCEPTION}, 'org::allbinary::graphics::color::ColorCacheFactory', $STATIC_BLOCK, $e);
        }
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::color::ColorCacheFactory::cacheInterface;
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::util::cache::AutomaticCacheInterface;
use org::allbinary::logic::util::cache::AutomaticCacheInterfaceFactory;
use org::allbinary::logic::util::cache::CachePolicyFactory;
use org::allbinary::logic::util::cache::CacheTypeFactory;
use org::allbinary::string::CommonStrings;
use org::allbinary::graphics::color::ColorCacheableFactory;

1;

