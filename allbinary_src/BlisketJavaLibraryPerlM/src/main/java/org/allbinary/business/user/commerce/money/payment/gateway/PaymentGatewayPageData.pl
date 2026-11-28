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
use parent -norequire,'java::lang::Object';

our $EXTENSION = ".jsp";
tie our $NAME, 'java::lang::LazyStatic', sub { 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING} };
our $FORWARDMAKEPAYMENT = "MakePayment.jsp";
tie our $PAYMENTOPTIONS, 'java::lang::LazyStatic', sub { "PaymentOptions" . $org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayPageData::EXTENSION };
tie our $STARTCHECKOUT, 'java::lang::LazyStatic', sub { "StartCheckout" . $org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayPageData::EXTENSION };

sub _init_fields {
    my ($self) = @_;
    $self->{MAKEPAYMENT} = undef unless exists $self->{MAKEPAYMENT};
    $self->{CHECKOUT} = undef unless exists $self->{CHECKOUT};
    $self->{SHIPPING} = undef unless exists $self->{SHIPPING};
    $self->{SHIPPINGADDRESS} = undef unless exists $self->{SHIPPINGADDRESS};
    $self->{SHIPPINGADDRESSACTION} = undef unless exists $self->{SHIPPINGADDRESSACTION};
    $self->{BILLINGADDRESS} = undef unless exists $self->{BILLINGADDRESS};
    $self->{PAYMENT} = undef unless exists $self->{PAYMENT};
    $self->{AUTHORIZE} = undef unless exists $self->{AUTHORIZE};
    $self->{FINISH} = undef unless exists $self->{FINISH};
}


sub new {
    my ($class, $location, $paymentMethod) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
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

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::logic::string::StringMaker ();
use org::allbinary::logic::string::StringUtil ();

1;

