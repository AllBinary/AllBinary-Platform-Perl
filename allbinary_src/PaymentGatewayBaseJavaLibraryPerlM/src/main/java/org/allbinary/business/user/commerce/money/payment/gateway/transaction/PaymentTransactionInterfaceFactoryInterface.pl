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

# Java interface
package org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionInterfaceFactoryInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



# throws Exception
sub getInstance {
    my ($self, $orderHistory) = @_;
    die "abstract method getInstance";
}


# throws Exception
sub getSaleTransaction {
    my ($self, $tenderType) = @_;
    die "abstract method getSaleTransaction";
}


# throws Exception
sub getCreditTransaction {
    my ($self, $tenderType) = @_;
    die "abstract method getCreditTransaction";
}


# throws Exception
sub getAuthorizationTransaction {
    my ($self, $tenderType) = @_;
    die "abstract method getAuthorizationTransaction";
}


# throws Exception
sub getCaptureDelayedTransaction {
    my ($self, $tenderType) = @_;
    die "abstract method getCaptureDelayedTransaction";
}


# throws Exception
sub getVoidTransaction {
    my ($self, $tenderType) = @_;
    die "abstract method getVoidTransaction";
}


# throws Exception
sub getInquiryTransaction {
    my ($self, $tenderType) = @_;
    die "abstract method getInquiryTransaction";
}

use org::allbinary::business::user::commerce::inventory::order::OrderHistory;
use org::allbinary::business::user::commerce::money::payment::types::TenderType;

1;

