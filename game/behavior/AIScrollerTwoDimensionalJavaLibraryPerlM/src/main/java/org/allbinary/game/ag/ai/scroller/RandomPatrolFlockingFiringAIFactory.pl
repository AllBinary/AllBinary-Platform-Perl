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

package org::allbinary::game::ag::ai::scroller::RandomPatrolFlockingFiringAIFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ai::ArtificialIntelligenceInterfaceFactoryInterface';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getInstance {
    my ($self, $hashtable, $ownerLayerInterface, $gameInput) = @_;
        my $artificialIntelligenceInterface = [(undef) x (2)];
        $artificialIntelligenceInterface->[0] = 'org::allbinary::game::ag::ai::scroller::RandomPatrolAI'->new($hashtable, $ownerLayerInterface, $gameInput);
        $artificialIntelligenceInterface->[1] = 'org::allbinary::game::ag::ai::scroller::TimedFireAI'->new(1800, $ownerLayerInterface, $gameInput);
        return 'org::allbinary::game::ag::ai::ArrayAI'->new($artificialIntelligenceInterface, $ownerLayerInterface, $gameInput);
}

use org::allbinary::ai::ArtificialIntelligenceInterface;
use org::allbinary::game::ag::ai::ArrayAI;
use org::allbinary::game::ai::ArtificialIntelligenceInterfaceFactoryInterface;
use org::allbinary::game::input::GameInput;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::ag::ai::scroller::RandomPatrolAI;
use org::allbinary::game::ag::ai::scroller::TimedFireAI;

1;

