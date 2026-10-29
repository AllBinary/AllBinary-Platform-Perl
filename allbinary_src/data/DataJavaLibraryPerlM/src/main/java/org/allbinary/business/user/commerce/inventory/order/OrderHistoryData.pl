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

package org::allbinary::business::user::commerce::inventory::order::OrderHistoryData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $MAXIDLEN = 19;
our $DATEDELTA = "DATE_DELTA";
our $DATETYPE = "DATE_TYPE";
our $TYPELONG = "TYPE_LONG";
our $TYPECAESAR = "TYPE_CAESAR";
our $TODATE = "TO_DATE";
our $FROMHOUR = "FROM_HOUR";
our $FROMDAY = "FROM_DAY";
our $FROMMONTH = "FROM_MONTH";
our $FROMYEAR = "FROM_YEAR";
our $TOHOUR = "TO_HOUR";
our $TODAY = "TO_DAY";
our $TOMONTH = "TO_MONTH";
our $TOYEAR = "TO_YEAR";
our $ORDERHISTORY = "ORDERHISTORY";
our $SHIPPEDDATE = "ORDERHISTORY_SHIPPED_DATE";
our $ORDERDATE = "ORDERHISTORY_ORDER_DATE";
our $TRANSDATE = "ORDERHISTORY_TRANS_DATE";
our $CANCELDATE = "ORDERHISTORY_CANCEL_DATE";
our $SHIPPEDDATEFORMATTED = "ORDERHISTORY_SHIPPED_DATE_FORMATTED";
our $ORDERDATEFORMATTED = "ORDERHISTORY_ORDER_DATE_FORMATTED";
our $TRANSDATEFORMATTED = "ORDERHISTORY_TRANS_DATE_FORMATTED";
our $CANCELDATEFORMATTED = "ORDERHISTORY_CANCEL_DATE_FORMATTED";
our $SUBTOTAL = "ORDERHISTORY_SUB_TOTAL";
our $SHIPPINGCOST = "ORDERHISTORY_SHIPPING_COST";
our $TAX = "ORDERHISTORY_TAX";
our $TOTAL = "ORDERHISTORY_TOTAL";
our $CANCELINFO = "ORDERHISTORY_CANCEL_INFO";
our $CANCELTYPE = "ORDERHISTORY_CANCEL_TYPE";
our $STATUS = "ORDERHISTORY_STATUS";
our $PREPROCESSINGNAME = "PREPROCESSING";
our $PROCESSINGNAME = "PROCESSING";
our $CANCELLEDNAME = "CANCELLED";
our $PARTIALLYSHIPPEDNAME = "PARTIALLYSHIPPED";
our $SHIPPEDNAME = "SHIPPED";
our $PREPROCESSING = "Order Preprocessing";
our $PROCESSING = "Order Processing";
our $CANCELLED = "Order Cancelled";
our $PARTIALLYSHIPPED = "Order Partially Shipped";
our $SHIPPED = "Order Shipped";
our $SETSTATUS = "Set Status";

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


1;

