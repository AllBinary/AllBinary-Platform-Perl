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

package org::allbinary::logic::system::os::OperatingSystemFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::system::os::OperatingSystemFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{genericOperatingSystem} = $org::allbinary::logic::system::os::NoOperatingSystem::NO_OPERATING_SYSTEM;
    $self->{hasDetected} = 0;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::os::OperatingSystemFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getOperatingSystemInstance {
    my ($self) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        try {
            my $systemProperties = 'org::allbinary::logic::system::os::SystemProperties'->getInstance();
            my $osName = $systemProperties->getName();
            if (!$self->{hasDetected}) {
                $self->{hasDetected} = 1;
                if (index($osName, 'org::allbinary::logic::system::os::OperatingSystems'->getInstance()->{ANDROID}) >= 0) {
                    $self->{logUtil}->putF("Found a Android OS", $self, $commonStrings->{GET_INSTANCE});
                    $self->{genericOperatingSystem} = 'org::allbinary::logic::system::os::android::AndroidOperatingSystemFactory'->getInstance()->getOperatingSystemInstance();
                    $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Operating System Info: ")->append($self->{genericOperatingSystem}->toString())->toString(), $self, $commonStrings->{GET_INSTANCE});
                } elsif (index($osName, 'org::allbinary::logic::system::os::OperatingSystems'->getInstance()->{HARMONY}) >= 0) {
                    $self->{logUtil}->putF("Found a Harmony OS", $self, $commonStrings->{GET_INSTANCE});
                    $self->{genericOperatingSystem} = 'org::allbinary::logic::system::os::android::AndroidOperatingSystemFactory'->getInstance()->getOperatingSystemInstance();
                    $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("Operating System Info: ")->append($self->{genericOperatingSystem}->toString())->toString(), $self, $commonStrings->{GET_INSTANCE});
                } else {
                    die ('org::allbinary::logic::string::StringMaker'->new()->append("OS Not Supported: ")->append($osName)->toString());
                }
            }
        } catch ($e) {
            $self->{genericOperatingSystem} = $org::allbinary::logic::system::os::NoOperatingSystem::NO_OPERATING_SYSTEM;
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{GET_INSTANCE}, $e);
        }
        return $self->{genericOperatingSystem};
}

use org::allbinary::logic::system::os::android::AndroidOperatingSystemFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::system::os::NoOperatingSystem;
use org::allbinary::logic::system::os::SystemProperties;
use org::allbinary::logic::system::os::OperatingSystems;

1;

