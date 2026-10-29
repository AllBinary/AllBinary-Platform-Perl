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

package org::allbinary::game::ai::ArtificialIntelligenceInterfaceFactoryInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SINGLETON = 'org::allbinary::game::ai::ArtificialIntelligenceInterfaceFactoryInterfaceFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{list} = 'org::allbinary::util::BasicArrayListUtil'->getInstance()->getImmutableInstance();
}

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub clear {
    my ($self) = @_;
        $self->{list} = 'org::allbinary::util::BasicArrayListD'->new();
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::ai::ArtificialIntelligenceInterfaceFactoryInterfaceFactory::SINGLETON;
}


sub getInstanceFromCollection {
    my ($self, $hashtable) = @_;
        my $typeInteger = $hashtable->get($org::allbinary::game::ai::BasicAI::ID);
        my $type = int($typeInteger);
        my $artificialIntelligenceInterfaceFactoryInterface = $self->{list}->{objectArray}->[$type - 1];
        return $artificialIntelligenceInterfaceFactoryInterface;
}


sub add {
    my ($self, $artificialIntelligenceInterfaceFactoryInterface) = @_;
        $self->{list}->add($artificialIntelligenceInterfaceFactoryInterface);
}

use org::allbinary::util::ABHashtable;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::util::BasicArrayListUtil;
use org::allbinary::game::ai::BasicAI;

1;

