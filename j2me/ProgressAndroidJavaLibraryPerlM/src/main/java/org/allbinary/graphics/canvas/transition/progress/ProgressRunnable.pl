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

package org::allbinary::graphics::canvas::transition::progress::ProgressRunnable;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::thread::ARunnable';


sub _init_fields {
    my ($self) = @_;
    $self->{midletActivity} = undef;
    $self->{progressCanvas} = undef;
}


sub new {
    my ($class, $midletActivity, $progressCanvas) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        my $midletActivity2 = $midletActivity;
        $self->{midletActivity} = $midletActivity2;
        $self->{progressCanvas} = $progressCanvas;
    return $self;
}


sub run {
    my ($self) = @_;
}

use android::app::Activity;
use org::allbinary::android::activity::MidletActivityBase;
use org::allbinary::android::activity::SimpleProgressActivityInterface;
use org::allbinary::thread::ARunnable;

1;

