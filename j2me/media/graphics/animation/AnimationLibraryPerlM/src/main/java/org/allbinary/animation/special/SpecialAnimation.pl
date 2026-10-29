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

package org::allbinary::animation::special::SpecialAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::IndexedAnimation','org::allbinary::animation::special::SpecialAnimationInterface';

our $NULL_SPECIAL_ANIMATION = 'org::allbinary::animation::special::SpecialAnimation'->new('org::allbinary::animation::IndexedAnimationBehavior'->new(1, 250));


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::animation::special::SpecialAnimation::NULL_SPECIAL_ANIMATION;
}


sub new {
    my ($class, $animationBehavior) = @_;
    my $self = $class->SUPER::new($animationBehavior);
        # super(...) made $self above
    return $self;
}


sub nextFrame {
    my ($self) = @_;
        my $indexedAnimationBehavior = ($self->{animationBehaviorP});
        $indexedAnimationBehavior->{loopIndex}++;
}


sub setLastFrame {
    my ($self) = @_;
}


sub isComplete {
    my ($self) = @_;
        return 0;
}


sub open {
    my ($self) = @_;
}


sub close {
    my ($self) = @_;
}


sub process {
    my ($self) = @_;
}

use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::animation::IndexedAnimationBehavior;
use org::allbinary::animation::special::SpecialAnimationInterface;

1;

