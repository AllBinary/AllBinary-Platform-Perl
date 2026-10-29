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

package org::allbinary::animation::NullAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::AnimationInterfaceFactoryInterface','org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface';

our $NULL_NOT_FOR_USE_ANIMATION_FACTORY = 'org::allbinary::animation::NullAnimationFactory'->new();
our $NULL_ANIMATION_FACTORY = 'org::allbinary::animation::NullAnimationFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{NULL_ANIMATION} = do {
        package org::allbinary::animation::Animation::AnonymousN65758 { our @ISA = ('org::allbinary::animation::Animation');
        

        sub paintXY {
            my ($self, $graphics, $x, $y) = @_;
        }
        }
        'org::allbinary::animation::Animation::AnonymousN65758'->can('new') ? 'org::allbinary::animation::Animation::AnonymousN65758'->new() : bless({}, 'org::allbinary::animation::Animation::AnonymousN65758')
    };
    $self->{EMPTY_ARRAY} = [(undef) x (0)];
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getFactoryInstance {
    my ($class) = @_;
        return $org::allbinary::animation::NullAnimationFactory::NULL_ANIMATION_FACTORY;
}


sub getInstance {
    my ($self, $instanceId) = @_;
        return $self->{NULL_ANIMATION};
}


# throws Exception
sub getInstanceAnimation {
    my ($self, $animationInterface) = @_;
        return $self->{NULL_ANIMATION};
}


sub setInitialScale {
    my ($self, $scaleProperties) = @_;
}

# use javax::microedition::lcdui::Graphics;
use org::allbinary::media::ScaleProperties;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface;
use org::allbinary::animation::Animation;

1;

