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

package org::allbinary::android::input::api1::VirtualKeyboardAPI1;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::android::input::VirtualKeyboard','org::allbinary::input::event::VirtualKeyboardEventListenerInterface';

our $MIN_API = 1;
our $MAX_API = 2;


sub new {
    my ($class, $activity) = @_;
    my $self = $class->SUPER::new();
    return $self;
}

use org::allbinary::android::input::VirtualKeyboard;
use org::allbinary::input::event::VirtualKeyboardEventListenerInterface;
use android::app::Activity;

1;

