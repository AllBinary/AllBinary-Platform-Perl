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

package org::allbinary::logic::system::hardware::components::ComponentFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::logic::system::hardware::components::ComponentFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{VGA} = 'org::allbinary::logic::system::hardware::components::Component'->new("VGA");
    $self->{IDE} = 'org::allbinary::logic::system::hardware::components::Component'->new("IDE");
    $self->{SCSI} = 'org::allbinary::logic::system::hardware::components::Component'->new("SCSI");
    $self->{BRIDGE} = 'org::allbinary::logic::system::hardware::components::Component'->new("bridge");
    $self->{ETHERNET} = 'org::allbinary::logic::system::hardware::components::Component'->new("Ethernet");
    $self->{USB} = 'org::allbinary::logic::system::hardware::components::Component'->new("USB");
    $self->{MULTIMEDIA} = 'org::allbinary::logic::system::hardware::components::Component'->new("Multimedia");
    $self->{PCI} = 'org::allbinary::logic::system::hardware::components::Component'->new("PCI");
    $self->{RAID} = 'org::allbinary::logic::system::hardware::components::Component'->new("RAID");
    $self->{SMBUS} = 'org::allbinary::logic::system::hardware::components::Component'->new("SMBus");
    $self->{PIC} = 'org::allbinary::logic::system::hardware::components::Component'->new("PIC");
    $self->{Class} = 'org::allbinary::logic::system::hardware::components::Component'->new("Class");
    $self->{UNKNOWN} = 'org::allbinary::logic::system::hardware::components::Component'->new('org::allbinary::string::CommonStrings'->getInstance()->{UNKNOWN});
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::logic::system::hardware::components::ComponentFactory::instance;
}

use org::allbinary::string::CommonStrings;
use org::allbinary::logic::system::hardware::components::Component;

1;

