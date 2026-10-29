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

package org::allbinary::business::context::modules::storefront::statistics::orders::history::StoreFrontOrdersHistoryStatisticsData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::context::modules::storefront::statistics::orders::history::StoreFrontOrdersHistoryStatisticsData'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NAME} = "STOREFRONT_ORDERS_HISTORY_STATISTICS_NAME";
    $self->{NUMBEROFORDERS} = "STOREFRONT_ORDERS_HISTORY_STATISTICS_NUMBER_OF_ORDERS";
    $self->{SUBTOTAL} = "STOREFRONT_ORDERS_HISTORY_STATISTICS_SUBTOTAL";
    $self->{SHIPPINGCOST} = "STOREFRONT_ORDERS_HISTORY_STATISTICS_SHIPPINGCOST";
    $self->{TAXES} = "STOREFRONT_ORDERS_HISTORY_STATISTICS_TAXES";
    $self->{TOTAL} = "STOREFRONT_ORDERS_HISTORY_STATISTICS_TOTAL";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::context::modules::storefront::statistics::orders::history::StoreFrontOrdersHistoryStatisticsData::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


1;

