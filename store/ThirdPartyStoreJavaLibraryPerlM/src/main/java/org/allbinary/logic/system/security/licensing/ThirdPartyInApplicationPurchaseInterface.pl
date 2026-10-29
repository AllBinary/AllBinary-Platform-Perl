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
package org::allbinary::logic::system::security::licensing::ThirdPartyInApplicationPurchaseInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub isPurchased {
    my ($self, $lockableFeature) = @_;
    die "abstract method isPurchased";
}


sub onCreate {
    my ($self, $anyType, $stateObject) = @_;
    die "abstract method onCreate";
}


sub onDestroy {
    my ($self) = @_;
    die "abstract method onDestroy";
}


sub onStart {
    my ($self) = @_;
    die "abstract method onStart";
}


sub onActivityResult {
    my ($self, $requestCode, $resultCode, $dataObject) = @_;
    die "abstract method onActivityResult";
}


sub onSaveInstanceState {
    my ($self, $anyType) = @_;
    die "abstract method onSaveInstanceState";
}


sub onStop {
    my ($self) = @_;
    die "abstract method onStop";
}


sub requestPurchase {
    my ($self, $lockableFeature) = @_;
    die "abstract method requestPurchase";
}


sub requestReceipts {
    my ($self) = @_;
    die "abstract method requestReceipts";
}


sub add {
    my ($self, $lockableFeature) = @_;
    die "abstract method add";
}


sub getUserName {
    my ($self) = @_;
    die "abstract method getUserName";
}


sub isEnabled {
    my ($self) = @_;
    die "abstract method isEnabled";
}


1;

