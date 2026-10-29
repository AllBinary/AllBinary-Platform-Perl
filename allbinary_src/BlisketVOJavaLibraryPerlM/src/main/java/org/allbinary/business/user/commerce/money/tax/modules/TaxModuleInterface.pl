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
package org::allbinary::business::user::commerce::money::tax::modules::TaxModuleInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



# throws Exception
sub getTaxRate {
    my ($self, $streetAddress, $storeFrontInterface) = @_;
    die "abstract method getTaxRate";
}


# throws Exception
sub isValid {
    my ($self, $streetAddress, $storeFrontInterface) = @_;
    die "abstract method isValid";
}

use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::address::StreetAddress;

1;

