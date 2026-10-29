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
package org::allbinary::data::tables::user::address::StreetAddressesEntityInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::BasicDataTableInterface';



sub remove {
    my ($self, $index) = @_;
    die "abstract method remove";
}


sub add {
    my ($self, $address) = @_;
    die "abstract method add";
}


sub update {
    my ($self, $address) = @_;
    die "abstract method update";
}


sub getLastId {
    my ($self) = @_;
    die "abstract method getLastId";
}


sub getDefault {
    my ($self) = @_;
    die "abstract method getDefault";
}


sub setDefault {
    my ($self, $value) = @_;
    die "abstract method setDefault";
}

use org::allbinary::business::user::address::StreetAddress;
use org::allbinary::data::tables::BasicDataTableInterface;

1;

