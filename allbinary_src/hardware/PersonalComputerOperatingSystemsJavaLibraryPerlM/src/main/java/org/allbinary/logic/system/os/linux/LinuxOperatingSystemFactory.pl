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

package org::allbinary::logic::system::os::linux::LinuxOperatingSystemFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::system::os::linux::LinuxOperatingSystemFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::os::linux::LinuxOperatingSystemFactory::instance;
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
            my $osName = 'org::allbinary::logic::system::os::SystemProperties'->getInstance()->getName();
            my $operatingSystemInterface = undef;
            if (($osName cmp $operatingSystems->{LINUX}) == 0) {
                $operatingSystemInterface = 'org::allbinary::logic::system::os::linux::LinuxOS'->new();
            } else {
                if ($operatingSystems->isUnknownSpecificOSAllowed()) {
                    $operatingSystemInterface = 'org::allbinary::logic::system::os::linux::LinuxOS'->new();
                } else {
                    die ("Specific Linux OS Not Supported: " . $osName);
                }
            }
            return $operatingSystemInterface;
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{FACTORYERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{GET_INSTANCE}, $e);
            }
            return $org::allbinary::logic::system::os::NoOperatingSystem::NO_OPERATING_SYSTEM;
        }
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory;
use org::allbinary::logic::communication::log::config::type::LogConfigTypes;
use org::allbinary::logic::system::os::GenericOperatingSystem;
use org::allbinary::logic::system::os::NoOperatingSystem;
use org::allbinary::logic::system::os::OperatingSystems;
use org::allbinary::logic::system::os::SystemProperties;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::system::os::linux::LinuxOS;

1;

