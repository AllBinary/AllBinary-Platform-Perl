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

package org::allbinary::logic::system::hardware::linux::LinuxHardware;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::system::hardware::HardwareInterface';

our $PCIFILE = "/proc/pci";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
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
    $self->{NAME} = "Linux Hardware Profile";
    $self->{MINHARDWARE} = 5;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    die "No constructor of LinuxHardware takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $path) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->init($path);
    return $self;
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->init($PCIFILE);
        if ($self->{componentInterfaceVector}->size() < $self->{MINHARDWARE}) {
            die ("Not Enough Data For A Valid License On Linux");
        }
        my $cpu = 'org::allbinary::logic::system::hardware::components::linux::Cpu'->new();
        if (defined($cpu)) {
            $self->{cpuInterfaceVector}->add($cpu);
            $self->{componentInterfaceVector}->add($cpu);
        }
        if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{OS})) {
            $self->{logUtil}->putF("Hardware Data: " . $self->toString(), $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


# throws Exception
sub init {
    my ($self, $filePath) = @_;
        my $lineNumberReader = undef;
        try {
            $self->init($lineNumberReader, $filePath);
        } catch ($e) {
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{OS})) {
                $self->{logUtil}->put("Hardware Data: " . $self->toString(), $self, $self->{commonStrings}->{CONSTRUCTOR}, $e);
            }
            die $e;
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub init {
    my ($self, $lineNumberReader, $filePath) = @_;
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
            my $pciFile = 'java::io::FileReader'->new($filePath);
            $lineNumberReader = 'java::io::LineNumberReader'->new($pciFile);
            if (!defined($lineNumberReader)) {
                my $fileVector = 'org::allbinary::logic::io::file::directory::SubDirectory'->getInstance()->search($filePath, 'org::allbinary::logic::io::file::AbFile'->createAbFile('org::allbinary::logic::io::file::FilePathData'->getInstance()->{PATH_START}));
                if (!$fileVector->isEmpty()) {
                    my $file = $fileVector->get(0);
                    $lineNumberReader = 'java::io::LineNumberReader'->new('java::io::FileReader'->new($file->getPath()));
                }
                if (!defined($lineNumberReader)) {
                    die ("No Linux File Data");
                }
            }
            if (defined($lineNumberReader)) {
                if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{OS})) {
                    $self->{logUtil}->putF("PCI File Found", $self, $self->{commonStrings}->{CONSTRUCTOR});
                }
                my $nextLine = $lineNumberReader->readLine();
                while (defined($lineNumberReader) && defined($nextLine)) {
                    if ($self->isNextHardware($nextLine)) {
                        last;
                    }
                    $nextLine = $lineNumberReader->readLine();
                }
                while ($self->isNextHardware($nextLine)) {
                    my $componentData = 'org::allbinary::logic::string::StringMaker'->new();
                    if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{OS})) {
                        $self->{logUtil}->putF("Found Hardware Device: " . $self->{componentInterfaceVector}->size(), $self, $self->{commonStrings}->{CONSTRUCTOR});
                    }
                    $componentData->append($nextLine);
                    $componentData->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
                    $nextLine = $lineNumberReader->readLine();
                    my $componentType = 'org::allbinary::logic::system::hardware::linux::PCComponentFactory'->getInstance()->getComponentType($nextLine);
                    while (defined($lineNumberReader)) {
                        $componentData->append($nextLine);
                        $componentData->append('org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
                        $nextLine = $lineNumberReader->readLine();
                        if (!defined($nextLine) || $self->isNextHardware($nextLine)) {
                            last;
                        }
                    }
                    my $componentInterface = 'org::allbinary::logic::system::hardware::linux::PCComponentFactory'->getInstance()->getInstance($componentType, $componentData->toString());
                    if (defined($componentInterface)) {
                        $self->{componentInterfaceVector}->add($componentInterface);
                    }
                }
            } else {
                if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{OS})) {
                    $self->{logUtil}->putF("Could not load PCI File", $self, $self->{commonStrings}->{CONSTRUCTOR});
                }
            }
            $lineNumberReader->close();
        } catch ($exception) { die $exception; } finally {
            if (defined($lineNumberReader)) {
                $lineNumberReader->close();
            }
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
            $hardwareBuffer->append("Component ");
            $hardwareBuffer->appendint($index);
            $hardwareBuffer->append(": \n");
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


sub isNextHardware {
    my ($self, $nextLine) = @_;
        if (defined($nextLine)) {
            my $index = index($nextLine, "Bus");
            if ($index >= 0 && $index < 4) {
                return 1;
            }
        }
        return 0;
}

# use java::io::FileReader;
# use java::io::LineNumberReader;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory;
use org::allbinary::logic::communication::log::config::type::LogConfigTypes;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::FilePathData;
use org::allbinary::logic::io::file::directory::SubDirectory;
use org::allbinary::logic::string::StringMaker;
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
use org::allbinary::logic::system::hardware::components::linux::Cpu;
use org::allbinary::string::CommonSeps;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::logic::system::hardware::linux::PCComponentFactory;

1;

