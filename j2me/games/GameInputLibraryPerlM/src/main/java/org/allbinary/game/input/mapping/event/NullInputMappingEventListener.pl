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

package org::allbinary::game::input::mapping::event::NullInputMappingEventListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::mapping::event::InputMappingEventListenerInterface';

our $NULL_INPUT_MAPPING_EVENT_LISTENER = 'org::allbinary::game::input::mapping::event::NullInputMappingEventListener'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub onInputMappingEvent {
    my ($self, $inputMappingEvent) = @_;
}


sub onEvent {
    my ($self, $eventObject) = @_;
}

use org::allbinary::logic::util::event::AllBinaryEventObject;
use org::allbinary::game::input::mapping::event::InputMappingEventListenerInterface;

1;

