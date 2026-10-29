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

package org::allbinary::logic::system::security::AbKeys;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::system::security::AbKeys'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::security::AbKeys::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws LicensingException
sub getKey {
    my ($self, $abeClientInformation, $keyName) = @_;
        try {
            $self->{logUtil}->putF("Getting Key: " . $keyName, $self, "getKey");
            if (($keyName cmp "DirectX 8") == 0 || ($keyName cmp "DirectX") == 0 || ($keyName cmp "Low Level") == 0 || ($keyName cmp "System Drivers") == 0) {
                return "Temp For Input Library";
            }
            return 'org::allbinary::logic::system::security::licensing::AbeLicenseInterfaceFactory'->getInstance()->getLicenseInstance($abeClientInformation)->getKey($keyName);
        } catch ($e) {
            die $e;
        }
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::AbeLicenseInterfaceFactory;
use org::allbinary::logic::system::security::licensing::LicensingException;

1;

