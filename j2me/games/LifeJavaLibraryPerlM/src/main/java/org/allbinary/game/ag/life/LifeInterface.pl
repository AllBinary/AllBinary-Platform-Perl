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
package org::allbinary::game::ag::life::LifeInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub get {
    my ($self) = @_;
    die "abstract method get";
}


sub set {
    my ($self, $lives) = @_;
    die "abstract method set";
}


sub reset {
    my ($self) = @_;
    die "abstract method reset";
}


sub add {
    my ($self, $lives) = @_;
    die "abstract method add";
}


sub deaths {
    my ($self, $lives) = @_;
    die "abstract method deaths";
}


sub getMaxlives {
    my ($self) = @_;
    die "abstract method getMaxlives";
}


sub isAlive {
    my ($self) = @_;
    die "abstract method isAlive";
}


1;

