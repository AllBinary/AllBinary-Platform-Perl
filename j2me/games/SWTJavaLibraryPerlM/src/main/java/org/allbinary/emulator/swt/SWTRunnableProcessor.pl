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

package org::allbinary::emulator::swt::SWTRunnableProcessor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::emulator::swt::SWTProcessor';

tie our $instanceR, 'java::lang::LazyStatic', sub { 'org::allbinary::emulator::swt::SWTRunnableProcessor'->new() };


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::emulator::swt::SWTRunnableProcessor::instanceR;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub process {
    my ($self, $display) = @_;
        $self->{runnable}->run();
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::eclipse::swt::widgets::Display ();
use org::allbinary::emulator::swt::SWTProcessor ();

1;

