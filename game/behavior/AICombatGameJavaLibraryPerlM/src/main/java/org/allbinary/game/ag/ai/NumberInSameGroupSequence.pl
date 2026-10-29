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

package org::allbinary::game::ag::ai::NumberInSameGroupSequence;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_ZERO} = undef;
    $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_ONE} = undef;
    $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_TWO} = undef;
    $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_THREE} = undef;
    $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_FOUR} = undef;
    $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_FIVE} = undef;
    $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_SIX} = undef;
    $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_SEVEN} = undef;
    $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_EIGHT} = undef;
    $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_NINE} = undef;
    $self->{NUMBER_ON_SAME_TEAM_SEQUENCE} = undef;
}


sub getInstance {
    my ($class) = @_;
        return 'org::allbinary::game::ag::ai::NumberInSameGroupSequence'->new();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $smallIntegerSingletonFactory = 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance();
        $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_ZERO} = $smallIntegerSingletonFactory->getAt(100);
        $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_ONE} = $smallIntegerSingletonFactory->getAt(101);
        $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_TWO} = $smallIntegerSingletonFactory->getAt(102);
        $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_THREE} = $smallIntegerSingletonFactory->getAt(103);
        $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_FOUR} = $smallIntegerSingletonFactory->getAt(104);
        $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_FIVE} = $smallIntegerSingletonFactory->getAt(105);
        $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_SIX} = $smallIntegerSingletonFactory->getAt(106);
        $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_SEVEN} = $smallIntegerSingletonFactory->getAt(107);
        $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_EIGHT} = $smallIntegerSingletonFactory->getAt(108);
        $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_NINE} = $smallIntegerSingletonFactory->getAt(109);
        $self->{NUMBER_ON_SAME_TEAM_SEQUENCE} = [$self->{NUMBER_ON_SAME_TEAM_SEQUENCE_ZERO}, $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_ONE}, $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_THREE}, $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_FOUR}, $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_FIVE}, $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_SIX}, $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_SEVEN}, $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_EIGHT}, $self->{NUMBER_ON_SAME_TEAM_SEQUENCE_NINE}];
    return $self;
}

use org::allbinary::logic::math::SmallIntegerSingletonFactory;

1;

