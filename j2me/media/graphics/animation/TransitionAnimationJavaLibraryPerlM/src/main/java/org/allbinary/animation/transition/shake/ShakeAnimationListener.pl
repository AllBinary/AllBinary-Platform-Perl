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

package org::allbinary::animation::transition::shake::ShakeAnimationListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub onSmallShakeEvent {
    my ($self) = @_;
}


sub onMediumShakeEvent {
    my ($self) = @_;
}


sub onLargeShakeEvent {
    my ($self) = @_;
}


sub onShakeEvent {
    my ($self, $shakeEvent) = @_;
}


sub getType {
    my ($self) = @_;
        return 0;
}


1;

