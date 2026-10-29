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

package org::allbinary::logic::system::hardware::HardwareFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::system::hardware::HardwareFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{tsUtil} = 'org::allbinary::TsUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::hardware::HardwareFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $os) = @_;
        try {
            my $operatingSystems = 'org::allbinary::logic::system::os::OperatingSystems'->getInstance();
            if ($self->{tsUtil}->compareTo($os->getName(), $operatingSystems->{ANDROID}) == 0) {
                return 'org::allbinary::logic::system::hardware::android::AndroidHardware'->new();
            } elsif ($self->{tsUtil}->compareTo($os->getName(), $operatingSystems->{HARMONY}) == 0) {
                return 'org::allbinary::logic::system::hardware::android::AndroidHardware'->new();
            }
            die ("No Hardware Imp for: " . $os->getName());
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put("Ignoring Exception Returning NoHardware", $self, $commonStrings->{GET_INSTANCE}, $e);
            return 'org::allbinary::logic::system::hardware::NoHardware'->new();
        }
}

use org::allbinary::TsUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::hardware::android::AndroidHardware;
use org::allbinary::logic::system::os::GenericOperatingSystem;
use org::allbinary::logic::system::os::OperatingSystems;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::system::hardware::NoHardware;

1;

