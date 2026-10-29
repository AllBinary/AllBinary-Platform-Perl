# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::emulator::swt::SWTProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();

our $instance = 'org::allbinary::emulator::swt::SWTProcessor'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{runnable} = 'org::allbinary::thread::NullRunnable'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::emulator::swt::SWTProcessor::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub process {
    my ($self, $display) = @_;
        $display->sleep();
}

use org::allbinary::thread::NullRunnable;
use org::eclipse::swt::widgets::Display;

1;

