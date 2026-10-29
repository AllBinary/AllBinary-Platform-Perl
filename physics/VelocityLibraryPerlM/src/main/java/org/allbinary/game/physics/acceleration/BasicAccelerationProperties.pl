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

package org::allbinary::game::physics::acceleration::BasicAccelerationProperties;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{forward} = 0;
    $self->{reverse} = 0;
}


sub new {
    my ($class, $forward, $reverse) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setForward($forward);
        $self->setReverse($reverse);
    return $self;
}


sub setReverse {
    my ($self, $reverse) = @_;
        $self->{reverse} = $reverse;
}


sub getReverse {
    my ($self) = @_;
        return $self->{reverse};
}


sub setForward {
    my ($self, $forward) = @_;
        $self->{forward} = $forward;
}


sub getForward {
    my ($self) = @_;
        return $self->{forward};
}


1;

