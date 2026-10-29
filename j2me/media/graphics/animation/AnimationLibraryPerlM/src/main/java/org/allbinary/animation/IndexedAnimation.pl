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

package org::allbinary::animation::IndexedAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::Animation','org::allbinary::animation::IndexedAnimationInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{animationBehaviorP} = undef;
}


sub new {
    my ($class, $animationBehavior) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        $self->{animationBehaviorP} = $animationBehavior;
    return $self;
}


sub getAnimationBehavior {
    my ($self) = @_;
        return $self->{animationBehaviorP};
}


sub reset {
    my ($self) = @_;
        $self->{animationBehaviorP}->reset();
        $self->setFrame(0);
}


sub setFrame {
    my ($self, $index) = @_;
}


sub getFrame {
    my ($self) = @_;
        return 0;
}


# throws Exception
sub getAnimationSize {
    my ($self) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


sub getSize {
    my ($self) = @_;
        return 0;
}


sub previousFrame {
    my ($self) = @_;
}


sub isLastFrame {
    my ($self) = @_;
        if ($self->getFrame() == $self->getSize() - 1) {
            return 1;
        } else {
            return 0;
        }
}


sub setSequence {
    my ($self, $sequence) = @_;
}


sub getSequence {
    my ($self) = @_;
        return 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance();
}


sub setState {
    my ($self, $indexedAnimation) = @_;
        $self->setFrame($indexedAnimation->getFrame());
        $self->setDx($indexedAnimation->getDx());
        $self->setDy($indexedAnimation->getDy());
}


sub getWidth {
    my ($self) = @_;
        return 0;
}


sub getHeight {
    my ($self) = @_;
        return 0;
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::math::PrimitiveIntUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::animation::Animation;
use org::allbinary::animation::IndexedAnimationInterface;

1;

