# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::android::activity::MidletActivityBase;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'android::app::Activity','org::allbinary::game::configuration::event::GameFeatureListenerInterface','org::allbinary::game::configuration::event::GameInitializedListenerInterface','org::allbinary::android::activity::SimpleProgressActivityInterface','org::allbinary::android::activity::KeyInputViewCompositeInterface','org::allbinary::android::GenericMotionEventVerifyInterface';


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


sub onGameFeatureChange {
    my ($self, $gameFeatureEvent) = @_;
}


sub onEvent {
    my ($self, $eventObject) = @_;
}


sub onGameInitialized {
    my ($self, $gameInitializedEvent) = @_;
}


# throws Exception
sub onSetProgress {
    my ($self, $value, $text) = @_;
}


# throws Exception
sub onDismissProgress {
    my ($self, $animationSequence) = @_;
}


# throws Exception
sub onShowProgress {
    my ($self, $indeterminate, $animationSequence) = @_;
}


sub getRootView {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getView {
    my ($self) = @_;
        die ("RuntimeException");
}


sub setKeyInputView {
    my ($self, $keyInputView) = @_;
}


sub onGenericMotionEvent {
    my ($self, $event) = @_;
        die ("RuntimeException");
}

use android::app::Activity;
use android::view::MotionEvent;
use android::view::View;
use org::allbinary::android::GenericMotionEventVerifyInterface;
use org::allbinary::game::configuration::event::GameFeatureEvent;
use org::allbinary::game::configuration::event::GameFeatureListenerInterface;
use org::allbinary::game::configuration::event::GameInitializedEvent;
use org::allbinary::game::configuration::event::GameInitializedListenerInterface;
use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::android::activity::SimpleProgressActivityInterface;
use org::allbinary::android::activity::KeyInputViewCompositeInterface;

1;

