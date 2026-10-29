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

package org::allbinary::business::user::commerce::money::payment::gateway::processor::PaymentProcessorInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::user::commerce::money::payment::gateway::processor::PaymentProcessorInterfaceFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::user::commerce::money::payment::gateway::processor::PaymentProcessorInterfaceFactory::instance;
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
    my ($self, $transformInfoInterface) = @_;
        try {
            my $paymentTransactionInterface = 'org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionInterfaceRequestFactory'->getInstance()->getInstance($transformInfoInterface);
            my $gatewayName = $paymentTransactionInterface->getOrderHistory()->getPaymentMethod();
            if (!'org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($gatewayName)) {
                my $paymentType = 'org::allbinary::business::user::commerce::money::payment::types::PaymentTypeUtil'->getInstance()->get($gatewayName);
                my $paymentProcessorInterfaceFactoryInterface = $paymentType->getPaymentProcessorInterfaceFactoryInterface();
                return $paymentProcessorInterfaceFactoryInterface->getInstance($transformInfoInterface, $paymentTransactionInterface);
            }
            die ("Error Getting PaymentProcessorInterface");
        } catch ($e) {
            if ($org::allbinary::business::user::commerce::money::payment::gateway::processor::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::money::payment::gateway::processor::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{PAYMENTERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{GET_INSTANCE}, $e);
            }
            die $e;
        }
}

use org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionInterface;
use org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionInterfaceRequestFactory;
use org::allbinary::business::user::commerce::money::payment::types::PaymentType;
use org::allbinary::business::user::commerce::money::payment::types::PaymentTypeUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::string::CommonStrings;

1;

