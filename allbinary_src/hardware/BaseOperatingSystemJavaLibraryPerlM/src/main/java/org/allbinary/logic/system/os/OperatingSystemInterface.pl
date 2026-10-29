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
package org::allbinary::logic::system::os::OperatingSystemInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getName {
    my ($self) = @_;
    die "abstract method getName";
}


sub getVersion {
    my ($self) = @_;
    die "abstract method getVersion";
}


sub getArch {
    my ($self) = @_;
    die "abstract method getArch";
}


sub getCharacterSet {
    my ($self) = @_;
    die "abstract method getCharacterSet";
}


sub isOverScan {
    my ($self) = @_;
    die "abstract method isOverScan";
}


sub getOverScanXPercent {
    my ($self) = @_;
    die "abstract method getOverScanXPercent";
}


sub getOverScanYPercent {
    my ($self) = @_;
    die "abstract method getOverScanYPercent";
}


sub isScalable {
    my ($self) = @_;
    die "abstract method isScalable";
}


sub isAutoHide {
    my ($self) = @_;
    die "abstract method isAutoHide";
}


sub toString {
    my ($self) = @_;
    die "abstract method toString";
}

use org::allbinary::logic::java::character::CharacterSet;

1;

