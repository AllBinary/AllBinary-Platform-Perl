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

package org::allbinary::time::GameTickTimeDelayHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();


sub _init_fields {
    my ($self) = @_;
    $self->{timeDelta} = 0;
    $self->{startTime} = undef;
    $self->{lastStartTime} = undef;
}


sub new {
    my ($class, $startTime) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{startTime} = $startTime;
        $self->{lastStartTime} = 0;
    return $self;
}


sub setStartTime {
    my ($self) = @_;
        $self->{startTime} = int(Time::HiRes::time() * 1000);
        return $self->{startTime};
}


sub loop {
    my ($self) = @_;
        if ($self->{lastStartTime} == (-9223372036854775807 - 1)) {
            $self->{timeDelta} = 0;
        } else {
            $self->{timeDelta} = int(Time::HiRes::time() * 1000) - $self->{lastStartTime};
        }
}


sub getTimeFromStart {
    my ($self) = @_;
        return $self->{startTime} - $self->{lastStartTime};
}

use java::lang::System;

1;

