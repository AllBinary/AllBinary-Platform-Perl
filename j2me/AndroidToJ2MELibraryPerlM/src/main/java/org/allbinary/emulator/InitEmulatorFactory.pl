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

package org::allbinary::emulator::InitEmulatorFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::emulator::InitEmulatorFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{initEmulator} = 0;
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::emulator::InitEmulatorFactory::instance;
}


sub setInitEmulator {
    my ($self, $initEmulator) = @_;
        $self->{initEmulator} = $initEmulator;
}


sub isInitEmulator {
    my ($self) = @_;
        return $self->{initEmulator};
}


1;

