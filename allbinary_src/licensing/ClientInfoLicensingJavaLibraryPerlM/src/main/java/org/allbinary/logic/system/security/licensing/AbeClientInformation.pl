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

# This is the information sent to the license server
package org::allbinary::logic::system::security::licensing::AbeClientInformation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::system::security::licensing::ClientInformation';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class, $name, $version, $specialName, $shortName) = @_;
    my $self = $class->SUPER::new($name, $version, $specialName, $shortName);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub init {
    my ($self) = @_;
        try {
            $self->setOperatingSystemInterface('org::allbinary::logic::system::os::OperatingSystemFactory'->getInstance()->getOperatingSystemInstance());
            my $licenseInitInfo = 'org::allbinary::business::init::LicenseInitInfoUtil'->getInstance()->read();
            $self->setLicenseId($licenseInitInfo->getLicenseId());
            $self->setLicenseServers($licenseInitInfo->getServerList());
            my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
            if ($stringValidationUtil->isEmpty($self->getLicenseId())) {
                my $NONE = "No License Id";
                $self->setLicenseId($NONE);
            }
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::logic::string::StringMaker'->new()->append("Special Name: ")->append($self->getSpecialName())->toString(), $self, $commonStrings->{CONSTRUCTOR});
        } catch ($e) {
            my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $logUtil->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{CONSTRUCTOR}, $e);
        }
}

use org::allbinary::business::init::LicenseInitInfo;
use org::allbinary::business::init::LicenseInitInfoUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::system::os::OperatingSystemFactory;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::system::security::licensing::ClientInformation;

1;

