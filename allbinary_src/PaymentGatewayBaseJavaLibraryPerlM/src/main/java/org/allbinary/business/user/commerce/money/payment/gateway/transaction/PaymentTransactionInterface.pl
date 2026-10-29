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
package org::allbinary::business::user::commerce::money::payment::gateway::transaction::PaymentTransactionInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::TableMappingInterface','org::allbinary::data::tree::dom::DomNodeInterface';



sub getOrderHistory {
    my ($self) = @_;
    die "abstract method getOrderHistory";
}

use org::allbinary::business::user::commerce::inventory::order::OrderHistory;
use org::allbinary::data::tables::TableMappingInterface;
use org::allbinary::data::tree::dom::DomNodeInterface;

1;

