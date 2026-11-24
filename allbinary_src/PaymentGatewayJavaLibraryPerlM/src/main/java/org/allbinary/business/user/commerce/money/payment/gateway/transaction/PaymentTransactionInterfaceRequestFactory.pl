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

package org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionInterfaceRequestFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionInterfaceRequestFactory'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}


sub getInstance_j0 {
    my ($class) = @_;
        return $org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionInterfaceRequestFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


# throws Exception
sub getInstance_j1 {
    my ($self, $transformInfoInterface) = @_;
        try {
            my $httpTransformInfoInterface = $transformInfoInterface;
            my $pageContext = $httpTransformInfoInterface->getPageContext();
            my $httpServletRequest = $pageContext->getRequest();
            my $command = $httpServletRequest->getParameter($org::allbinary::globals::GLOBALS2::ADMINCOMMAND);
            if (defined($command) && ($command cmp $org::allbinary::globals::GLOBALS2::AUTHORIZEFORMEVALBODYONERROR) == 0) {
                return $self->generateFromTestData($transformInfoInterface);
            } else {
                my $propertiesHashMap = $httpTransformInfoInterface->getPropertiesHashMap();
                my $weblisketSession = 'org::allbinary::logic::communication::http::request::session::WeblisketSession'->new($propertiesHashMap, $pageContext);
                my $storeFrontInterface = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($weblisketSession->getStoreName());
                my $order = $weblisketSession->getOrder();
                my $orderId = $order->getId();
                my $orderHistoryEntityInterface = 'org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityFactory'->getInstance();
                my $orderReview = $orderHistoryEntityInterface->getOrder($orderId);
                my $orderPaymentInfo = $orderReview->getPaymentInfo();
                $orderPaymentInfo->setTransactionType('org::allbinary::business::user::commerce::money::payment::types::TransactionTypeFactory'->getInstance()->{SALE}->toString());
                $orderPaymentInfo->setTenderType('org::allbinary::business::user::commerce::money::payment::types::TenderTypeFactory'->getInstance()->{CREDITCARD}->toString());
                $orderReview->setPaymentInfo($orderPaymentInfo);
                if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PAYMENT})) {
                    $self->{logUtil}->putF($orderReview->getId(), $self, "getPaymentTransactionInterface()");
                }
                my $paymentTransactionInterface = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionInterfaceFactory'->getInstance()->getInstance($orderReview);
                return $paymentTransactionInterface;
            }
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PAYMENTERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getPaymentTransactionInterface()", $e);
            }
            die $e;
        }
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->getInstance_j1(@arguments) if scalar(@arguments) == 1;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}


# throws Exception
sub generateFromTestData {
    my ($self, $transformInfoInterface) = @_;
        try {
            my $httpTransformInfoInterface = $transformInfoInterface;
            my $propertiesHashMap = $httpTransformInfoInterface->getPropertiesHashMap();
            my $pageContext = $httpTransformInfoInterface->getPageContext();
            my $weblisketSession = 'org::allbinary::logic::communication::http::request::session::WeblisketSession'->new($propertiesHashMap, $pageContext);
            my $storeFrontInterface = 'org::allbinary::business::context::modules::storefront::StoreFrontFactory'->getInstance($weblisketSession->getStoreName());
            my $httpServletRequest = $pageContext->getRequest();
            my $gatewayName = $weblisketSession->getPaymentMethod();
            if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($gatewayName)) {
                $gatewayName = $httpServletRequest->getParameter($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::NAME->toString());
            }
            my $transactionType = $httpServletRequest->getParameter($org::allbinary::business::user::commerce::money::payment::PaymentData::TRANSACTIONTYPE);
            my $tenderType = $httpServletRequest->getParameter($org::allbinary::business::user::commerce::money::payment::PaymentData::TENDERTYPE);
            my $payment = 'org::allbinary::business::user::commerce::money::payment::Payment'->new();
            $payment->setTransactionType($transactionType);
            $payment->setTenderType($tenderType);
            my $orderReview = 'org::allbinary::business::user::commerce::inventory::order::OrderHistory'->new('org::allbinary::business::user::commerce::inventory::basket::Basket'->new());
            $orderReview->setStoreName($storeFrontInterface->getName());
            $orderReview->setPaymentMethod($gatewayName);
            $orderReview->setUserName("testing");
            my $orderId = $httpServletRequest->getParameter("orderNumber");
            if (!defined($orderId) || ($orderId cmp 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING}) == 0) {
                $orderId = 'org::allbinary::data::generator::OrderIdGenerator'->new()->getNext();
                $orderReview->setId($orderId);
                my $account = $httpServletRequest->getParameter("account");
                my $expirationDate = $httpServletRequest->getParameter("expirationDate");
                my $checkNumber = $httpServletRequest->getParameter("checkNumber");
                my $driversLicense = $httpServletRequest->getParameter("driversLicense");
                my $magneticInkCheckReader = $httpServletRequest->getParameter("magneticInkCheckReader");
                my $aba = $httpServletRequest->getParameter("aba");
                my $accountType = $httpServletRequest->getParameter("accountType");
                my $name = $httpServletRequest->getParameter("name");
                $payment->setName($name);
                $payment->setNumber($account);
                $payment->setExpiration($expirationDate);
                $payment->setCheckNumber($checkNumber);
                $payment->setDriversLicense($driversLicense);
                $payment->setMagneticInkCheckReader($magneticInkCheckReader);
                $payment->setAba($aba);
                $payment->setAccountType($accountType);
                my $street = $httpServletRequest->getParameter("street");
                my $city = $httpServletRequest->getParameter("city");
                my $state = $httpServletRequest->getParameter("state");
                my $zip = $httpServletRequest->getParameter("zip");
                my $streetAddress = 'org::allbinary::business::user::address::StreetAddress'->new();
                $streetAddress->setName($name);
                $streetAddress->setStreet($street);
                $streetAddress->setCity($city);
                $streetAddress->setState($state);
                $streetAddress->setCode($zip);
                my $email = $httpServletRequest->getParameter("email");
                my $amount = $httpServletRequest->getParameter("amount");
                $orderReview->setTotal('org::allbinary::business::user::commerce::money::Money'->new($amount));
                $orderReview->setBillingAddress($streetAddress);
            } else {
                $orderReview->setId($orderId);
            }
            $orderReview->setPaymentInfo($payment);
            my $paymentTransactionInterface = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionInterfaceFactory'->getInstance()->getInstance($orderReview);
            return $paymentTransactionInterface;
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PAYMENTERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "generatePaymentTransactionInterfaceFromTestData()", $e);
            }
            die $e;
        }
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use java::util::HashMap ();
# use javax::servlet::http::HttpServletRequest ();
# use javax::servlet::jsp::PageContext ();
use org::allbinary::business::context::modules::storefront::StoreFrontFactory ();
use org::allbinary::business::context::modules::storefront::StoreFrontInterface ();
use org::allbinary::business::user::address::StreetAddress ();
use org::allbinary::business::user::commerce::inventory::basket::Basket ();
use org::allbinary::business::user::commerce::inventory::order::OrderHistory ();
use org::allbinary::business::user::commerce::inventory::order::OrderInterface ();
use org::allbinary::business::user::commerce::money::Money ();
use org::allbinary::business::user::commerce::money::payment::Payment ();
use org::allbinary::business::user::commerce::money::payment::PaymentData ();
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData ();
use org::allbinary::business::user::commerce::money::payment::types::TenderTypeFactory ();
use org::allbinary::business::user::commerce::money::payment::types::TransactionTypeFactory ();
use org::allbinary::data::generator::OrderIdGenerator ();
use org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityFactory ();
use org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntityInterface ();
use org::allbinary::logic::communication::http::request::session::WeblisketSession ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::logic::string::StringUtil ();
use org::allbinary::logic::string::StringValidationUtil ();
use org::allbinary::logic::visual::transform::info::TransformInfoHttpInterface ();
use org::allbinary::logic::visual::transform::info::TransformInfoInterface ();
use org::allbinary::string::CommonStrings ();
use org::allbinary::globals::GLOBALS2 ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypes ();
use org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionInterfaceFactory ();

1;

