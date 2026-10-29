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

package org::allbinary::android::input::api3::VirtualKeyboardAPI3;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::android::input::VirtualKeyboard','org::allbinary::input::event::VirtualKeyboardEventListenerInterface';

our $MAX_API = 2147483647;
our $MIN_API = 3;

sub _init_fields {
    my ($self) = @_;
    $self->{virtualKeyboard} = 0;
    $self->{activity} = undef;
    $self->{showVirtualKeyboardRunnable} = undef;
    $self->{hideVirtualKeyboardRunnable} = undef;
}


sub new {
    my ($class, $activity) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        # super(...) made $self above
        $self->{activity} = $activity;
        $self->{showVirtualKeyboardRunnable} = 'org::allbinary::android::input::api3::ShowVirtualKeyboardRunnable'->new($self->{activity});
        $self->{hideVirtualKeyboardRunnable} = 'org::allbinary::android::input::api3::HideVirtualKeyboardRunnable'->new($self->{activity});
        my $virtualKeyboardEventHandler = 'org::allbinary::input::event::VirtualKeyboardEventHandler'->getInstance();
        $virtualKeyboardEventHandler->removeAllListeners();
        $virtualKeyboardEventHandler->addListenerInterface($self);
    return $self;
}


sub onEvent {
    my ($self, $eventObject) = @_;
        'org::allbinary::logic::communication::log::ForcedLogUtil'->log('org::allbinary::logic::util::event::EventStrings'->getInstance()->{PERFORMANCE_MESSAGE}, $self);
}


sub onVirtualKeyboardEvent {
    my ($self, $virtualKeyboardEvent) = @_;
        my $isShow = $virtualKeyboardEvent->getSource();
        if ($isShow) {
            $self->showVirtualKeyboard();
        } else {
            $self->hideVirtualKeyboard();
        }
}


sub forceHide {
    my ($self) = @_;
        $self->hideVirtualKeyboard();
}


sub hide {
    my ($self) = @_;
        if ($self->{virtualKeyboard}) {
            $self->forceHide();
        }
}


sub showVirtualKeyboard {
    my ($self) = @_;
        $self->{activity}->runOnUiThread($self->{showVirtualKeyboardRunnable});
        $self->{virtualKeyboard} = 1;
}


sub hideVirtualKeyboard {
    my ($self) = @_;
        $self->{activity}->runOnUiThread($self->{hideVirtualKeyboardRunnable});
        $self->{virtualKeyboard} = 0;
}

use android::app::Activity;
use org::allbinary::android::input::VirtualKeyboard;
use org::allbinary::input::event::VirtualKeyboardEvent;
use org::allbinary::input::event::VirtualKeyboardEventHandler;
use org::allbinary::input::event::VirtualKeyboardEventListenerInterface;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::logic::util::event::EventStrings;
use org::allbinary::android::input::api3::ShowVirtualKeyboardRunnable;
use org::allbinary::android::input::api3::HideVirtualKeyboardRunnable;

1;

