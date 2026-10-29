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

package admin::taghelpers::OrderHelper;
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
}


sub new {
    my ($class, $propertiesHashMap, $pageContext) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{propertiesHashMap} = $propertiesHashMap;
        $self->{pageContext} = $pageContext;
        $self->{request} = $pageContext->getRequest();
        my $storeName = $propertiesHashMap->get('org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME});
        if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($storeName)) {
            $self->{storeFrontInterface} = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($storeName);
        }
        $self->{weblisketSession} = 'org::allbinary::logic::communication::http::request::session::WeblisketSession'->new($self->{propertiesHashMap}, $self->{pageContext});
    return $self;
}


sub setPaymentGateway {
    my ($self) = @_;
        try {
            my $paymentGatewayBoolean = 0;
            my $orderInterface = $self->{weblisketSession}->getOrder();
            my $requestPaymentGateway = $self->{request}->getParameter($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::NAME->toString());
            if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($requestPaymentGateway)) {
                $self->{weblisketSession}->setPaymentMethod($requestPaymentGateway);
                $orderInterface->setPaymentMethod($requestPaymentGateway);
                $paymentGatewayBoolean = 1;
            }
            my $paymentGatewayEntityInterface = 'org::allbinary::data::tables::user::commerce::money::payment::gateway::PaymentGatewayEntityFactory'->getInstance();
            my $paymentTypeVector = $paymentGatewayEntityInterface->findPaymentTypeVectorByStore($self->{weblisketSession}->getStoreName());
            if ($paymentTypeVector->size() == 1) {
                my $paymentType = $paymentTypeVector->get(0);
                my $paymentGatewayInterface = $paymentGatewayEntityInterface->getPaymentGatewayInterface($self->{weblisketSession}->getStoreName(), $paymentType);
                my $paymentGateway = $paymentGatewayInterface->getName();
                $self->{weblisketSession}->setPaymentMethod($paymentGateway);
                $orderInterface->setPaymentMethod($paymentGateway);
                $paymentGatewayBoolean = 1;
            }
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Successfully set PaymentGateway Order: ");
                $stringBuffer->append($orderInterface->getId());
                $stringBuffer->append(" to: ");
                $stringBuffer->append($orderInterface->getPaymentMethod());
                $self->{logUtil}->putF($stringBuffer->toString(), $self, "setPaymentGateway()");
            }
            return $paymentGatewayBoolean;
        } catch ($e) {
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                $stringBuffer->append("Failed to set PaymentGateway for Order: ");
                try {
                    my $orderInterface = $self->{weblisketSession}->getOrder();
                    if (defined($orderInterface)) {
                        $stringBuffer->append($orderInterface->getId());
                        $stringBuffer->append(" to: ");
                        $stringBuffer->append($orderInterface->getPaymentMethod());
                    }
                } catch ($ex) {
                    $stringBuffer->append(" Exception Getting");
                }
                $self->{logUtil}->put($stringBuffer->toString(), $self, "setPaymentGateway()", $e);
            }
            return 0;
        }
}


sub process {
    my ($self) = @_;
        try {
            my $order = $self->{weblisketSession}->getOrder();
            $order->setStoreName($self->{storeFrontInterface}->getName());
            my $result = 'org::allbinary::business::user::commerce::inventory::order::OrderProcessorUtil'->getInstance()->process($self->{weblisketSession}->getUserName(), $order);
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGS})) {
                $self->{logUtil}->putF("Successfully Processed Order: " . $result, $self, "processOrder()");
            }
            return $result;
        } catch ($e) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Failed to Process Order: ");
            try {
                $stringBuffer->append($self->{weblisketSession}->getOrder()->getId());
            } catch ($ex) {
                $stringBuffer->append(" Exception Getting Id");
            }
            my $error = $stringBuffer->toString();
            if ($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($admin::taghelpers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLTAGSERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{PROCESS}, $e);
            }
            return $error;
        }
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::business::context::modules::storefront::StoreFrontFactory;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::commerce::inventory::order::Order;
use org::allbinary::business::user::commerce::inventory::order::OrderInterface;
use org::allbinary::business::user::commerce::inventory::order::OrderProcessorUtil;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayInterface;
use org::allbinary::business::user::commerce::money::payment::types::BasicPaymentType;
use org::allbinary::data::tables::user::commerce::money::payment::gateway::PaymentGatewayEntity;
use org::allbinary::data::tables::user::commerce::money::payment::gateway::PaymentGatewayEntityFactory;
use org::allbinary::logic::communication::http::request::session::WeblisketSession;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringValidationUtil;
use admin::taghelpers::TagHelper;

1;

