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


sub _init_fields {
    my ($self) = @_;
    $self->{componentInterfaceVector} = undef;
    $self->{videoInterfaceVector} = undef;
    $self->{hardDriveControllerInterfaceVector} = undef;
    $self->{cpuInterfaceVector} = undef;
    $self->{usbInterfaceVector} = undef;
    $self->{ethernetInterfaceVector} = undef;
    $self->{multimediaInterfaceVector} = undef;
    $self->{fireWireInterfaceVector} = undef;
    $self->{bridgeInterfaceVector} = undef;
    $self->{hardDriveInterfaceVector} = undef;
    $self->{macInterfaceVector} = undef;
    $self->{monitorInterfaceVector} = undef;
    $self->{NAME} = "Windows Hardware Profile";
    $self->{MINHARDWARE} = 0;
    $self->{componentFactory} = 'org::allbinary::logic::system::hardware::components::ComponentFactory'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        try {
            $self->{componentInterfaceVector} = 'org::allbinary::util::BasicArrayListD'->new();
            $self->{videoInterfaceVector} = 'org::allbinary::util::BasicArrayListD'->new();
            $self->{hardDriveControllerInterfaceVector} = 'org::allbinary::util::BasicArrayListD'->new();
            $self->{cpuInterfaceVector} = 'org::allbinary::util::BasicArrayListD'->new();
            $self->{usbInterfaceVector} = 'org::allbinary::util::BasicArrayListD'->new();
            $self->{ethernetInterfaceVector} = 'org::allbinary::util::BasicArrayListD'->new();
            $self->{multimediaInterfaceVector} = 'org::allbinary::util::BasicArrayListD'->new();
            $self->{fireWireInterfaceVector} = 'org::allbinary::util::BasicArrayListD'->new();
            $self->{bridgeInterfaceVector} = 'org::allbinary::util::BasicArrayListD'->new();
            $self->{hardDriveInterfaceVector} = 'org::allbinary::util::BasicArrayListD'->new();
            $self->{macInterfaceVector} = 'org::allbinary::util::BasicArrayListD'->new();
            $self->{monitorInterfaceVector} = 'org::allbinary::util::BasicArrayListD'->new();
            if ($self->{componentInterfaceVector}->size() < $self->{MINHARDWARE}) {
                die ("Not Enough Data For A Valid License On Windows");
            }
        } catch ($e) {
            die $e;
        }
    return $self;
}


sub getComponentType {
    my ($self, $component) = @_;
        if (index($component, $self->{componentFactory}->{ETHERNET}->toString()) >= 0) {
            return $self->{componentFactory}->{ETHERNET}->toString();
        } elsif (index($component, $self->{componentFactory}->{BRIDGE}->toString()) >= 0) {
            return $self->{componentFactory}->{BRIDGE}->toString();
        } elsif (index($component, $self->{componentFactory}->{IDE}->toString()) >= 0) {
            return $self->{componentFactory}->{IDE}->toString();
        } elsif (index($component, $self->{componentFactory}->{MULTIMEDIA}->toString()) >= 0) {
            return $self->{componentFactory}->{MULTIMEDIA}->toString();
        } elsif (index($component, $self->{componentFactory}->{SCSI}->toString()) >= 0) {
            return $self->{componentFactory}->{SCSI}->toString();
        } elsif (index($component, $self->{componentFactory}->{USB}->toString()) >= 0) {
            return $self->{componentFactory}->{USB}->toString();
        } elsif (index($component, $self->{componentFactory}->{VGA}->toString()) >= 0) {
            return $self->{componentFactory}->{VGA}->toString();
        } else {
            return undef;
        }
}


sub getMultimedia {
    my ($self, $index) = @_;
        return $self->{multimediaInterfaceVector}->get($index);
}


sub getBridge {
    my ($self, $index) = @_;
        return $self->{bridgeInterfaceVector}->get($index);
}


sub getCpu {
    my ($self, $index) = @_;
        return $self->{cpuInterfaceVector}->get($index);
}


sub getEthernet {
    my ($self, $index) = @_;
        return $self->{ethernetInterfaceVector}->get($index);
}


sub getFireWire {
    my ($self, $index) = @_;
        return $self->{fireWireInterfaceVector}->get($index);
}


sub getHardDriveController {
    my ($self, $index) = @_;
        return $self->{hardDriveControllerInterfaceVector}->get($index);
}


sub getHardDrive {
    my ($self, $index) = @_;
        return $self->{hardDriveInterfaceVector}->get($index);
}


sub getMachineAccessControlAddress {
    my ($self, $index) = @_;
        return $self->{macInterfaceVector}->get($index);
}


sub getMonitor {
    my ($self, $index) = @_;
        return $self->{monitorInterfaceVector}->get($index);
}


sub getUsb {
    my ($self, $index) = @_;
        return $self->{usbInterfaceVector}->get($index);
}


sub getVideo {
    my ($self, $index) = @_;
        return $self->{videoInterfaceVector}->get($index);
}


sub getComponent {
    my ($self, $index) = @_;
        return $self->{componentInterfaceVector}->get($index);
}


sub toString {
    my ($self) = @_;
        my $hardwareBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $size = $self->{componentInterfaceVector}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $componentInterface = $self->{componentInterfaceVector}->get($index);
            $hardwareBuffer->append($componentInterface->toString());
            $hardwareBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
        }
        return $hardwareBuffer->toString();
}


sub compareTo {
    my ($self, $hardwareInterface) = @_;
        return 1;
}


sub difference {
    my ($self, $hardwareInterface) = @_;
        return 'org::allbinary::logic::StdUtil'->getInstance()->{NULL_TABLE};
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::hardware::HardwareInterface;
use org::allbinary::logic::system::hardware::components::ComponentFactory;
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
use org::allbinary::string::CommonSeps;
use org::allbinary::util::ABHashtable;

1;

