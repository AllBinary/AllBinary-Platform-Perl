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
package org::allbinary::input::automation::actions::script::condition::ColorAtActionScriptConditionInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getPoint {
    my ($self) = @_;
    die "abstract method getPoint";
}


sub setPoint {
    my ($self, $point) = @_;
    die "abstract method setPoint";
}


sub getColorRangeInterface {
    my ($self) = @_;
    die "abstract method getColorRangeInterface";
}


sub setColorRangeInterface {
    my ($self, $colorRangeInterface) = @_;
    die "abstract method setColorRangeInterface";
}


sub log {
    my ($self) = @_;
    die "abstract method log";
}

# use java::awt;
use org::allbinary::media::image::analysis::ColorRangeInterface;

1;

