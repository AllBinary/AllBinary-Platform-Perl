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

package org::allbinary::graphics::displayable::GameTickDisplayInfoSingleton;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::graphics::displayable::GameTickDisplayInfoSingleton'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{displayInfoSingleton} = 'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance();
    $self->{lastWidth} = $self->{displayInfoSingleton}->getLastWidth();
    $self->{lastHeight} = $self->{displayInfoSingleton}->getLastHeight();
    $self->{lastHalfWidth} = $self->{displayInfoSingleton}->getLastHalfWidth();
    $self->{lastHalfHeight} = $self->{displayInfoSingleton}->getLastHalfHeight();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::graphics::displayable::GameTickDisplayInfoSingleton::instance;
}


sub update {
    my ($self) = @_;
        $self->{lastWidth} = $self->{displayInfoSingleton}->getLastWidth();
        $self->{lastHeight} = $self->{displayInfoSingleton}->getLastHeight();
        $self->{lastHalfWidth} = $self->{displayInfoSingleton}->getLastHalfWidth();
        $self->{lastHalfHeight} = $self->{displayInfoSingleton}->getLastHalfHeight();
}


sub getLastWidth {
    my ($self) = @_;
        return $self->{lastWidth};
}


sub getLastHeight {
    my ($self) = @_;
        return $self->{lastHeight};
}


sub getLastHalfWidth {
    my ($self) = @_;
        return $self->{lastHalfWidth};
}


sub getLastHalfHeight {
    my ($self) = @_;
        return $self->{lastHalfHeight};
}

use org::allbinary::graphics::displayable::DisplayInfoSingleton;

1;

