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

package org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayPageData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $EXTENSION = ".jsp";
our $NAME = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
our $FORWARDMAKEPAYMENT = "MakePayment.jsp";
our $PAYMENTOPTIONS = "PaymentOptions" . $org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayPageData::EXTENSION;
our $STARTCHECKOUT = "StartCheckout" . $org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayPageData::EXTENSION;

sub _init_fields {
    my ($self) = @_;
    $self->{MAKEPAYMENT} = undef;
    $self->{CHECKOUT} = undef;
    $self->{SHIPPING} = undef;
    $self->{SHIPPINGADDRESS} = undef;
    $self->{SHIPPINGADDRESSACTION} = undef;
    $self->{BILLINGADDRESS} = undef;
    $self->{PAYMENT} = undef;
    $self->{AUTHORIZE} = undef;
    $self->{FINISH} = undef;
}


sub new {
    my ($class, $location, $paymentMethod) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $paymentMethodString = $org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayPageData::NAME . $paymentMethod;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($location);
        $stringBuffer->append("MakePayment");
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayPageData::EXTENSION);
        $self->{MAKEPAYMENT} = $stringBuffer->toString();
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append($paymentMethodString);
        $stringBuffer->append("Checkout");
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayPageData::EXTENSION);
        $self->{CHECKOUT} = $stringBuffer->toString();
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append($paymentMethodString);
        $stringBuffer->append("Shipping");
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayPageData::EXTENSION);
        $self->{SHIPPING} = $stringBuffer->toString();
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append($paymentMethodString);
        $stringBuffer->append("ShippingAddress");
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayPageData::EXTENSION);
        $self->{SHIPPINGADDRESS} = $stringBuffer->toString();
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append($paymentMethodString);
        $stringBuffer->append("ShippingAddressAction");
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayPageData::EXTENSION);
        $self->{SHIPPINGADDRESSACTION} = $stringBuffer->toString();
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append($paymentMethodString);
        $stringBuffer->append("BillingAddress");
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayPageData::EXTENSION);
        $self->{BILLINGADDRESS} = $stringBuffer->toString();
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append($paymentMethodString);
        $stringBuffer->append("Payment");
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayPageData::EXTENSION);
        $self->{PAYMENT} = $stringBuffer->toString();
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append($paymentMethodString);
        $stringBuffer->append("Authorize");
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayPageData::EXTENSION);
        $self->{AUTHORIZE} = $stringBuffer->toString();
        $stringBuffer->delete(0, $stringBuffer->length());
        $stringBuffer->append($paymentMethodString);
        $stringBuffer->append("PaymentFinish");
        $stringBuffer->append($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayPageData::EXTENSION);
        $self->{FINISH} = $stringBuffer->toString();
    return $self;
}

use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;

1;

