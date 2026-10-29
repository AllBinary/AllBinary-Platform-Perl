# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::animation::IndexedAnimationBehaviorFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::AnimationBehaviorFactory';


sub _init_fields {
    my ($self) = @_;
    $self->{frameDelayTime} = undef;
    $self->{loopTotal} = undef;
}


sub new {
    my ($class, $loopTotal, $frameDelayTime) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{loopTotal} = $loopTotal;
        $self->{frameDelayTime} = $frameDelayTime;
    return $self;
}


sub getOrCreateInstance {
    my ($self) = @_;
        return 'org::allbinary::animation::IndexedAnimationBehavior'->new($self->{loopTotal}, $self->{frameDelayTime});
}

use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::animation::IndexedAnimationBehavior;

1;

