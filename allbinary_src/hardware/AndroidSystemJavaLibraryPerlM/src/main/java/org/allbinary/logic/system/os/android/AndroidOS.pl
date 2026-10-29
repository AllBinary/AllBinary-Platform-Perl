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

package org::allbinary::logic::system::os::android::AndroidOS;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::system::os::GenericOperatingSystem';


sub _init_fields {
    my ($self) = @_;
    $self->{stringBuffer} = 'org::allbinary::logic::string::StringMaker'->new();
    $self->{DEVICE_ID} = "DeviceId";
    $self->{DEVICE_SOFTWARE_VERSION} = "DeviceSoftwareVersion";
    $self->{LINE_1_NUMBER} = "Line1Number";
    $self->{OUYA} = "ouya";
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $SDK_VERSION = 'org::allbinary::android::AndroidInfoFactory'->getInstance()->getVersion();
        if ($SDK_VERSION > 10) {
            $self->{scalable} = 1;
        }
        my $properties = 'org::allbinary::logic::system::os::android::AndroidSystemProperties'->getInstance();
        my $commonStrings = 'org::allbinary::string::CommonSeps'->getInstance();
        $self->{stringBuffer}->append($self->{DEVICE_ID});
        $self->{stringBuffer}->append($commonStrings->{EQUALS});
        $self->{stringBuffer}->append($properties->getDeviceId());
        $self->{stringBuffer}->append($commonStrings->{SPACE});
        $self->{stringBuffer}->append($self->{DEVICE_SOFTWARE_VERSION});
        $self->{stringBuffer}->append($commonStrings->{EQUALS});
        $self->{stringBuffer}->append($properties->getDeviceSoftwareVersion());
        $self->{stringBuffer}->append($commonStrings->{SPACE});
        $self->{stringBuffer}->append($self->{LINE_1_NUMBER});
        $self->{stringBuffer}->append($commonStrings->{EQUALS});
        $self->{stringBuffer}->append($properties->getLine1Number());
        $self->{stringBuffer}->append($commonStrings->{SPACE});
        $self->{stringBuffer}->append("NetworkCountryIso");
        $self->{stringBuffer}->append($commonStrings->{EQUALS});
        $self->{stringBuffer}->append($properties->getNetworkCountryIso());
        $self->{stringBuffer}->append($commonStrings->{SPACE});
        $self->{stringBuffer}->append("NetworkOperator");
        $self->{stringBuffer}->append($commonStrings->{EQUALS});
        $self->{stringBuffer}->append($properties->getNetworkOperator());
        $self->{stringBuffer}->append($commonStrings->{SPACE});
        $self->{stringBuffer}->append("NetworkOperatorName");
        $self->{stringBuffer}->append($commonStrings->{EQUALS});
        $self->{stringBuffer}->append($properties->getNetworkOperatorName());
        $self->{stringBuffer}->append($commonStrings->{SPACE});
        $self->{stringBuffer}->append("NetworkType");
        $self->{stringBuffer}->append($commonStrings->{EQUALS});
        $self->{stringBuffer}->appendint(int($properties->getNetworkType()));
        $self->{stringBuffer}->append($commonStrings->{SPACE});
        $self->{stringBuffer}->append("PhoneType");
        $self->{stringBuffer}->append($commonStrings->{EQUALS});
        $self->{stringBuffer}->appendint(int($properties->getPhoneType()));
        $self->{stringBuffer}->append($commonStrings->{SPACE});
        $self->{stringBuffer}->append("SimCountryIso");
        $self->{stringBuffer}->append($commonStrings->{EQUALS});
        $self->{stringBuffer}->append($properties->getSimCountryIso());
        $self->{stringBuffer}->append($commonStrings->{SPACE});
        $self->{stringBuffer}->append("SimOperator");
        $self->{stringBuffer}->append($commonStrings->{EQUALS});
        $self->{stringBuffer}->append($properties->getSimOperator());
        $self->{stringBuffer}->append($commonStrings->{SPACE});
        $self->{stringBuffer}->append("SimOperatorName");
        $self->{stringBuffer}->append($commonStrings->{EQUALS});
        $self->{stringBuffer}->append($properties->getSimOperatorName());
        $self->{stringBuffer}->append($commonStrings->{SPACE});
        $self->{stringBuffer}->append("SimSerialNumber");
        $self->{stringBuffer}->append($commonStrings->{EQUALS});
        $self->{stringBuffer}->append($properties->getSimSerialNumber());
        $self->{stringBuffer}->append($commonStrings->{SPACE});
        $self->{stringBuffer}->append("SubscriberId");
        $self->{stringBuffer}->append($commonStrings->{EQUALS});
        $self->{stringBuffer}->append($properties->getSubscriberId());
        $self->{stringBuffer}->append($commonStrings->{SPACE});
        $self->{stringBuffer}->append("VoiceMailAlphaTag");
        $self->{stringBuffer}->append($commonStrings->{EQUALS});
        $self->{stringBuffer}->append($properties->getVoiceMailAlphaTag());
        $self->{stringBuffer}->append($commonStrings->{SPACE});
        $self->{stringBuffer}->append("VoiceMailNumber");
        $self->{stringBuffer}->append($commonStrings->{EQUALS});
        $self->{stringBuffer}->append($properties->getVoiceMailNumber());
        $self->{stringBuffer}->append($commonStrings->{SPACE});
    return $self;
}


sub isOverScan {
    my ($self) = @_;
        my $properties = 'org::allbinary::logic::system::os::android::AndroidSystemProperties'->getInstance();
        if (index($properties->getDevice()->toLowerCase(), $self->{OUYA}) >= 0) {
            return 1;
        }
        return 0;
}


sub getOverScanXPercent {
    my ($self) = @_;
        return 90;
}


sub getOverScanYPercent {
    my ($self) = @_;
        return 90;
}


sub toString {
    my ($self) = @_;
        my $osBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $osBuffer->append($self->SUPER::toString());
        $osBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
        $osBuffer->append("Other System Info: \n");
        $osBuffer->append($self->{stringBuffer}->toString());
        return $osBuffer->toString();
}

use org::allbinary::android::AndroidInfoFactory;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::os::GenericOperatingSystem;
use org::allbinary::string::CommonSeps;
use org::allbinary::logic::system::os::android::AndroidSystemProperties;

1;

