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
package org::allbinary::media::image::analysis::ColorRangeInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getMinRed {
    my ($self) = @_;
    die "abstract method getMinRed";
}


sub setMinRed {
    my ($self, $minRed) = @_;
    die "abstract method setMinRed";
}


sub getMaxRed {
    my ($self) = @_;
    die "abstract method getMaxRed";
}


sub setMaxRed {
    my ($self, $maxRed) = @_;
    die "abstract method setMaxRed";
}


sub getMinGreen {
    my ($self) = @_;
    die "abstract method getMinGreen";
}


sub setMinGreen {
    my ($self, $minGreen) = @_;
    die "abstract method setMinGreen";
}


sub getMaxGreen {
    my ($self) = @_;
    die "abstract method getMaxGreen";
}


sub setMaxGreen {
    my ($self, $maxGreen) = @_;
    die "abstract method setMaxGreen";
}


sub getMinBlue {
    my ($self) = @_;
    die "abstract method getMinBlue";
}


sub setMinBlue {
    my ($self, $minBlue) = @_;
    die "abstract method setMinBlue";
}


sub getMaxBlue {
    my ($self) = @_;
    die "abstract method getMaxBlue";
}


sub setMaxBlue {
    my ($self, $maxBlue) = @_;
    die "abstract method setMaxBlue";
}


sub isInRange {
    my ($self, $color) = @_;
    die "abstract method isInRange";
}

# use java::awt;

1;

