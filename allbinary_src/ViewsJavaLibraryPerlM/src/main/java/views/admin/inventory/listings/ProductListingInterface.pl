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
sub generateAll {
    my ($self) = @_;
    die "abstract method generateAll";
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub generateAll {
    my ($self, $storeName) = @_;
    die "abstract method generateAll";
}


1;

