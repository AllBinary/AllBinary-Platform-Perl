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
package org::allbinary::business::user::commerce::money::payment::PaymentInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub setName {
    my ($self, $value) = @_;
    die "abstract method setName";
}


sub setType {
    my ($self, $value) = @_;
    die "abstract method setType";
}


sub setExpiration {
    my ($self, $value) = @_;
    die "abstract method setExpiration";
}


sub setNumber {
    my ($self, $value) = @_;
    die "abstract method setNumber";
}


sub getId {
    my ($self) = @_;
    die "abstract method getId";
}


sub getName {
    my ($self) = @_;
    die "abstract method getName";
}


sub getType {
    my ($self) = @_;
    die "abstract method getType";
}


sub getExpiration {
    my ($self) = @_;
    die "abstract method getExpiration";
}


sub getEncryption {
    my ($self) = @_;
    die "abstract method getEncryption";
}


sub getNumber {
    my ($self) = @_;
    die "abstract method getNumber";
}


sub getLastFour {
    my ($self) = @_;
    die "abstract method getLastFour";
}


sub isDefault {
    my ($self) = @_;
    die "abstract method isDefault";
}


1;

