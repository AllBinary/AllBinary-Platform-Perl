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

package org::allbinary::animation::IndexedAnimationBehavior;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::AnimationBehavior';


sub _init_fields {
    my ($self) = @_;
    $self->{frameDelayTime} = undef unless exists $self->{frameDelayTime};
    $self->{loopTotal} = undef unless exists $self->{loopTotal};
    $self->{elapsedTime} = 0 unless exists $self->{elapsedTime};
    $self->{loopIndex} = 0 unless exists $self->{loopIndex};
}


sub new {
    my ($class, $loopTotal, $frameDelayTime) = @_;
    my $self = $class->SUPER::new();
    _init_fields($self);
        $self->{loopTotal} = $loopTotal;
        $self->{frameDelayTime} = $frameDelayTime;
    return $self;
}


sub reset {
    my ($self) = @_;
        $self->{loopIndex} = 0;
}

use java::lang::Object ();
use org::allbinary::animation::AnimationBehavior ();

1;

