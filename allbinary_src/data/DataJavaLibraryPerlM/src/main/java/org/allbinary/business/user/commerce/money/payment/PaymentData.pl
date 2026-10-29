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

package org::allbinary::business::user::commerce::money::payment::PaymentData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $MIN = 4;
our $MAX = 19;
our $ADDNEW = "Add New Payment";
our $VIEW = "View Payment";
our $SELECT = "Select Payment";
our $CHANGE = "Change Payment";
our $PAYMENT = "PAYMENT";
our $METHOD = "PAYMENT_METHOD";
our $ID = "PAYMENT_ID";
our $NUMBER = "PAYMENT_NUMBER";
our $NAME = "PAYMENT_NAME";
our $TYPE = "PAYMENT_TYPE";
our $EXPIRATION = "PAYMENT_EXPIRATION";
our $TENDERTYPE = "PAYMENT_TENDERTYPE";
our $TRANSACTIONTYPE = "PAYMENT_TRANSACTIONTYPE";
our $ABA = "PAYMENT_ABA";
our $ACCOUNT = "PAYMENT_ACCOUNT";
our $ACCOUNTTYPE = "PAYMENT_ACCOUNTTYPE";
our $AUTHORIZATIONCODE = "PAYMENT_AUTHORIZATIONCODE";
our $CHECKNUMBER = "PAYMENT_CHECKNUMBER";
our $CHECKTYPE = "PAYMENT_CHECKTYPE";
our $DRIVERSLICENSE = "PAYMENT_DRIVERSLICENSE";
our $MAGNETICINKCHECKREADER = "PAYMENT_MAGNETICINKCHECKREADER";

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


1;

