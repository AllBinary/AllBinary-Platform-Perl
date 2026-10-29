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

package org::allbinary::logic::system::hardware::components::linux::MachineAccessControlAddress;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::system::hardware::components::interfaces::HardwareComponentInterface','org::allbinary::logic::system::hardware::components::interfaces::MachineAccessControlAddressInterface';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub compareTo {
    my ($self, $componentInterface) = @_;
        return 1;
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}

use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::hardware::components::interfaces::HardwareComponentInterface;
use org::allbinary::logic::system::hardware::components::interfaces::MachineAccessControlAddressInterface;

1;

