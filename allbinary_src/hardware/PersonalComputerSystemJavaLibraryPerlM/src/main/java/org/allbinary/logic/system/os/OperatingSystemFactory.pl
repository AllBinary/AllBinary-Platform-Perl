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
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
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
        try {
            my $operatingSystems = 'org::allbinary::logic::system::os::OperatingSystems'->getInstance();
            my $systemProperties = 'org::allbinary::logic::system::os::SystemProperties'->getInstance();
            my $osName = $systemProperties->getName();
            my $osArch = $systemProperties->getArch();
            my $osVersion = $systemProperties->getVersion();
            if (!$self->{hasDetected}) {
                $self->{logUtil}->putF("osName: " . $osName, $self, $self->{commonStrings}->{GET_INSTANCE});
                $self->{hasDetected} = 1;
                if (index($osName, $operatingSystems->{LINUX}) >= 0) {
                    if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{FACTORYERROR})) {
                        $self->{logUtil}->putF("Found a Linux OS", $self, $self->{commonStrings}->{GET_INSTANCE});
                    }
                    $self->{genericOperatingSystem} = 'org::allbinary::logic::system::os::linux::LinuxOperatingSystemFactory'->getInstance()->getOperatingSystemInstance();
                } elsif (index($osName, $operatingSystems->{WINDOWS}) >= 0) {
                    if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{FACTORYERROR})) {
                        $self->{logUtil}->putF("Found a Windows OS", $self, $self->{commonStrings}->{GET_INSTANCE});
                    }
                    $self->{genericOperatingSystem} = 'org::allbinary::logic::system::os::windows::WindowsOperatingSystemFactory'->getInstance()->getOperatingSystemInstance();
                } elsif (index($osName, $operatingSystems->{SOLARIS}) >= 0) {
                    if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{FACTORYERROR})) {
                        $self->{logUtil}->putF("Found a Solaris OS", $self, $self->{commonStrings}->{GET_INSTANCE});
                    }
                    $self->{genericOperatingSystem} = 'org::allbinary::logic::system::os::solaris::SolarisOperatingSystemFactory'->getInstance()->getOperatingSystemInstance();
                } else {
                    die ('org::allbinary::logic::string::StringMaker'->new()->append("OS Not Supported: ")->append($osName)->toString());
                }
                my $log = 'org::allbinary::logic::communication::log::LogFactory'->getInstanceF('org::allbinary::logic::string::StringMaker'->new()->append("OperatingSystem Info: ")->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($self->{genericOperatingSystem}))->toString(), $self, $self->{commonStrings}->{GET_INSTANCE});
                print($log->toString(), "\n");
                $self->{logUtil}->putL($log);
            }
            return $self->{genericOperatingSystem};
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{FACTORYERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{GET_INSTANCE}, $e);
            }
            return $org::allbinary::logic::system::os::NoOperatingSystem::NO_OPERATING_SYSTEM;
        }
}

use org::allbinary::logic::communication::log::Log;
use org::allbinary::logic::communication::log::LogFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory;
use org::allbinary::logic::communication::log::config::type::LogConfigTypes;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::os::linux::LinuxOperatingSystemFactory;
use org::allbinary::logic::system::os::solaris::SolarisOperatingSystemFactory;
use org::allbinary::logic::system::os::windows::WindowsOperatingSystemFactory;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::system::os::NoOperatingSystem;
use org::allbinary::logic::system::os::OperatingSystems;
use org::allbinary::logic::system::os::SystemProperties;
use java::lang::System;

1;

