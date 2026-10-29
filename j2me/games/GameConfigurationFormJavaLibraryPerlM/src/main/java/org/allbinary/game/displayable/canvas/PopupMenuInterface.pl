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
package org::allbinary::game::displayable::canvas::PopupMenuInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



# throws Exception
sub popupMenu {
    my ($self) = @_;
    die "abstract method popupMenu";
}


sub closeMenu {
    my ($self) = @_;
    die "abstract method closeMenu";
}


# throws Exception
sub toggleMenu {
    my ($self) = @_;
    die "abstract method toggleMenu";
}


1;

