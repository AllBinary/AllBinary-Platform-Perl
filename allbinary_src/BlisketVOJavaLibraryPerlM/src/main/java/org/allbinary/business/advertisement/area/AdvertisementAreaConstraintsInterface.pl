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
package org::allbinary::business::advertisement::area::AdvertisementAreaConstraintsInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getDisplayInBrowserContraints {
    my ($self) = @_;
    die "abstract method getDisplayInBrowserContraints";
}


sub getTwoDimensionContraints {
    my ($self) = @_;
    die "abstract method getTwoDimensionContraints";
}

use org::allbinary::logic::control::contraints::display::browser::DisplayInBrowserContraintsInterface;
use org::allbinary::logic::control::contraints::size::TwoDimensionalConstraintInterface;

1;

