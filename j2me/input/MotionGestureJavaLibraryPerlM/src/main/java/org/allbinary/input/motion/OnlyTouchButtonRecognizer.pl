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

package org::allbinary::input::motion::OnlyTouchButtonRecognizer;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::motion::MotionRecognizer';


sub _init_fields {
    my ($self) = @_;
    $self->{touchButtonRecognizer} = undef;
    $self->{touchButtonProcessing} = 0;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{touchButtonRecognizer} = 'org::allbinary::input::motion::button::TouchButtonRecognizer'->new();
    return $self;
}


# throws Exception
sub processStartMotionEvent {
    my ($self, $x, $y, $deviceId, $modifiers) = @_;
        if ($self->{touchButtonRecognizer}->pressTouchButtonInput($x, $y, $deviceId)) {
            $self->{touchButtonProcessing} = 1;
        }
}


# throws Exception
sub processEndMotionEvent {
    my ($self, $x, $y, $deviceId, $modifiers) = @_;
        if ($self->{touchButtonProcessing}) {
            $self->{touchButtonProcessing} = 0;
        }
        if ($self->{touchButtonRecognizer}->releaseTouchButtonInput($x, $y, $deviceId)) {
            return;
        }
}


# throws Exception
sub processDraggedMotionEvent {
    my ($self, $x, $y, $deviceId, $modifiers) = @_;
        if ($self->{touchButtonProcessing}) {
            $self->{touchButtonRecognizer}->pressTouchButtonInput($x, $y, $deviceId);
        }
}

use org::allbinary::input::motion::button::TouchButtonRecognizer;
use org::allbinary::input::motion::MotionRecognizer;

1;

