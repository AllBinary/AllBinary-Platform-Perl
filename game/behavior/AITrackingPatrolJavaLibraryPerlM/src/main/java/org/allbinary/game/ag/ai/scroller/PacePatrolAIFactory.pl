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

package org::allbinary::game::ag::ai::scroller::PacePatrolAIFactory;
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
        $hashtable->put($org::allbinary::game::ag::ai::scroller::BasePatrolAI::MAX_DISTANCE, 'org::allbinary::logic::math::SmallIntegerSingletonFactory'->getInstance()->getAt(220));
        return 'org::allbinary::game::ag::ai::scroller::PacePatrolAI'->new($hashtable, $ownerLayerInterface, $gameInput);
}

use org::allbinary::ai::ArtificialIntelligenceInterface;
use org::allbinary::game::ai::ArtificialIntelligenceInterfaceFactoryInterface;
use org::allbinary::game::input::GameInput;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::math::SmallIntegerSingletonFactory;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::ag::ai::scroller::BasePatrolAI;
use org::allbinary::game::ag::ai::scroller::PacePatrolAI;

1;

