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

package org::allbinary::business::user::address::BillingAddressData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $MAX = 255;
our $MIN = 0;
our $MULTIPLE = "BILLINGADDRESSES";
our $STATES = "BILLINGADDRESS_STATES";
our $SETTOSHIPPINGADDRESS = "Set To Shipping Address";
our $SELECT = "Select Billing Address";
our $SETTOSHIPPINGADDRESSNAME = "SETTOSHIPPINGADDRESS";
our $BILLINGADDRESSES = "BILLINGADDRESSES";
our $BILLINGADDRESS = "BILLINGADDRESS";
our $ID = "BILLINGADDRESS_ID";
our $ADDRESS = "BILLINGADDRESS_ADDRESS";
our $NAME = "BILLINGADDRESS_NAME";
our $STREET = "BILLINGADDRESS_STREET";
our $CITY = "BILLINGADDRESS_CITY";
our $STATE = "BILLINGADDRESS_STATE";
our $CODE = "BILLINGADDRESS_CODE";
our $COUNTRY = "BILLINGADDRESS_COUNTRY";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


1;

