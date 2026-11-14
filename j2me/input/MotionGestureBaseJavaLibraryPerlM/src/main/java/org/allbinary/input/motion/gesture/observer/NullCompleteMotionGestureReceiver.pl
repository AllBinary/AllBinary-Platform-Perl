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

package org::allbinary::input::motion::gesture::observer::NullCompleteMotionGestureReceiver;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','org::allbinary::input::motion::gesture::observer::CompleteMotionGestureListenerInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        $self->{logUtil}->putF("Null Gesture Reciever", $self, $commonStrings->{CONSTRUCTOR});
    return $self;
}


# throws Exception
sub onMotionGestureCompleted {
    my ($self, $list) = @_;
}

use java::lang::Object ();
use org::allbinary::logic::communication::log::LogUtil ();
use org::allbinary::string::CommonStrings ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::input::motion::gesture::observer::CompleteMotionGestureListenerInterface ();

1;

