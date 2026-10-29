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
package admin::taghelpers::BasicTableInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



# throws Exception
sub drop {
    my ($self) = @_;
    die "abstract method drop";
}


# throws Exception
sub create {
    my ($self) = @_;
    die "abstract method create";
}


# throws Exception
sub restore {
    my ($self) = @_;
    die "abstract method restore";
}


# throws Exception
sub backup {
    my ($self) = @_;
    die "abstract method backup";
}


1;

