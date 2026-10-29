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

package org::allbinary::game::layer::LayerPlacementTypeFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::game::layer::LayerPlacementTypeFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{MAP} = 'org::allbinary::game::layer::LayerPlacementType'->new(2147483647);
    $self->{LEFT} = 'org::allbinary::game::layer::LayerPlacementType'->new('org::allbinary::direction::DirectionFactory'->getInstance()->{LEFT}->getValue());
    $self->{DOWN} = 'org::allbinary::game::layer::LayerPlacementType'->new('org::allbinary::direction::DirectionFactory'->getInstance()->{DOWN}->getValue());
    $self->{UP} = 'org::allbinary::game::layer::LayerPlacementType'->new('org::allbinary::direction::DirectionFactory'->getInstance()->{UP}->getValue());
    $self->{RIGHT} = 'org::allbinary::game::layer::LayerPlacementType'->new('org::allbinary::direction::DirectionFactory'->getInstance()->{RIGHT}->getValue());
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::layer::LayerPlacementTypeFactory::instance;
}

use org::allbinary::direction::DirectionFactory;
use org::allbinary::game::layer::LayerPlacementType;

1;

