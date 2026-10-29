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

package org::allbinary::animation::compound::CompoundAnimationInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::AnimationInterfaceFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{basicAnimationInterfaceFactoryInterfaceArrayP} = undef;
    $self->{animationBehaviorFactory} = undef;
}


sub new {
    my ($class, $basicAnimationInterfaceFactoryInterfaceArray, $animationBehaviorFactory) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{basicAnimationInterfaceFactoryInterfaceArrayP} = $basicAnimationInterfaceFactoryInterfaceArray;
        $self->{animationBehaviorFactory} = $animationBehaviorFactory;
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        my $size = scalar(@{$self->{basicAnimationInterfaceFactoryInterfaceArrayP}});
        my $animationInterfaceArray = $self->createArray($size);
        for (my $index = 0; $index < $size; $index++) {
            $animationInterfaceArray->[$index] = $self->{basicAnimationInterfaceFactoryInterfaceArrayP}->[$index]->getInstance($instanceId);
        }
        return $self->createAnimation($animationInterfaceArray);
}


sub createArray {
    my ($self, $size) = @_;
        return 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->{EMPTY_ARRAY};
}


sub createAnimation {
    my ($self, $animationInterfaceArray) = @_;
        return 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0);
}


sub getBasicAnimationInterfaceFactoryInterfaceArray {
    my ($self) = @_;
        return $self->{basicAnimationInterfaceFactoryInterfaceArrayP};
}


sub setInitialScale {
    my ($self, $scaleProperties) = @_;
        my $size = scalar(@{$self->{basicAnimationInterfaceFactoryInterfaceArrayP}});
        for (my $index = 0; $index < $size; $index++) {
            $self->{basicAnimationInterfaceFactoryInterfaceArrayP}->[$index]->setInitialScale($scaleProperties);
        }
}

use org::allbinary::animation::Animation;
use org::allbinary::animation::AnimationBehaviorFactory;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::logic::communication::log::ForcedLogUtil;
use org::allbinary::media::ScaleProperties;

1;

