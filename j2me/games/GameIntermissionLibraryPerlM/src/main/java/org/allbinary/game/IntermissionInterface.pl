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
package org::allbinary::game::IntermissionInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getTimeDelayHelper {
    my ($self) = @_;
    die "abstract method getTimeDelayHelper";
}


sub isEnabled {
    my ($self) = @_;
    die "abstract method isEnabled";
}


sub setEnabled {
    my ($self, $value) = @_;
    die "abstract method setEnabled";
}


sub setListener {
    my ($self, $enableListener) = @_;
    die "abstract method setListener";
}

use org::allbinary::time::TimeDelayHelper;

1;

