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

package org::allbinary::business::user::address::StreetAddressData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $MAX = 255;
our $MIN = 0;
our $FORM = "FORM";
our $STATES = "STATES";
our $NUMBEROFADDRESSES = "STREETADDRESS_NUMBEROFADDRESSES";
our $ID = "STREETADDRESS_ID";
our $DEFAULT = "STREETADDRESS_DEFAULT_ADDRESS";
our $ADDRESS = "STREETADDRESS_ADDRESS";
our $NAME = "STREETADDRESS_NAME";
our $STREET = "STREETADDRESS_STREET";
our $CITY = "STREETADDRESS_CITY";
our $STATE = "STREETADDRESS_STATE";
our $CODE = "STREETADDRESS_CODE";
our $COUNTRY = "STREETADDRESS_COUNTRY";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


1;

