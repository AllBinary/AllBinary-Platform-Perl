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

package org::allbinary::business::user::commerce::inventory::basket::BasketData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $BASKET = "BASKET";
our $NAME = "NAME";
our $BASKETREVIEW = "BASKET_REVIEW";
our $TOTALWEIGHT = "BASKET_TOTALWEIGTH";
our $ITEMTOTAL = "BASKET_ITEMTOTAL";
our $ITEMTOTALINBASKET = "BASKET_ITEMTOTALINBASKET";
our $SUBTOTAL = "BASKET_SUBTOTAL";
our $ISEMPTY = "BASKET_ISEMPTY";
our $INSERT = "BASKET_INSERT";
our $DELETE = "BASKET_DELETE";
our $ADJUST = "BASKET_ADJUST";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


1;

