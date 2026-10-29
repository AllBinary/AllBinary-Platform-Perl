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
package views::admin::inventory::listings::InventoryViewSearchInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



# throws Exception
sub searchSingleStaticPage {
    my ($self) = @_;
    die "abstract method searchSingleStaticPage";
}


# throws Exception
sub searchSingleDynamicPage {
    my ($self) = @_;
    die "abstract method searchSingleDynamicPage";
}


# throws Exception
sub search {
    my ($self) = @_;
    die "abstract method search";
}


# throws Exception
sub getProduct {
    my ($self, $product) = @_;
    die "abstract method getProduct";
}


1;

