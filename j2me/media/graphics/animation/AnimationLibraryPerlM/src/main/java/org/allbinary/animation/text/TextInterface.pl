# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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
package org::allbinary::animation::text::TextInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub setTextWithOnMeasure {
    my ($self, $text, $textChangeListener) = @_;
    die "abstract method setTextWithOnMeasure";
}


sub getText {
    my ($self) = @_;
    die "abstract method getText";
}


sub setText {
    my ($self, $text) = @_;
    die "abstract method setText";
}


sub getFontHeight {
    my ($self) = @_;
    die "abstract method getFontHeight";
}


sub getWidth {
    my ($self) = @_;
    die "abstract method getWidth";
}


1;

