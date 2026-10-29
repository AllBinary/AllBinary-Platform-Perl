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
package org::allbinary::graphics::j2me::workarea::tools::PointsInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getPoints {
    my ($self) = @_;
    die "abstract method getPoints";
}


sub addPoints {
    my ($self, $vector) = @_;
    die "abstract method addPoints";
}

use org::allbinary::util::BasicArrayList;

1;

