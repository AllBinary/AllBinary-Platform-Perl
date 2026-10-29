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
package org::allbinary::business::advertisement::area::AdvertisementAreaInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getName {
    my ($self) = @_;
    die "abstract method getName";
}


sub getStoreName {
    my ($self) = @_;
    die "abstract method getStoreName";
}


sub getDescription {
    my ($self) = @_;
    die "abstract method getDescription";
}


sub getConstraints {
    my ($self) = @_;
    die "abstract method getConstraints";
}


sub getCampaign {
    my ($self) = @_;
    die "abstract method getCampaign";
}


sub setName {
    my ($self, $name) = @_;
    die "abstract method setName";
}


sub setStoreName {
    my ($self, $storeName) = @_;
    die "abstract method setStoreName";
}


sub setDescription {
    my ($self, $description) = @_;
    die "abstract method setDescription";
}


sub setConstraints {
    my ($self, $advertisementConstraintsInterface) = @_;
    die "abstract method setConstraints";
}


sub setCampaign {
    my ($self, $campaign) = @_;
    die "abstract method setCampaign";
}


1;

