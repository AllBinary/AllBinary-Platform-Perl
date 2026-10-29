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

package org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class, $storeName) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        try {
            my $storeFronts = 'org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntityFactory'->getInstance()->getStoreFrontsEntityInstance();
            return $storeFronts->getStoreFrontInterface($storeName);
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            if ($org::allbinary::business::context::modules::storefront::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::context::modules::storefront::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{FACTORYERROR})) {
                $logUtil->put($commonStrings->{EXCEPTION}, "StoreFrontFactory", $commonStrings->{GET_INSTANCE}, $e);
            }
            return undef;
        }
}

use org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntity;
use org::allbinary::data::tables::context::module::storefronts::StoreFrontsEntityFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

