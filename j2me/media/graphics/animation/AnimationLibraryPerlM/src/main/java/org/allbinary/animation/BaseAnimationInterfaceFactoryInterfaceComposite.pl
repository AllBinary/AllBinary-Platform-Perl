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

package org::allbinary::animation::BaseAnimationInterfaceFactoryInterfaceComposite;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::animation::AnimationInterfaceFactoryInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{basicAnimationInterfaceFactoryInterfaceArray} = undef;
}


sub new {
    my ($class, $basicAnimationInterfaceFactoryInterfaceArray) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{basicAnimationInterfaceFactoryInterfaceArray} = $basicAnimationInterfaceFactoryInterfaceArray;
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $instanceId) = @_;
        return 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0);
}


sub getBasicAnimationInterfaceFactoryInterfaceArray {
    my ($self) = @_;
        return $self->{basicAnimationInterfaceFactoryInterfaceArray};
}


sub setBasicAnimationInterfaceFactoryInterfaceArray {
    my ($self, $basicAnimationInterfaceFactoryInterfaceArray) = @_;
        $self->{basicAnimationInterfaceFactoryInterfaceArray} = $basicAnimationInterfaceFactoryInterfaceArray;
}


sub setInitialScale {
    my ($self, $scaleProperties) = @_;
}

use org::allbinary::media::ScaleProperties;
use org::allbinary::animation::AnimationInterfaceFactoryInterface;
use org::allbinary::animation::NullAnimationFactory;

1;

