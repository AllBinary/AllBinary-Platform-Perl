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

package org::allbinary::business::user::UserData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $MAXLEN = 250;
our $NAME = "USER_NAME";
our $USERNAME = "CUSTOMER_USER_NAME";
our $PASSWORD = "CUSTOMER_PASSWORD";
our $PREFIXNAME = "CUSTOMER_PREFIX_NAME";
our $FIRSTNAME = "CUSTOMER_FIRST_NAME";
our $LASTNAME = "CUSTOMER_LAST_NAME";
our $MIDDLENAME = "CUSTOMER_MIDDLE_NAME";
our $SUFFIXNAME = "CUSTOMER_SUFFIX_NAME";
our $COMPANY = "CUSTOMER_COMPANY";
our $POSITIONATCOMPANY = "CUSTOMER_POSITION_AT_COMPANY";
our $MAINEMAIL = "CUSTOMER_MAIN_EMAIL";
our $SECONDARYEMAIL = "CUSTOMER_SECONDARY_EMAIL";
our $HOMEPHONE = "CUSTOMER_HOME_PHONE";
our $CELLPHONE = "CUSTOMER_CELL_PHONE";
our $WORKPHONE = "CUSTOMER_WORK_PHONE";
our $OTHERCONTACT = "CUSTOMER_OTHER_CONTACT";
our $ELECTRONICDEVICE = "CUSTOMER_ELECTRONIC_DEVICE";
our $FAX = "CUSTOMER_FAX";
our $SECRET = "CUSTOMER_SECRET";
our $PERMISSIONS = "CUSTOMER_PERMISSIONS";
our $CONFIGURATION = "CUSTOMER_CONFIGURATION";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


1;

