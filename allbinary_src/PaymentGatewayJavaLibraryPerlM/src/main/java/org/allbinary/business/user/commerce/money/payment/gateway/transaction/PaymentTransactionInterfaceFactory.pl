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

package org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionInterfaceFactory'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance_j0 {
    my ($class) = @_;
        return $org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionInterfaceFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


# throws Exception
sub getInstance_j1 {
    my ($self, $orderReview) = @_;
        try {
            my $gatewayName = $orderReview->getPaymentMethod();
            if (defined($gatewayName)) {
                my $paymentType = 'org::allbinary::business::user::commerce::money::payment::types::PaymentTypeUtil'->getInstance()->get($gatewayName);
                my $paymentTransactionInterfaceFactoryInterface = $paymentType->getPaymentTransactionInterfaceFactoryInterface();
                my $paymentTransactionInterface = $paymentTransactionInterfaceFactoryInterface->getInstance($orderReview);
                return $paymentTransactionInterface;
            }
            die ("Failed to create PaymentTransactionInterface: " . "GatewayName is: " . $gatewayName);
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{PAYMENTERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put("Failed to generate test data", $self, $commonStrings->{GET_INSTANCE}, $e);
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

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::business::user::commerce::inventory::order::OrderHistory ();
use org::allbinary::business::user::commerce::money::payment::types::PaymentType ();
use org::allbinary::business::user::commerce::money::payment::types::PaymentTypeUtil ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::string::CommonStrings ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory ();
use org::allbinary::logic::communication::log::config::type::LogConfigTypes ();

1;

