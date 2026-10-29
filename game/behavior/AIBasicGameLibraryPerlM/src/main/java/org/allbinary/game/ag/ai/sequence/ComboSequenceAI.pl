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

package org::allbinary::game::ag::ai::sequence::ComboSequenceAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ag::ai::sequence::SequenceAI';



sub new {
    my ($class, $artificialIntelligenceInterface, $ownerLayerInterface, $gameInput) = @_;
    my $self = $class->SUPER::new($artificialIntelligenceInterface, $ownerLayerInterface, $gameInput);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub processAI {
    my ($self, $allBinaryLayerManager) = @_;
        my $artificialIntelligenceInterfaceArray = $self->getArtificialIntelligenceInterface();
        my $size = scalar(@{$artificialIntelligenceInterfaceArray});
        for (my $index = 0; $index < $size; $index++) {
            $self->setIndex($index);
            $self->SUPER::processAI($allBinaryLayerManager);
        }
}

use org::allbinary::ai::ArtificialIntelligenceInterface;
use org::allbinary::game::input::GameInput;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::game::ag::ai::sequence::SequenceAI;

1;

