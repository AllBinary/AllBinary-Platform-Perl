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

package org::allbinary::animation::compound::SimultaneousCompoundIndexedAnimation;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::IndexedAnimation';


sub _init_fields {
    my ($self) = @_;
    $self->{animationInterfaceArray} = undef;
}


sub new {
    my ($class, $animationInterfaceArray, $animationBehavior) = @_;
    my $self = $class->SUPER::new($animationBehavior);
    $self->_init_fields();
        # super(...) made $self above
        $self->{animationInterfaceArray} = $animationInterfaceArray;
    return $self;
}


sub setFrame {
    my ($self, $frameIndex) = @_;
        my $indexedAnimation = undef;
        for (my $index = scalar(@{$self->{animationInterfaceArray}}); --$index >= 0; ) {
            $indexedAnimation = $self->{animationInterfaceArray}->[$index];
            $indexedAnimation->setFrame($frameIndex);
        }
}


sub getFrame {
    my ($self) = @_;
        my $indexedAnimation = $self->{animationInterfaceArray}->[0];
        return $indexedAnimation->getFrame();
}


sub getSize {
    my ($self) = @_;
        my $indexedAnimation = $self->{animationInterfaceArray}->[0];
        return $indexedAnimation->getSize();
}


sub previousFrame {
    my ($self) = @_;
        my $indexedAnimation = undef;
        for (my $index = scalar(@{$self->{animationInterfaceArray}}); --$index >= 0; ) {
            $indexedAnimation = $self->{animationInterfaceArray}->[$index];
            $indexedAnimation->previousFrame();
        }
}


sub setSequence {
    my ($self, $sequence) = @_;
}


sub getSequence {
    my ($self) = @_;
        return 'org::allbinary::logic::math::PrimitiveIntUtil'->getArrayInstance();
}


# throws Exception
sub nextFrame {
    my ($self) = @_;
        for (my $index = scalar(@{$self->{animationInterfaceArray}}); --$index >= 0; ) {
            $self->{animationInterfaceArray}->[$index]->nextFrame();
        }
}


sub paintXY {
    my ($self, $graphics, $x, $y) = @_;
        my $size = scalar(@{$self->{animationInterfaceArray}});
        for (my $index = 0; $index < $size; $index++) {
            $self->{animationInterfaceArray}->[$index]->paintXY($graphics, $x, $y);
        }
}


sub paintThreedXYZ {
    my ($self, $graphics, $x, $y, $z) = @_;
        my $size = scalar(@{$self->{animationInterfaceArray}});
        for (my $index = 0; $index < $size; $index++) {
            $self->{animationInterfaceArray}->[$index]->paintThreedXYZ($graphics, $x, $y, $z);
        }
}


sub getAnimationInterfaceArray {
    my ($self) = @_;
        return $self->{animationInterfaceArray};
}


sub setAnimationInterfaceArray {
    my ($self, $animationInterfaceArray) = @_;
        $self->{animationInterfaceArray} = $animationInterfaceArray;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehavior;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::logic::math::PrimitiveIntUtil;

1;

