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
package org::allbinary::graphics::displayable::DisplayableInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub addCommand {
    my ($self, $cmd) = @_;
    die "abstract method addCommand";
}


sub getHeight {
    my ($self) = @_;
    die "abstract method getHeight";
}


sub getWidth {
    my ($self) = @_;
    die "abstract method getWidth";
}


sub removeCommand {
    my ($self, $cmd) = @_;
    die "abstract method removeCommand";
}


sub setCommandListener {
    my ($self, $l) = @_;
    die "abstract method setCommandListener";
}

# use javax::microedition::lcdui::Command;
# use javax::microedition::lcdui::CommandListener;

1;

