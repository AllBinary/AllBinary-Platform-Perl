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

package org::allbinary::logic::system::hardware::windows::WindowsHardware;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::system::hardware::HardwareInterface';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getMultimedia {
    my ($self, $index) = @_;
        die ("RuntimeException");
}


sub getBridge {
    my ($self, $index) = @_;
        die ("RuntimeException");
}


sub getCpu {
    my ($self, $index) = @_;
        die ("RuntimeException");
}


sub getEthernet {
    my ($self, $index) = @_;
        die ("RuntimeException");
}


sub getFireWire {
    my ($self, $index) = @_;
        die ("RuntimeException");
}


sub getHardDriveController {
    my ($self, $index) = @_;
        die ("RuntimeException");
}


sub getHardDrive {
    my ($self, $index) = @_;
        die ("RuntimeException");
}


sub getMachineAccessControlAddress {
    my ($self, $index) = @_;
        die ("RuntimeException");
}


sub getMonitor {
    my ($self, $index) = @_;
        die ("RuntimeException");
}


sub getUsb {
    my ($self, $index) = @_;
        die ("RuntimeException");
}


sub getVideo {
    my ($self, $index) = @_;
        die ("RuntimeException");
}


sub getComponent {
    my ($self, $index) = @_;
        die ("RuntimeException");
}


sub toString {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
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
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::system::hardware::HardwareInterface;
use org::allbinary::logic::system::hardware::components::interfaces::BridgeInterface;
use org::allbinary::logic::system::hardware::components::interfaces::CpuInterface;
use org::allbinary::logic::system::hardware::components::interfaces::EthernetInterface;
use org::allbinary::logic::system::hardware::components::interfaces::FireWireInterface;
use org::allbinary::logic::system::hardware::components::interfaces::HardDriveControllerInterface;
use org::allbinary::logic::system::hardware::components::interfaces::HardDriveInterface;
use org::allbinary::logic::system::hardware::components::interfaces::HardwareComponentInterface;
use org::allbinary::logic::system::hardware::components::interfaces::MachineAccessControlAddressInterface;
use org::allbinary::logic::system::hardware::components::interfaces::MediaInterface;
use org::allbinary::logic::system::hardware::components::interfaces::MonitorInterface;
use org::allbinary::logic::system::hardware::components::interfaces::UsbInterface;
use org::allbinary::logic::system::hardware::components::interfaces::VideoInterface;
use org::allbinary::util::ABHashtable;

1;

