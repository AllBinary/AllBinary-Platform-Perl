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

package org::allbinary::logic::system::security::licensing::AbeLicenseInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::logic::system::security::licensing::AbeLicenseInterfaceFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{time} = 0;
    $self->{check} = 0;
    $self->{checkPeriod} = 36000000;
    $self->{abeLicenseInterface} = undef;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::security::licensing::AbeLicenseInterfaceFactory::SINGLETON;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws LicensingException
sub getLicenseInstance {
    my ($self, $abeClientInformation) = @_;
        if ($self->isTimeToGetKey()) {
            return $self->get($abeClientInformation);
        } else {
            return $self->{abeLicenseInterface};
        }
}


# throws LicensingException
sub get {
    my ($self, $abeClientInformation) = @_;
        try {
            $self->{logUtil}->putF("Getting Keys", $self, $self->{commonStrings}->{GET});
            $self->{abeLicenseInterface} = 'org::allbinary::logic::system::security::licensing::AbeNoLicense'->getInstance();
            my $licenseClient = 'org::allbinary::logic::system::security::licensing::client::AbeLicenseClient'->new();
            $self->{abeLicenseInterface} = $licenseClient->get($abeClientInformation);
            if (defined($self->{abeLicenseInterface})) {
                $self->{logUtil}->putF("Default Key: " . $self->{abeLicenseInterface}->getKey('org::allbinary::logic::system::security::licensing::AbeClientInformationData'->getInstance()->{KEY}), $self, $self->{commonStrings}->{GET});
            }
            return $self->{abeLicenseInterface};
        } catch ($e) {
            $self->{logUtil}->put("Licensing IO Error", $self, $self->{commonStrings}->{GET}, $e);
            die ("License Server Connection Error");
        }
}


sub isTimeToGetKey {
    my ($self) = @_;
        my $calendar = 'java::util::Calendar'->getInstance();
        my $currentTime = $calendar->getTimeInMillis();
        if (!defined($self->{abeLicenseInterface}) || $self->{abeLicenseInterface} == 'org::allbinary::logic::system::security::licensing::AbeNoLicense'->getInstance() || !$self->{abeLicenseInterface}->hasKey() || $self->isCheck() || $currentTime - $self->{checkPeriod} > $self->{time}) {
            $self->{abeLicenseInterface} = undef;
            $self->{time} = $currentTime;
            return 1;
        } else {
            return 0;
        }
}


sub setCheck {
    my ($self, $check) = @_;
        $self->{check} = $check;
}


sub isCheck {
    my ($self) = @_;
        return $self->{check};
}

# use java::io::IOException;
use java::util::Calendar;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::client::AbeLicenseClient;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::system::security::licensing::AbeNoLicense;
use org::allbinary::logic::system::security::licensing::AbeClientInformationData;

1;

