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

package org::allbinary::game::ag::ai::NullAIFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ai::ArtificialIntelligenceInterfaceFactoryInterface';

our $NULL_AI = 'org::allbinary::game::ag::ai::NullAI'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($self, $hashtable, $ownerLayerInterface, $gameInput) = @_;
        return $org::allbinary::game::ag::ai::NullAIFactory::NULL_AI;
}


# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::ag::ai::NullAIFactory::NULL_AI;
}

use org::allbinary::ai::ArtificialIntelligenceInterface;
use org::allbinary::game::ai::ArtificialIntelligenceInterfaceFactoryInterface;
use org::allbinary::game::input::GameInput;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::ag::ai::NullAI;

1;

