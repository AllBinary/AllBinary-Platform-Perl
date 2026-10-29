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

package org::allbinary::logic::system::security::licensing::client::AbeLicenseClient;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{MINSERVERS} = 3;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub get {
    my ($self, $abeClientInformation) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{GET});
            my $xmlRpcAbeLicenseClient = 'org::allbinary::logic::system::security::licensing::client::XmlRpcAbeLicenseRetrievalClient'->new($abeClientInformation);
            my $abeLicenseInterface = $xmlRpcAbeLicenseClient->get(undef);
            my $licenseId = $abeLicenseInterface->getLicenseId();
            my $servers = $abeLicenseInterface->getServers();
            my $isNewLicenseId = 0;
            my $isBetterServerList = 0;
            my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
            if ($stringValidationUtil->isEmpty($abeClientInformation->getLicenseId()) && !$abeClientInformation->isSameId($licenseId)) {
                $isNewLicenseId = 1;
            }
            if ($servers->size() >= $self->{MINSERVERS} && $abeClientInformation->isLargerOrDifferentServerList($servers)) {
                $isBetterServerList = 1;
            }
            if ($isBetterServerList || $isNewLicenseId) {
                my $initInfo = 'org::allbinary::business::init::LicenseInitInfoUtil'->getInstance()->read();
                $initInfo->setLicenseId($licenseId);
                $initInfo->setServerList($servers);
                'org::allbinary::business::init::LicenseInitInfoUtil'->getInstance()->write($initInfo);
                $abeClientInformation->init();
            }
            $self->{logUtil}->putF($self->{commonStrings}->{END}, $self, $self->{commonStrings}->{GET});
            return $abeLicenseInterface;
        } catch ($e) {
            die $e;
        }
}

use org::allbinary::business::init::LicenseInitInfo;
use org::allbinary::business::init::LicenseInitInfoUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::xmlrpc::XmlRpcAbeClient;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::system::security::licensing::AbeLicenseInterface;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::BasicArrayList;
use org::allbinary::logic::system::security::licensing::client::XmlRpcAbeLicenseRetrievalClient;

1;

