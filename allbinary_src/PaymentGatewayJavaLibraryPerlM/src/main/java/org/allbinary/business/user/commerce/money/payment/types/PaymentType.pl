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

package org::allbinary::business::user::commerce::money::payment::types::PaymentType;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{basicPaymentType} = undef;
    $self->{paymentTransactionInterfaceFactoryInterface} = undef;
    $self->{paymentProcessorInterfaceFactoryInterface} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    die "No constructor of PaymentType takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $basicPaymentType) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{basicPaymentType} = $basicPaymentType;
        $self->{paymentTransactionInterfaceFactoryInterface} = undef;
        $self->{paymentProcessorInterfaceFactoryInterface} = undef;
        'org::allbinary::business::user::commerce::money::payment::types::PaymentTypeUtil'->getInstance()->add($self);
    return $self;
}


sub _new3 {
    my ($class, $basicPaymentType, $paymentTransactionInterfaceFactoryInterface, $paymentProcessorInterfaceFactoryInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{basicPaymentType} = $basicPaymentType;
        $self->{paymentTransactionInterfaceFactoryInterface} = $paymentTransactionInterfaceFactoryInterface;
        $self->{paymentProcessorInterfaceFactoryInterface} = $paymentProcessorInterfaceFactoryInterface;
        'org::allbinary::business::user::commerce::money::payment::types::PaymentTypeUtil'->getInstance()->add($self);
    return $self;
}


# throws Exception
sub getPaymentTransactionInterfaceFactoryInterface {
    my ($self) = @_;
        if (!defined($self->{paymentTransactionInterfaceFactoryInterface})) {
            die ("PaymentTransactionInterfaceFactoryInterface is Null");
        }
        return $self->{paymentTransactionInterfaceFactoryInterface};
}


# throws Exception
sub getPaymentProcessorInterfaceFactoryInterface {
    my ($self) = @_;
        if (!defined($self->{paymentProcessorInterfaceFactoryInterface})) {
            die ("PaymentProcessorInterfaceFactoryInterface is Null");
        }
        return $self->{paymentProcessorInterfaceFactoryInterface};
}


sub toVector {
    my ($self) = @_;
        my $vector = 'org::allbinary::util::BasicArrayListD'->new();
        $vector->addAllList($self->getBasicPaymentType()->toVector());
        if (defined($self->{paymentTransactionInterfaceFactoryInterface})) {
            $vector->add(ref($self->{paymentTransactionInterfaceFactoryInterface}));
        }
        if (defined($self->{paymentProcessorInterfaceFactoryInterface})) {
            $vector->add(ref($self->{paymentProcessorInterfaceFactoryInterface}));
        }
        return $vector;
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->putAll($self->getBasicPaymentType()->toHashMap());
        if (defined($self->{paymentTransactionInterfaceFactoryInterface})) {
            $hashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PAYMENTTRANSACTIONINTERFACEFACTORYINTERFACE->toString(), ref($self->{paymentTransactionInterfaceFactoryInterface}));
        }
        if (defined($self->{paymentProcessorInterfaceFactoryInterface})) {
            $hashMap->put($org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData::PAYMENTPROCESSORINTERFACEFACTORYINTERFACE->toString(), ref($self->{paymentProcessorInterfaceFactoryInterface}));
        }
        return $hashMap;
}


sub getBasicPaymentType {
    my ($self) = @_;
        return $self->{basicPaymentType};
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayData;
use org::allbinary::business::user::commerce::money::payment::gateway::processor::PaymentProcessorInterfaceFactoryInterface;
use org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionInterfaceFactoryInterface;
use org::allbinary::logic::StdUtil;
use org::allbinary::business::user::commerce::money::payment::types::PaymentTypeUtil;

1;

