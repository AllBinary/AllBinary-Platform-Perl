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

package org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::layer::pickup::PickedUpLayerInterfaceFactory','org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactoryInterface';

our $NULL_COUNTED_PICKUP_LAYER_FACTORY = 'org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactory'->new('org::allbinary::game::layer::pickup::PickedUpLayerTypeFactory'->getInstance()->{NONE}, $org::allbinary::game::layer::pickup::IconLayer::NULL_ICON_LAYER, 'org::allbinary::animation::NullAnimationFactory'->getFactoryInstance()->getInstance(0));

sub _init_fields {
    my ($self) = @_;
    $self->{id} = undef;
}


sub new {
    my ($class, $pickeUpLayerType, $iconLayer, $animationInterface) = @_;
    my $self = $class->SUPER::new($pickeUpLayerType, $iconLayer, $animationInterface);
    $self->_init_fields();
        # super(...) made $self above
        my $list = 'org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactoryPool'->getInstance()->getList();
        $self->{id} = $list->size();
        $list->add($self);
    return $self;
}


# throws Exception
sub getNextInstance {
    my ($self, $hashtable, $x, $y, $z) = @_;
        die ('org::allbinary::string::CommonStrings'->getInstance()->{NOT_IMPLEMENTED});
}


sub getTotal {
    my ($self) = @_;
        return -1;
}


sub getId {
    my ($self) = @_;
        return $self->{id};
}

use org::allbinary::animation::Animation;
use org::allbinary::animation::NullAnimationFactory;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::string::CommonStrings;
use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::game::layer::pickup::PickedUpLayerInterfaceFactory;
use org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactoryInterface;
use org::allbinary::game::layer::pickup::PickedUpLayerTypeFactory;
use org::allbinary::game::layer::pickup::IconLayer;
use org::allbinary::game::layer::pickup::CountedPickedUpLayerInterfaceFactoryPool;

1;

