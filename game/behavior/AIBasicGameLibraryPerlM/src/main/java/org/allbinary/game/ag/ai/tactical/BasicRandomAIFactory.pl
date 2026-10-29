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

package org::allbinary::game::ag::ai::tactical::BasicRandomAIFactory;
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
        my $visitor = $hashtable->get($org::allbinary::game::ai::BasicAI::AI_VISITOR);
        if (!defined($visitor)) {
            die ("No Visitor Provided");
        }
        my $inputProbability = $hashtable->get($org::allbinary::game::ag::ai::InputProbability::INPUT_PROBABILITY);
        return 'org::allbinary::game::ag::ai::tactical::BasicRandomAI'->new($ownerLayerInterface, $gameInput, $inputProbability, $visitor);
}

use org::allbinary::ai::ArtificialIntelligenceInterface;
use org::allbinary::game::ai::ArtificialIntelligenceInterfaceFactoryInterface;
use org::allbinary::game::ai::BasicAI;
use org::allbinary::game::ag::ai::InputProbability;
use org::allbinary::game::input::GameInput;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::logic::util::visitor::Visitor;
use org::allbinary::util::ABHashtable;
use org::allbinary::game::ag::ai::tactical::BasicRandomAI;

1;

