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
package org::allbinary::game::configuration::feature::GameFeatureControlledInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



# throws Exception
sub init {
    my ($self, $level) = @_;
    die "abstract method init";
}


sub isFeature {
    my ($self) = @_;
    die "abstract method isFeature";
}


sub isLoadingLevel {
    my ($self, $level) = @_;
    die "abstract method isLoadingLevel";
}


1;

