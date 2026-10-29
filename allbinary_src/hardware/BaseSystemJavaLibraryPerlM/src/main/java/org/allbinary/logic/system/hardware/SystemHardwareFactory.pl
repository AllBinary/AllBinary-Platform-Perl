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

package org::allbinary::logic::system::hardware::SystemHardwareFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::system::hardware::SystemHardwareFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{hardwareInterface} = 'org::allbinary::logic::system::hardware::NoHardware'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::hardware::SystemHardwareFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $operatingSystemInterface) = @_;
        try {
            if ($self->{hardwareInterface} == 'org::allbinary::logic::system::hardware::NoHardware'->getInstance()) {
                $self->{hardwareInterface} = 'org::allbinary::logic::system::hardware::HardwareFactory'->getInstance()->getInstance($operatingSystemInterface);
            }
            $self->{logUtil}->putF("Found Hardware", $self, $self->{commonStrings}->{CONSTRUCTOR});
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{CONSTRUCTOR}, $e);
        }
        return $self->{hardwareInterface};
}


sub static_toString {
    my ($class) = @_;
        my $systemHardwareFactory = 'org::allbinary::logic::system::hardware::SystemHardwareFactory'->getInstance();
        my $osBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $osBuffer->append("Hardware Info: \n");
        if (defined($systemHardwareFactory->{hardwareInterface})) {
            $osBuffer->append($systemHardwareFactory->{hardwareInterface}->toString());
        } else {
            $osBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->{NULL_STRING});
        }
        return $osBuffer->toString();
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::os::GenericOperatingSystem;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::system::hardware::NoHardware;
use org::allbinary::logic::system::hardware::HardwareFactory;

1;

