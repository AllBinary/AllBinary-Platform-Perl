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

package admin::taghelpers::BasketHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'admin::taghelpers::TagHelper';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{weblisketSession} = undef;
    $self->{storeFrontInterface} = undef;
    $self->{propertiesHashMap} = undef;
    $self->{pageContext} = undef;
    $self->{MAX} = 200;
}


sub new {
    my ($class, $hashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{propertiesHashMap} = $hashMap;
        $self->{pageContext} = $pageContext;
        my $storeName = $self->{propertiesHashMap}->get('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME});
        if (defined($storeName)) {
            $self->{storeFrontInterface} = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($storeName);
        }
        $self->{weblisketSession} = 'org::allbinary::logic::communication::http::request::session::WeblisketSession'->new($hashMap, $pageContext);
    return $self;
}


sub isBasketEmpty {
    my ($self) = @_;
        try {
            my $basket = $self->{weblisketSession}->getOrder()->getBasket();
            if (int($basket->getNumberOfItems()) <= 0) {
                return 1;
            } else {
                return 0;
            }
        } catch ($e) {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "isBasketEmpty()", $e);
            }
            return 1;
        }
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::commerce::inventory::basket::BasketInterface;
use org::allbinary::logic::communication::http::request::session::WeblisketSession;
use org::allbinary::logic::communication::log::LogUtil;
use admin::taghelpers::TagHelper;

1;

