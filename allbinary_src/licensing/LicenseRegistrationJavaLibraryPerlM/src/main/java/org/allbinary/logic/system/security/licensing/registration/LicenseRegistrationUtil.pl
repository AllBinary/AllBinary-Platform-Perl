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

package org::allbinary::logic::system::security::licensing::registration::LicenseRegistrationUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub process {
    my ($class, $abeClientInformation, $registrationId) = @_;
        try {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            'org::allbinary::logic::communication::log::PreLogUtil'->put('org::allbinary::string::CommonLabels'->getInstance()->{START_LABEL} . "License Registration", "LicenseRegistrationUtil", $commonStrings->{PROCESS});
            my $registrationConfiguration = 'org::allbinary::logic::system::security::licensing::registration::RegistrationConfiguration'->getInstance();
            $registrationConfiguration->setRegistrationCode($registrationId);
            $registrationConfiguration->write();
            my $hashtable = $abeClientInformation->toHashtable();
            $hashtable->put('org::allbinary::logic::system::security::licensing::registration::RegistrationConfiguration'->getInstance()->{NAME}, $registrationId);
            $hashtable->put("message", 'org::allbinary::canvas::SpecialMessageUtil'->getInstance()->get());
            'org::allbinary::logic::system::security::licensing::registration::XmlRpcRemoteLicenseRegistrationClient'->new($abeClientInformation)->get($hashtable);
        } catch ($e) {
            'org::allbinary::logic::communication::log::PreLogUtil'->putOE("License Registration Exception", "LicenseRegistrationUtil", "License Registration", $e);
        }
}

use org::allbinary::string::CommonStrings;
use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::canvas::SpecialMessageUtil;
use org::allbinary::string::CommonLabels;
use org::allbinary::util::ABHashtable;
use org::allbinary::logic::system::security::licensing::registration::RegistrationConfiguration;
use org::allbinary::logic::system::security::licensing::registration::XmlRpcRemoteLicenseRegistrationClient;

1;

