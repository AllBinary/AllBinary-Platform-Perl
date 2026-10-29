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

package org::allbinary::game::GameAdState;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::advertisement::GameAdStateBase','org::allbinary::input::event::VirtualKeyboardEventListenerInterface';



sub new {
    my ($class, $adConfiguration) = @_;
    my $self = $class->SUPER::new($adConfiguration);
        # super(...) made $self above
        'org::allbinary::input::event::VirtualKeyboardEventHandler'->getInstance()->addListenerInterface($self);
    return $self;
}


# throws Exception
sub onVirtualKeyboardEvent {
    my ($self, $virtualKeyboardEvent) = @_;
}

use org::allbinary::business::advertisement::GameAdStateBase;
use org::allbinary::business::advertisement::AdConfiguration;
use org::allbinary::input::event::VirtualKeyboardEvent;
use org::allbinary::input::event::VirtualKeyboardEventHandler;
use org::allbinary::input::event::VirtualKeyboardEventListenerInterface;

1;

