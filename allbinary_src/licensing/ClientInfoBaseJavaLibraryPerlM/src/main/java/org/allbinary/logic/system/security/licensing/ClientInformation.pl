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
package org::allbinary::logic::system::security::licensing::ClientInformation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::system::security::licensing::AbeClientInformationInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{operatingSystemInterface} = $org::allbinary::logic::system::os::NoOperatingSystem::NO_OPERATING_SYSTEM;
    $self->{tsUtil} = 'org::allbinary::TsUtil'->getInstance();
    $self->{name} = undef;
    $self->{shortName} = undef;
    $self->{version} = undef;
    $self->{specialName} = undef;
    $self->{hardSale} = 1;
    $self->{licenseId} = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
    $self->{licenseServers} = 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance();
}


sub new {
    my ($class, $name, $version, $specialName, $shortName) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $name;
        $self->{version} = $version;
        $self->{specialName} = $specialName;
        $self->{shortName} = 'org::allbinary::logic::string::StringMaker'->new()->append($shortName)->append('org::allbinary::string::CommonSeps'->getInstance()->{UNDERSCORE})->append($version)->toString();
        $self->init();
    return $self;
}


sub init {
    my ($self) = @_;
}


sub getOperatingSystemInterface {
    my ($self) = @_;
        return $self->{operatingSystemInterface};
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub getSpecialName {
    my ($self) = @_;
        return $self->{specialName};
}


sub getVersion {
    my ($self) = @_;
        return $self->{version};
}


sub getLicenseId {
    my ($self) = @_;
        return $self->{licenseId};
}


sub getLicenseServers {
    my ($self) = @_;
        return $self->{licenseServers};
}


sub getLicenseServer {
    my ($self, $index) = @_;
        return $self->{licenseServers}->{objectArray}->[$index];
}


sub getNumberOfLicenseServers {
    my ($self) = @_;
        return $self->{licenseServers}->size();
}


sub toHashtable {
    my ($self) = @_;
        my $abeClientInformationData = 'org::allbinary::logic::system::security::licensing::AbeClientInformationData'->getInstance();
        my $genericOperatingSystem = $self->getOperatingSystemInterface();
        my $clientInfoHashtable = 'org::allbinary::logic::StdUtil'->getInstance()->createHashtable();
        $clientInfoHashtable->put($abeClientInformationData->{NAME}, $self->{name});
        $clientInfoHashtable->put($abeClientInformationData->{VERSION}, $self->{version});
        $clientInfoHashtable->put($abeClientInformationData->{SPECIALNAME}, $self->{specialName});
        $clientInfoHashtable->put($abeClientInformationData->{LICENSEID}, $self->getLicenseId());
        $clientInfoHashtable->put($abeClientInformationData->{OSNAME}, $genericOperatingSystem->getName());
        $clientInfoHashtable->put($abeClientInformationData->{OSARCH}, $genericOperatingSystem->getArch());
        $clientInfoHashtable->put($abeClientInformationData->{OSVERSION}, $genericOperatingSystem->getVersion());
        $clientInfoHashtable->put($abeClientInformationData->{OS}, $genericOperatingSystem->toString());
        my $hardwareInterface = 'org::allbinary::logic::system::hardware::SystemHardwareFactory'->getInstance()->getInstance($genericOperatingSystem);
        my $hardwareString = $hardwareInterface->toString();
        $clientInfoHashtable->put($abeClientInformationData->{HARDWARE}, $hardwareString);
        return $clientInfoHashtable;
}


sub isSameId {
    my ($self, $alicenseId) = @_;
        if ($self->{tsUtil}->compareTo($self->getLicenseId(), $alicenseId) == 0) {
            return 1;
        } else {
            return 0;
        }
}


sub isLargerOrDifferentServerList {
    my ($self, $list) = @_;
        my $size = $list->size() - 1;
        my $currentSize = $self->{licenseServers}->size() - 1;
        if ($size > $currentSize) {
            return 1;
        }
        for (my $index = $size; $index >= 0; $index--) {
            my $newServerName = $list->{objectArray}->[$index];
            for (my $index2 = $currentSize; $index2 >= 0; $index2--) {
                my $nextOldServerName = $self->{licenseServers}->{objectArray}->[$index];
                if ($self->{tsUtil}->compareTo($newServerName, $nextOldServerName) != 0) {
                    return 1;
                }
            }
        }
        return 0;
}


sub setHardSale {
    my ($self, $hardSale) = @_;
        $self->{hardSale} = $hardSale;
}


sub isHardSale {
    my ($self) = @_;
        return $self->{hardSale};
}


sub setOperatingSystemInterface {
    my ($self, $operatingSystemInterface) = @_;
        $self->{operatingSystemInterface} = $operatingSystemInterface;
}


sub setLicenseId {
    my ($self, $licenseId) = @_;
        $self->{licenseId} = $licenseId;
}


sub setLicenseServers {
    my ($self, $licenseServers) = @_;
        $self->{licenseServers} = $licenseServers;
}


sub toShortString {
    my ($self) = @_;
        return $self->{shortName};
}

use org::allbinary::TsUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::hardware::HardwareInterface;
use org::allbinary::logic::system::hardware::SystemHardwareFactory;
use org::allbinary::logic::system::os::GenericOperatingSystem;
use org::allbinary::logic::system::os::NoOperatingSystem;
use org::allbinary::string::CommonSeps;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::logic::StdUtil;
use org::allbinary::util::ABHashtable;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::AbeClientInformationData;

1;

