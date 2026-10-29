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

package org::allbinary::logic::system::os::android::AndroidOperatingSystemFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::system::os::android::AndroidOperatingSystemFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{tsUtil} = 'org::allbinary::TsUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::os::android::AndroidOperatingSystemFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub getOperatingSystemInstance {
    my ($self) = @_;
        try {
            my $GenericOperatingSystem = undef;
            my $systemProperties = 'org::allbinary::logic::system::os::SystemProperties'->getInstance();
            my $osName = $systemProperties->getName();
            if ($self->{tsUtil}->compareTo($osName, 'org::allbinary::logic::system::os::OperatingSystems'->getInstance()->{ANDROID}) == 0) {
                $GenericOperatingSystem = 'org::allbinary::logic::system::os::android::AndroidOS'->new();
            } else {
                if ('org::allbinary::logic::system::os::OperatingSystems'->getInstance()->isUnknownSpecificOSAllowed()) {
                    $GenericOperatingSystem = 'org::allbinary::logic::system::os::android::AndroidOS'->new();
                } else {
                    die ("Specific Android OS Not Supported: " . $osName);
                }
            }
            return $GenericOperatingSystem;
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put("Failed to get OperatingSystem returning NoOperatingSystem", $self, $commonStrings->{GET_INSTANCE}, $e);
            return $org::allbinary::logic::system::os::NoOperatingSystem::NO_OPERATING_SYSTEM;
        }
}

use org::allbinary::TsUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::os::GenericOperatingSystem;
use org::allbinary::logic::system::os::NoOperatingSystem;
use org::allbinary::logic::system::os::OperatingSystems;
use org::allbinary::logic::system::os::SystemProperties;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::system::os::android::AndroidOS;

1;

