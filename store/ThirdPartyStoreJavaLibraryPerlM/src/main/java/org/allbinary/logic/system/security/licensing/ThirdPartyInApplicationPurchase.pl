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

package org::allbinary::logic::system::security::licensing::ThirdPartyInApplicationPurchase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::system::security::licensing::ThirdPartyInApplicationPurchaseInterface';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub isPurchased {
    my ($self, $lockableFeature) = @_;
        return 0;
}


sub onCreate {
    my ($self, $anyType, $stateObject) = @_;
}


sub onDestroy {
    my ($self) = @_;
}


sub onStart {
    my ($self) = @_;
}


sub onActivityResult {
    my ($self, $requestCode, $resultCode, $dataObject) = @_;
}


sub onSaveInstanceState {
    my ($self, $anyType) = @_;
}


sub onStop {
    my ($self) = @_;
}


sub requestPurchase {
    my ($self, $lockableFeature) = @_;
}


sub requestReceipts {
    my ($self) = @_;
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


sub requestProducts {
    my ($self) = @_;
}

use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::security::licensing::ThirdPartyInApplicationPurchaseInterface;

1;

