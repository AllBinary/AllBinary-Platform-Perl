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

package org::allbinary::business::init::LicenseInitInfoUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::init::LicenseInitInfoUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{INITFILENAME} = "licenseinitdata.dat";
    $self->{ABOUT} = "about";
    $self->{PRIVACY_POLICY} = "privacy_policy";
    $self->{OFFICIAL_ALLBINARY_SERVICES_SERVER} = "https://services.allbinary.com/LicServ/serverssl.php";
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::init::LicenseInitInfoUtil::instance;
}


sub setFilePath {
    my ($self, $filePath) = @_;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub write {
    my ($self, $initData) = @_;
}


# throws Exception
sub read {
    my ($self) = @_;
        return $self->readAgain(0);
}


# throws Exception
sub readAgain {
    my ($self, $initializeCounter) = @_;
        my $licenseInitInfo = 'org::allbinary::business::init::LicenseInitInfo'->new();
        $licenseInitInfo->clearServers();
        $licenseInitInfo->addServer($self->{OFFICIAL_ALLBINARY_SERVICES_SERVER});
        return $licenseInitInfo;
}

use org::allbinary::business::init::LicenseInitInfo;

1;

