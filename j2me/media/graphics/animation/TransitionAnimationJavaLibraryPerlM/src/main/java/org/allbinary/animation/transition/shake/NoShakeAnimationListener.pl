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

package org::allbinary::animation::transition::shake::NoShakeAnimationListener;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::transition::shake::ShakeAnimationListener';

our $NO_SHAKE_ANIMATION_LISTENER = 'org::allbinary::animation::transition::shake::NoShakeAnimationListener'->new();

sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}

use org::allbinary::animation::transition::shake::ShakeAnimationListener;

1;

