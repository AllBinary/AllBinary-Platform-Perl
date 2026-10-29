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
package org::allbinary::data::tables::user::commerce::money::payment::PaymentEntityInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::BasicDataTableInterface';



sub getLastId {
    my ($self, $userName) = @_;
    die "abstract method getLastId";
}


sub setDefault {
    my ($self, $userName, $index) = @_;
    die "abstract method setDefault";
}


sub getDefault {
    my ($self, $userName) = @_;
    die "abstract method getDefault";
}


sub get {
    my ($self, $userName) = @_;
    die "abstract method get";
}


sub add {
    my ($self, $userName, $paymentInterface) = @_;
    die "abstract method add";
}


sub remove {
    my ($self, $userName, $index) = @_;
    die "abstract method remove";
}


sub insert {
    my ($self, $values) = @_;
    die "abstract method insert";
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::user::commerce::money::payment::PaymentInterface;
use org::allbinary::data::tables::BasicDataTableInterface;

1;

