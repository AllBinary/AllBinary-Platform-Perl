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

package org::allbinary::animation::NullIndexedAnimationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object','org::allbinary::animation::AnimationInterfaceFactoryInterface','org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface';

our $NULL_INDEXED_ANIMATION_ARRAY = [(undef) x (0)];
tie our $NULL_INDEXED_ANIMATION_FACTORY, 'java::lang::LazyStatic', sub { 'org::allbinary::animation::NullIndexedAnimationFactory'->new() };

sub _init_fields {
    my ($self) = @_;
    $self->{NULL_ANIMATION} = 'org::allbinary::animation::NullIndexedAnimationInner'->new();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
    return $self;
}


sub getFactoryInstance {
    my ($class) = @_;
        return $org::allbinary::animation::NullIndexedAnimationFactory::NULL_INDEXED_ANIMATION_FACTORY;
}


# throws Exception
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

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::media::ScaleProperties ();
use org::allbinary::animation::AnimationInterfaceFactoryInterface ();
use org::allbinary::animation::ProceduralAnimationInterfaceFactoryInterface ();
use org::allbinary::animation::NullIndexedAnimationInner ();

1;

