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

package org::allbinary::business::context::modules::storefront::StoreFrontView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{storeFrontInterface} = undef;
}


sub new {
    my ($class, $storeFrontInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        if ($org::allbinary::business::context::modules::storefront::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::context::modules::storefront::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->putF("Constructing: StoreFrontView for: " . $storeFrontInterface->getName(), $self, $commonStrings->{GET_INSTANCE});
        }
        $self->{storeFrontInterface} = $storeFrontInterface;
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $hashMap = $self->{storeFrontInterface}->toHashMap();
        my $storeFrontData = 'org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance();
        $hashMap->put($storeFrontData->{CURRENTHOMEHOSTNAME}, $self->{storeFrontInterface}->getCurrentHomeHostName());
        $hashMap->put($storeFrontData->{CURRENTHOMEHOSTNAMEPATH}, $self->{storeFrontInterface}->getCurrentHomeHostNamePath());
        $hashMap->put($storeFrontData->{CURRENTHOSTNAME}, $self->{storeFrontInterface}->getCurrentHostName());
        $hashMap->put($storeFrontData->{CURRENTHOSTNAMEPATH}, $self->{storeFrontInterface}->getCurrentHostNamePath());
        $hashMap->put($org::allbinary::business::user::commerce::inventory::basket::BasketData::NAME, $self->{storeFrontInterface}->getBasketName());
        my $node = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $storeFrontData->{NAME}, $hashMap);
        return $node;
}

use java::util::HashMap;
use org::allbinary::business::user::commerce::inventory::basket::BasketData;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::context::modules::storefront::StoreFrontData;

1;

