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
package org::allbinary::midlet::MidletCompositeInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub setMidlet {
    my ($self, $midlet) = @_;
    die "abstract method setMidlet";
}


sub getMidlet {
    my ($self) = @_;
    die "abstract method getMidlet";
}


sub getDisplayable {
    my ($self) = @_;
    die "abstract method getDisplayable";
}

# use javax::microedition::lcdui::Displayable;
# use javax::microedition::midlet::MIDlet;

1;

