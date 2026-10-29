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

package org::allbinary::android::input::VirtualKeyboardFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $virtualKeyboard = $org::allbinary::android::input::VirtualKeyboard::NULL_VIRTUAL_KEYBOARD;

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub init {
    my ($class, $activity) = @_;
        my $SDK_VERSION = 'org::allbinary::android::AndroidInfoFactory'->getInstance()->getVersion();
        if ($SDK_VERSION <= 2) {
            $org::allbinary::android::input::VirtualKeyboardFactory::virtualKeyboard = 'org::allbinary::android::input::api1::VirtualKeyboardAPI1'->new($activity);
        } else {
            $org::allbinary::android::input::VirtualKeyboardFactory::virtualKeyboard = 'org::allbinary::android::input::api3::VirtualKeyboardAPI3'->new($activity);
        }
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::android::input::VirtualKeyboardFactory::virtualKeyboard;
}

use org::allbinary::android::AndroidInfoFactory;
use org::allbinary::android::input::api1::VirtualKeyboardAPI1;
use org::allbinary::android::input::api3::VirtualKeyboardAPI3;
use android::app::Activity;
use org::allbinary::android::input::VirtualKeyboard;

1;

