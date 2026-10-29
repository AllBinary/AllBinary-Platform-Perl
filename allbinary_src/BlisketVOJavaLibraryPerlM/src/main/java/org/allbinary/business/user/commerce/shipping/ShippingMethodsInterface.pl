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
package org::allbinary::business::user::commerce::shipping::ShippingMethodsInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub get {
    my ($self) = @_;
    die "abstract method get";
}


# throws Exception
sub getShippingInterface {
    my ($self, $name) = @_;
    die "abstract method getShippingInterface";
}


# throws Exception
sub getDefault {
    my ($self) = @_;
    die "abstract method getDefault";
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::user::commerce::shipping::modules::ShippingInterface;

1;

