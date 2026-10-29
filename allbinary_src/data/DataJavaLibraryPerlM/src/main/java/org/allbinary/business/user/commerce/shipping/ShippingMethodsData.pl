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

package org::allbinary::business::user::commerce::shipping::ShippingMethodsData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SHIPPINGMETHODSORDERSUMMARIES = "SHIPPINGMETHODS_ORDERSUMMARIES";
our $SHIPPINGMETHODORDERSUMMARY = "SHIPPINGMETHOD_ORDERSUMMARY";
our $SHIPPINGMETHODS = "SHIPPINGMETHODS";
our $NAME = "SHIPPINGMETHODS_NAME";
our $SHIPPINGCOST = "SHIPPINGMETHOD_SHIPPINGCOST";
our $TAXRATE = "SHIPPINGMETHOD_TAXRATE";
our $SUBTOTAL = "SHIPPINGMETHOD_SUBTOTAL";
our $TAX = "SHIPPINGMETHOD_TAX";
our $TOTAL = "SHIPPINGMETHOD_TOTAL";

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


1;

