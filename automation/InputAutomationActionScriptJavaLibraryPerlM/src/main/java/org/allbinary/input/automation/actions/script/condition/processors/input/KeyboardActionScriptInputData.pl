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

package org::allbinary::input::automation::actions::script::condition::processors::input::KeyboardActionScriptInputData;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $NAME = "KEY_ACTION_INPUT_NAME";
our $KEY = "KEY_ACTION_INPUT_KEY";
our $DELAY_BETWEEN_KEYS = "KEY_ACTION_INPUT_DELAY_BETWEEN_KEYS";
our $PRESS = "KEY_ACTION_INPUT_PRESS";
our $RELEASE = "KEY_ACTION_INPUT_RELEASE";


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


1;

