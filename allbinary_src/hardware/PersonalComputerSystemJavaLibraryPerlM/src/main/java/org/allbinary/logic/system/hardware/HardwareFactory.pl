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


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::hardware::HardwareFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($class, $os) = @_;
        try {
            my $operatingSystems = 'org::allbinary::logic::system::os::OperatingSystems'->getInstance();
            if ($os->getName()->compareTo($operatingSystems->{LINUX}) == 0) {
                return 'org::allbinary::logic::system::hardware::linux::LinuxHardware'->new();
            } elsif ($os->getName()->indexOf($operatingSystems->{WINDOWS}) >= 0) {
                return 'org::allbinary::logic::system::hardware::windows::WindowsHardware'->new();
            }
            die ("No Hardware Imp for: " . $os->getName());
        } catch ($e) {
            die $e;
        }
}

use org::allbinary::logic::system::os::GenericOperatingSystem;
use org::allbinary::logic::system::os::OperatingSystems;
use org::allbinary::logic::system::hardware::linux::LinuxHardware;
use org::allbinary::logic::system::hardware::windows::WindowsHardware;

1;

