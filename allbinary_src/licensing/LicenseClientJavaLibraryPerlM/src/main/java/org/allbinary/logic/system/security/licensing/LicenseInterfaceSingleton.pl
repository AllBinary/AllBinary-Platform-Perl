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

package org::allbinary::logic::system::security::licensing::LicenseInterfaceSingleton;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $licenseInterface = 'org::allbinary::logic::system::security::licensing::AbeNoLicense'->getInstance();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::security::licensing::LicenseInterfaceSingleton::licenseInterface;
}


sub init {
    my ($class, $licenseInterface) = @_;
        if (defined($licenseInterface)) {
            $org::allbinary::logic::system::security::licensing::LicenseInterfaceSingleton::licenseInterface = $licenseInterface;
        }
}

use org::allbinary::logic::system::security::licensing::AbeNoLicense;

1;

