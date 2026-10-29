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

package org::allbinary::android::activity::NullKeyInputViewComposite;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::android::activity::KeyInputViewCompositeInterface';

our $NULL_KEY_INPUT_VIEW_COMPOSITE = 'org::allbinary::android::activity::NullKeyInputViewComposite'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub setKeyInputView {
    my ($self, $keyInputView) = @_;
}


sub getRootView {
    my ($self) = @_;
        die ("RuntimeException");
}


sub getView {
    my ($self) = @_;
        die ("RuntimeException");
}


sub runOnUiThread {
    my ($self, $action) = @_;
}

use android::view::View;
use org::allbinary::android::activity::KeyInputViewCompositeInterface;

1;

