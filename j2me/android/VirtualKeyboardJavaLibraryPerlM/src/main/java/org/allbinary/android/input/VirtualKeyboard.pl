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

package org::allbinary::android::input::VirtualKeyboard;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NULL_VIRTUAL_KEYBOARD = 'org::allbinary::android::input::VirtualKeyboard'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


sub onVirtualKeyboardEvent {
    my ($self, $virtualKeyboardEvent) = @_;
}


sub forceHide {
    my ($self) = @_;
}


sub hide {
    my ($self) = @_;
}

use org::allbinary::input::event::VirtualKeyboardEvent;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;

1;

