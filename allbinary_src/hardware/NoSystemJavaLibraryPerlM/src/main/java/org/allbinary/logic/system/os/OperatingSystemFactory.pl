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
            my $osString = 'org::allbinary::logic::string::StringMaker'->new()->append("OperatingSystem Info: ")->append($self->{genericOperatingSystem}->toString())->toString();
            print($osString, "\n");
            $self->{logUtil}->putF($osString, $self, $commonStrings->{GET_INSTANCE});
        } catch ($e) {
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{GET_INSTANCE}, $e);
        }
        return $self->{genericOperatingSystem};
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::string::CommonStrings;
use org::allbinary::logic::system::os::NoOperatingSystem;
use java::lang::System;

1;

