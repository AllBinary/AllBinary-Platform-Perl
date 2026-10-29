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

package org::allbinary::business::user::address::ShippingAddressData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SETTOBILLINGADDRESS = "Set To Billing Address";
our $SELECT = "Select Shipping Address";
our $SELECTNAME = "SELECTSHIPPINGADDRESS";
our $MULTIPLE = "SHIPPINGADDRESSES";
our $SHIPPINGADDRESSES = "SHIPPINGADDRESSES";
our $SHIPPINGADDRESS = "SHIPPINGADDRESS";
our $ID = "SHIPPINGADDRESS_ID";
our $ADDRESS = "SHIPPINGADDRESS_ADDRESS";
our $NAME = "SHIPPINGADDRESS_NAME";
our $STREET = "SHIPPINGADDRESS_STREET";
our $CITY = "SHIPPINGADDRESS_CITY";
our $STATE = "SHIPPINGADDRESS_STATE";
our $CODE = "SHIPPINGADDRESS_CODE";
our $COUNTRY = "SHIPPINGADDRESS_COUNTRY";
our $TAX = "SHIPPINGADDRESS_TAX";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


1;

