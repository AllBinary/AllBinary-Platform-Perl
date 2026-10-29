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

our $instance = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionInterfaceFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionInterfaceFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
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
            if ($org::allbinary::business::user::commerce::money::payment::gateway::transaction::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::money::payment::gateway::transaction::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PAYMENTERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put("Failed to generate test data", $self, $commonStrings->{GET_INSTANCE}, $e);
            }
            die $e;
        }
}

use org::allbinary::business::user::commerce::inventory::order::OrderHistory;
use org::allbinary::business::user::commerce::money::payment::types::PaymentType;
use org::allbinary::business::user::commerce::money::payment::types::PaymentTypeUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

