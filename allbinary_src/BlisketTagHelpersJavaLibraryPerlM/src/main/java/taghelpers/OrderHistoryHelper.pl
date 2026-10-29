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

package taghelpers::OrderHistoryHelper;
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
    $self->{request} = undef;
    $self->{streetAddress} = undef;
    $self->{id} = undef;
    $self->{groupId} = undef;
    $self->{status} = undef;
    $self->{newStatus} = undef;
}


sub new {
    my ($class, $propertiesHashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{propertiesHashMap} = $propertiesHashMap;
        $self->{pageContext} = $pageContext;
        $self->{request} = $pageContext->getRequest();
        my $storeName = $propertiesHashMap->get('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME});
        $self->{newStatus} = $propertiesHashMap->get($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::STATUS);
        if (defined($storeName)) {
            $self->{storeFrontInterface} = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($storeName);
        }
        $self->getFormData();
    return $self;
}


sub getFormData {
    my ($self) = @_;
        $self->{id} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderData::ID);
        $self->{groupId} = $self->{request}->getParameter($org::allbinary::business::user::commerce::shipping::ShippingMethodData::GROUP);
        if (!defined($self->{newStatus})) {
            $self->{newStatus} = $self->{request}->getParameter($org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::STATUS);
        }
}


sub setOrderStatus {
    my ($self) = @_;
        try {
            my $success = "Status successfully set to: " . $self->{status};
            my $orderReviewInterface = 'org::allbinary::business::user::commerce::inventory::order::OrderHistoryFactory'->getInstance($self->{id});
            my $status = $orderReviewInterface->getStatus();
            if (($status cmp $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::CANCELLED) == 0) {
                return "Order " . $self->{id} . " Already Cancelled<br/>";
            } elsif (($status cmp $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::SHIPPED) == 0) {
                return "Order " . $self->{id} . " Already Shipped. You can't cancel a shipped order.<br/>";
            } elsif (($status cmp $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PREPROCESSING) == 0) {
                return "Order " . $self->{id} . " has been cancelled.<br/>";
            } elsif (($status cmp $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PARTIALLYSHIPPED) == 0) {
                return "Order " . $self->{id} . " Partially Shipped. You can cancel unshipped items, but not the whole order.<br/>";
            } elsif (($status cmp $org::allbinary::business::user::commerce::inventory::order::OrderHistoryData::PROCESSING) == 0) {
                my $orderHistoryEntityInterface = 'org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityFactory'->getInstance();
                $orderHistoryEntityInterface->setStatus($self->{id}, $self->{newStatus});
                return "Order " . $self->{id} . " has been cancelled.<br/>";
            }
            if ($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF($success, $self, "setOrderStatus()");
            }
            return "Error Setting Order Status";
        } catch ($e) {
            my $error = "Failed to set order status";
            if ($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "setOrderStatus()", $e);
            }
            return $error . "<br/>" . "Exception: " . $e . "<br/>";
        }
}

use java::util::HashMap;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::PageContext;
use admin::taghelpers::TagHelper;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::address::StreetAddress;
use org::allbinary::business::user::commerce::inventory::order::OrderData;
use org::allbinary::business::user::commerce::inventory::order::OrderHistoryData;
use org::allbinary::business::user::commerce::inventory::order::OrderHistoryFactory;
use org::allbinary::business::user::commerce::inventory::order::OrderHistoryInterface;
use org::allbinary::business::user::commerce::shipping::ShippingMethodData;
use org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityFactory;
use org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityInterface;
use org::allbinary::logic::communication::http::request::session::WeblisketSession;
use org::allbinary::logic::communication::log::LogUtil;

1;

