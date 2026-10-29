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

package org::allbinary::business::user::commerce::inventory::order::OrderProcessorUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::user::commerce::inventory::order::OrderProcessorUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{ORDER_PROCESSED} = "Order Processed";
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::user::commerce::inventory::order::OrderProcessorUtil::instance;
}


# throws Exception
sub process {
    my ($self, $userName, $order) = @_;
        my $orderItems = 'org::allbinary::data::tables::user::commerce::inventory::order::OrderItemsEntity'->new();
        my $orderHistory = 'org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntity'->new();
        $order->setId('org::allbinary::data::generator::OrderIdGenerator'->new()->getNext());
        $orderItems->insert($userName, $order);
        $orderHistory->insert($userName, $order);
        return $self->{ORDER_PROCESSED};
}

use org::allbinary::data::generator::OrderIdGenerator;
use org::allbinary::data::tables::user::commerce::inventory::order::OrderHistoryEntity;
use org::allbinary::data::tables::user::commerce::inventory::order::OrderItemsEntity;

1;

