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

package org::allbinary::business::user::commerce::money::payment::gateway::PaymentGatewayEncryptedMapping;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::TableMappingInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{paymentGatewayInterface} = undef;
}


sub new {
    my ($class, $paymentGatewayInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{paymentGatewayInterface} = $paymentGatewayInterface;
    return $self;
}


# throws Exception
sub toHashMap {
    my ($self) = @_;
        return $self->{paymentGatewayInterface}->toHashMap(1);
}


sub toVector {
    my ($self) = @_;
        return $self->{paymentGatewayInterface}->toVector(1);
}


# throws Exception
sub getKey {
    my ($self) = @_;
        return $self->{paymentGatewayInterface}->getKey();
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tables::TableMappingInterface;

1;

