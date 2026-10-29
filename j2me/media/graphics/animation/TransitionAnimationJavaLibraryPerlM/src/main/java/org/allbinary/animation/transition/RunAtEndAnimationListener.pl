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

package org::allbinary::animation::transition::RunAtEndAnimationListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::transition::AnimationListenerInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{runnable} = undef;
}


sub new {
    my ($class, $runnable) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{runnable} = $runnable;
    return $self;
}


sub onPlatformAnimationStart {
    my ($self) = @_;
}


sub onPlatformAnimationEnd {
    my ($self) = @_;
}


sub onPlatformAnimationRepeat {
    my ($self) = @_;
}

use org::allbinary::animation::transition::AnimationListenerInterface;

1;

