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
package org::allbinary::media::audio::SoundsFactoryInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub init {
    my ($self) = @_;
    die "abstract method init";
}


# throws Exception
sub getSoundInterfaceArray {
    my ($self) = @_;
    die "abstract method getSoundInterfaceArray";
}


sub setInitialized {
    my ($self, $initialized) = @_;
    die "abstract method setInitialized";
}


sub isInitialized {
    my ($self) = @_;
    die "abstract method isInitialized";
}


1;

