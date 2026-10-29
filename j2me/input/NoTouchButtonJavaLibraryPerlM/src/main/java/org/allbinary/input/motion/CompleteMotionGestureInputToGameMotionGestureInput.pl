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

package org::allbinary::input::motion::CompleteMotionGestureInputToGameMotionGestureInput;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::input::motion::CompleteMotionGestureInputToGameMotionGestureInput'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::motion::CompleteMotionGestureInputToGameMotionGestureInput::instance;
}


sub init {
    my ($self) = @_;
        'org::allbinary::logic::communication::log::PreLogUtil'->put("No Touch Button = No Compound Motion Gestures", $self, $self->{commonStrings}->{INIT});
}

use org::allbinary::logic::communication::log::PreLogUtil;
use org::allbinary::string::CommonStrings;

1;

