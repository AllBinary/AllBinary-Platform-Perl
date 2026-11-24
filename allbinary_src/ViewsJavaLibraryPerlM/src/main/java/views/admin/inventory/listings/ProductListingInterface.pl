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
package views::admin::inventory::listings::ProductListingInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



# throws Exception
sub generateAll_j0 {
    my ($self) = @_;
    die "abstract method generateAll";
}


# throws Exception
sub generateAll_j1 {
    my ($self, $storeName) = @_;
    die "abstract method generateAll";
}

sub generateAll {
    my ($invocant, @arguments) = @_;
    return $invocant->generateAll_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->generateAll_j1(@arguments) if scalar(@arguments) == 1;
    die "No method generateAll takes " . scalar(@arguments) . " arguments";
}


1;

