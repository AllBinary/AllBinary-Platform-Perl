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

# Java interface
package org::allbinary::data::tables::user::commerce::money::payment::gateway::PaymentGatewayEntityInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::BasicDataTableInterface';



sub getPaymentGatewayInterface {
    my ($self, $storeName, $paymentType) = @_;
    die "abstract method getPaymentGatewayInterface";
}


sub findPaymentTypeVectorByStore {
    my ($self, $storeName) = @_;
    die "abstract method findPaymentTypeVectorByStore";
}


sub remove {
    my ($self, $storeName, $paymentType) = @_;
    die "abstract method remove";
}


sub add {
    my ($self, $paymentGatewayInterface) = @_;
    die "abstract method add";
}


sub update {
    my ($self, $paymentGatewayInterface) = @_;
    die "abstract method update";
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayInterface;
use org::allbinary::business::user::commerce::money::payment::types::BasicPaymentType;
use org::allbinary::data::tables::BasicDataTableInterface;

1;

