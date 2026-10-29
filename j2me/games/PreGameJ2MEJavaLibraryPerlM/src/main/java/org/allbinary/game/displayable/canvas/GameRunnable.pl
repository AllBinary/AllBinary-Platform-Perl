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

package org::allbinary::game::displayable::canvas::GameRunnable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Time::HiRes ();


sub _init_fields {
    my ($self) = @_;
    $self->{WAIT} = 240;
    $self->{FAST} = 60;
    $self->{waitInMillis} = $self->{WAIT};
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub run {
    my ($self) = @_;
        'org::allbinary::graphics::displayable::DisplayInfoSingleton'->getInstance()->process();
}


# throws Exception
sub processLoopSleep {
    my ($self) = @_;
        Time::HiRes::sleep(($self->{waitInMillis}) / 1000);
}

use org::allbinary::graphics::displayable::DisplayInfoSingleton;
use java::lang::Thread;

1;

