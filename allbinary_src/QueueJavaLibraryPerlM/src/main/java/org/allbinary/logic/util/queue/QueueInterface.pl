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
sub remove {
    my ($self, $anyType) = @_;
    die "abstract method remove";
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub remove {
    my ($self) = @_;
    die "abstract method remove";
}


1;

