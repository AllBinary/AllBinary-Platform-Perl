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

package org::allbinary::business::user::commerce::money::payment::gateway::modules::processor::authorizenet::aim::AuthorizeNetAimData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $X_DELIM_DATA = "x_delim_data";
our $X_DELIM_CHAR = "x_delim_char";
our $X_ENCAP_CHAR = "x_encap_char";
our $X_AUTHENTICATION_INDICATOR = "x_authentication_indicator";
our $X_CARDHOLDER_AUTHENTICATION_VALUE = "x_cardholder_authentication_value";
our $X_DRIVERS_LICENSE_NUM = "x_drivers_license_num";
our $X_DRIVERS_LICENSE_STATE = "x_drivers_license_state";
our $X_DRIVERS_LICENSE_DOB = "x_drivers_license_dob";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


1;

