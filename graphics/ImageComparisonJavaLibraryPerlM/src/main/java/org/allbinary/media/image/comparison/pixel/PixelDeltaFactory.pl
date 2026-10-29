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

package org::allbinary::media::image::comparison::pixel::PixelDeltaFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $cacheInterface = undef;

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


{ # Java static initializer
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $STATIC_BLOCK = "Static Block";
        my $instance = "PixelDeltaFactory";
        try {
            $logUtil->putF($commonStrings->{START}, $instance, $STATIC_BLOCK);
            $org::allbinary::media::image::comparison::pixel::PixelDeltaFactory::cacheInterface = 'org::allbinary::logic::util::cache::CacheInterfaceFactory'->getInstance('org::allbinary::logic::util::cache::CacheTypeFactory'->getInstance()->{CACHE}, 'org::allbinary::logic::util::cache::CachePolicyFactory'->getInstance()->{THIRTY_MINUTES_TEN_THOUSAND_MAX});
            $logUtil->putF($commonStrings->{END}, $instance, $STATIC_BLOCK);
        } catch ($e) {
            $logUtil->put($commonStrings->{EXCEPTION}, $instance, $STATIC_BLOCK, $e);
        }
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub getInstance {
    my ($class, $x, $y, $rgb1, $rgb2) = @_;
        my $point = 'org::allbinary::graphics::PointFactory'->getInstance()->createXY($x, $y);
        my $colorDelta = 'org::allbinary::media::image::comparison::color::ColorDeltaFactory'->getInstance($rgb1, $rgb2);
        my $pixelDelta = $org::allbinary::media::image::comparison::pixel::PixelDeltaFactory::cacheInterface->get('org::allbinary::media::image::comparison::pixel::PixelDelta'->getKey($point, $colorDelta));
        if (!defined($pixelDelta)) {
            $pixelDelta = 'org::allbinary::media::image::comparison::pixel::PixelDelta'->new($point, $colorDelta);
        }
        return $pixelDelta;
}

use org::allbinary::graphics::GPoint;
use org::allbinary::graphics::PointFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::util::cache::AutomaticCacheInterface;
use org::allbinary::logic::util::cache::CacheInterfaceFactory;
use org::allbinary::logic::util::cache::CachePolicyFactory;
use org::allbinary::logic::util::cache::CacheTypeFactory;
use org::allbinary::media::image::comparison::color::ColorDelta;
use org::allbinary::media::image::comparison::color::ColorDeltaFactory;
use org::allbinary::string::CommonStrings;
use org::allbinary::media::image::comparison::pixel::PixelDelta;

1;

