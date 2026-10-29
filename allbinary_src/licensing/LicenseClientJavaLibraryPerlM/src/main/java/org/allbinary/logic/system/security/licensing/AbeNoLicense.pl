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

package org::allbinary::logic::system::security::licensing::AbeNoLicense;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::system::security::licensing::AbeLicenseInterface';

our $abeNoLicense = 'org::allbinary::logic::system::security::licensing::AbeNoLicense'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{serverVector} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::security::licensing::AbeNoLicense::abeNoLicense;
}


sub hasKey {
    my ($self) = @_;
        return 0;
}


sub getKey {
    my ($self, $keyName) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub getLicenseId {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub getSpecial {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


sub getServers {
    my ($self) = @_;
        return $self->{serverVector};
}


sub isValid {
    my ($self) = @_;
        return 0;
}


sub getLicenseType {
    my ($self) = @_;
        return 'org::allbinary::logic::system::security::licensing::LicenseTypeFactory'->getInstance()->{UNKNOWN};
}

use org::allbinary::logic::string::StringUtil;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::system::security::licensing::AbeLicenseInterface;
use org::allbinary::logic::system::security::licensing::LicenseTypeFactory;

1;

