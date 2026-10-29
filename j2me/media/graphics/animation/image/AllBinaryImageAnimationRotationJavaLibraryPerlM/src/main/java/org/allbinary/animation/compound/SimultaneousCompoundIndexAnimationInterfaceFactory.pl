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

package org::allbinary::animation::compound::SimultaneousCompoundIndexAnimationInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::AnimationInterfaceFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{basicAnimationInterfaceFactoryInterfaceArray} = undef;
    $self->{animationBehaviorFactory} = undef;
}


sub new {
    my ($class, $basicAnimationInterfaceFactoryInterfaceArray, $animationBehaviorFactory) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{basicAnimationInterfaceFactoryInterfaceArray} = $basicAnimationInterfaceFactoryInterfaceArray;
        $self->{animationBehaviorFactory} = $animationBehaviorFactory;
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        my $size = scalar(@{$self->{basicAnimationInterfaceFactoryInterfaceArray}});
        my $animationInterfaceArray = [(undef) x ($size)];
        for (my $index = 0; $index < $size; $index++) {
            $animationInterfaceArray->[$index] = $self->{basicAnimationInterfaceFactoryInterfaceArray}->[$index]->getInstance($instanceId);
        }
        return $self->getOrCreate($animationInterfaceArray);
}


sub getOrCreate {
    my ($self, $animationInterfaceArray) = @_;
        return 'org::allbinary::animation::compound::SimultaneousCompoundIndexAnimation'->new($animationInterfaceArray, $self->{animationBehaviorFactory}->getOrCreateInstance());
}


sub getBasicAnimationInterfaceFactoryInterfaceArray {
    my ($self) = @_;
        return $self->{basicAnimationInterfaceFactoryInterfaceArray};
}


sub setInitialScale {
    my ($self, $scaleProperties) = @_;
}

use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::animation::IndexedAnimation;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::media::ScaleProperties;
use org::allbinary::animation::compound::SimultaneousCompoundIndexAnimation;

1;

