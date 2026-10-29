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
package org::allbinary::logic::control::contraints::MinMaxDoubleConstraintInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getMax {
    my ($self) = @_;
    die "abstract method getMax";
}


sub getMin {
    my ($self) = @_;
    die "abstract method getMin";
}


sub setMax {
    my ($self, $max) = @_;
    die "abstract method setMax";
}


sub setMin {
    my ($self, $min) = @_;
    die "abstract method setMin";
}


1;

