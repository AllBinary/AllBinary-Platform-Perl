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
package org::allbinary::business::advertisement::campaign::AdvertisementCampaignsInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub add {
    my ($self, $advertisementInterface) = @_;
    die "abstract method add";
}


sub get {
    my ($self, $index) = @_;
    die "abstract method get";
}


sub size {
    my ($self) = @_;
    die "abstract method size";
}


sub isEnabled {
    my ($self) = @_;
    die "abstract method isEnabled";
}

use org::allbinary::business::advertisement::AdvertisementInterface;

1;

