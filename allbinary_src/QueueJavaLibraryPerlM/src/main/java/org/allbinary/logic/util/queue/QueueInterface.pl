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
package org::allbinary::logic::util::queue::QueueInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



# throws Exception
sub offer {
    my ($self, $anyType) = @_;
    die "abstract method offer";
}


# throws Exception
sub remove_j1 {
    my ($self, $anyType) = @_;
    die "abstract method remove";
}


# throws Exception
sub remove_j0 {
    my ($self) = @_;
    die "abstract method remove";
}

sub remove {
    my ($invocant, @arguments) = @_;
    return $invocant->remove_j1(@arguments) if scalar(@arguments) == 1;
    return $invocant->remove_j0(@arguments) if scalar(@arguments) == 0;
    die "No method remove takes " . scalar(@arguments) . " arguments";
}


1;

