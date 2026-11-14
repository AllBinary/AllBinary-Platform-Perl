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

package org::allbinary::input::motion::button::ReleaseHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{touchButtonRecognizer} = undef;
}


sub new {
    my ($class, $touchButtonRecognizer) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->{touchButtonRecognizer} = $touchButtonRecognizer;
    return $self;
}


# throws Exception
sub release {
    my ($self, $touchButtonInput, $deviceId) = @_;
        my $nextTouchButtonInput = undef;
        my $gameKeyEvent = undef;
        for (my $index = $self->{touchButtonRecognizer}->{currentlyPressedTouchButtonSingleton}->size() - 1; $index >= 0; $index--) {
            $nextTouchButtonInput = $self->{touchButtonRecognizer}->{currentlyPressedTouchButtonSingleton}->get($index);
            $gameKeyEvent = $nextTouchButtonInput->getGameKeyEvent();
            $self->{touchButtonRecognizer}->{upGameKeyEventHandler}->fireEvent($gameKeyEvent);
            $self->{touchButtonRecognizer}->{upGameKeyEventHandler}->getInstanceForDevice($deviceId)->fireEvent($gameKeyEvent);
            $self->{touchButtonRecognizer}->{currentlyPressedTouchButtonSingleton}->removeAt($index);
        }
}

use java::lang::Object ();
use org::allbinary::game::input::event::GameKeyEvent ();

1;

