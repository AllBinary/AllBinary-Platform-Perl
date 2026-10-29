# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::logic::system::hardware::components::interfaces::NoHardwareComponent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::system::hardware::components::interfaces::HardwareComponentInterface';

our $instance = 'org::allbinary::logic::system::hardware::components::interfaces::NoHardwareComponent'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::hardware::components::interfaces::NoHardwareComponent::instance;
}


sub compareTo {
    my ($self, $componentInterface) = @_;
        if ($self == $componentInterface) {
            return 1;
        }
        return 0;
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{NULL_STRING};
}

use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::hardware::components::interfaces::HardwareComponentInterface;

1;

