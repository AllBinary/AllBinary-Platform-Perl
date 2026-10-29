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

package org::allbinary::logic::system::hardware::linux::PCComponentFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::system::hardware::linux::PCComponentFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{componentFactory} = 'org::allbinary::logic::system::hardware::components::ComponentFactory'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::hardware::linux::PCComponentFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $component, $componentData) = @_;
        try {
            if (defined($component)) {
                if (($component cmp $self->{componentFactory}->{ETHERNET}->toString()) == 0) {
                    return 'org::allbinary::logic::system::hardware::components::linux::Ethernet'->new($componentData);
                } elsif (($component cmp $self->{componentFactory}->{BRIDGE}->toString()) == 0) {
                    return 'org::allbinary::logic::system::hardware::components::linux::Bridge'->new($componentData);
                } elsif (($component cmp $self->{componentFactory}->{IDE}->toString()) == 0) {
                    return 'org::allbinary::logic::system::hardware::components::linux::HardDriveController'->new($componentData);
                } elsif (($component cmp $self->{componentFactory}->{MULTIMEDIA}->toString()) == 0) {
                    return 'org::allbinary::logic::system::hardware::components::linux::Media'->new($componentData);
                } elsif (($component cmp $self->{componentFactory}->{SCSI}->toString()) == 0) {
                    return 'org::allbinary::logic::system::hardware::components::linux::HardDriveController'->new($componentData);
                } elsif (($component cmp $self->{componentFactory}->{USB}->toString()) == 0) {
                    return 'org::allbinary::logic::system::hardware::components::linux::Usb'->new($componentData);
                } elsif (($component cmp $self->{componentFactory}->{VGA}->toString()) == 0) {
                    return 'org::allbinary::logic::system::hardware::components::linux::Video'->new($componentData);
                } elsif (($component cmp $self->{componentFactory}->{PCI}->toString()) == 0) {
                    return 'org::allbinary::logic::system::hardware::components::linux::PCI'->new($componentData);
                }
            }
            return 'org::allbinary::logic::system::hardware::components::linux::Unknown'->new($componentData);
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            if ($org::allbinary::logic::communication::log::config::type::LogConfigTypes::LOGGING->contains('org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory'->getInstance()->{FACTORYERROR})) {
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{GET_INSTANCE}, $e);
            }
            return 'org::allbinary::logic::system::hardware::components::linux::Unknown'->new($commonStrings->{EXCEPTION});
        }
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
        } elsif (($component cmp $self->{componentFactory}->{PCI}->toString()) == 0) {
            return $self->{componentFactory}->{PCI}->toString();
        }
        return $self->{componentFactory}->{UNKNOWN}->toString();
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::communication::log::config::type::LogConfigTypeFactory;
use org::allbinary::logic::communication::log::config::type::LogConfigTypes;
use org::allbinary::logic::system::hardware::components::ComponentFactory;
use org::allbinary::logic::system::hardware::components::interfaces::HardwareComponentInterface;
use org::allbinary::logic::system::hardware::components::linux::Bridge;
use org::allbinary::logic::system::hardware::components::linux::Ethernet;
use org::allbinary::logic::system::hardware::components::linux::HardDriveController;
use org::allbinary::logic::system::hardware::components::linux::Media;
use org::allbinary::logic::system::hardware::components::linux::PCI;
use org::allbinary::logic::system::hardware::components::linux::Unknown;
use org::allbinary::logic::system::hardware::components::linux::Usb;
use org::allbinary::logic::system::hardware::components::linux::Video;
use org::allbinary::string::CommonStrings;

1;

