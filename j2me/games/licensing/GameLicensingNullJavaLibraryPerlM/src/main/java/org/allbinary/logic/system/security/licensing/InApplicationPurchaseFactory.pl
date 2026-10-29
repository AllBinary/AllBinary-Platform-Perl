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

package org::allbinary::logic::system::security::licensing::InApplicationPurchaseFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::system::security::licensing::InApplicationPurchaseFactory'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::security::licensing::InApplicationPurchaseFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub init {
    my ($self, $anyType, $stateObject) = @_;
}


sub onCreate {
    my ($self, $anyType, $stateObject) = @_;
}


sub onStart {
    my ($self) = @_;
}


sub onResult {
    my ($self, $requestCode, $resultCode, $data) = @_;
}


sub onSaveState {
    my ($self, $anyType) = @_;
}


sub onStop {
    my ($self) = @_;
}


sub onDestroy {
    my ($self) = @_;
}


sub purchase {
    my ($self, $lockableFeature) = @_;
}


sub isPurchased {
    my ($self, $lockableFeature) = @_;
        return 0;
}


sub add {
    my ($self, $lockableFeature) = @_;
}


sub getUserName {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub isEnabled {
    my ($self) = @_;
        return 0;
}

use org::allbinary::logic::string::StringUtil;

1;

