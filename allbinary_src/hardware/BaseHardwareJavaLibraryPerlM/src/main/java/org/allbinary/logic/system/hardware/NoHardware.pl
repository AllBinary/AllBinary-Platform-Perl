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

package org::allbinary::logic::system::hardware::NoHardware;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::system::hardware::HardwareInterface';

our $instance = 'org::allbinary::logic::system::hardware::NoHardware'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::hardware::NoHardware::instance;
}


sub getComponent {
    my ($self, $index) = @_;
        return 'org::allbinary::logic::system::hardware::components::interfaces::NoHardwareComponent'->getInstance();
}


sub toString {
    my ($self) = @_;
        return "No Hardware";
}


sub compareTo {
    my ($self, $hardwareInterface) = @_;
        return 1;
}


sub difference {
    my ($self, $hardwareInterface) = @_;
        return 'org::allbinary::logic::StdUtil'->getInstance()->{NULL_TABLE};
}

use org::allbinary::logic::StdUtil;
use org::allbinary::logic::system::hardware::components::interfaces::HardwareComponentInterface;
use org::allbinary::logic::system::hardware::components::interfaces::NoHardwareComponent;
use org::allbinary::util::ABHashtable;
use org::allbinary::logic::system::hardware::HardwareInterface;

1;

