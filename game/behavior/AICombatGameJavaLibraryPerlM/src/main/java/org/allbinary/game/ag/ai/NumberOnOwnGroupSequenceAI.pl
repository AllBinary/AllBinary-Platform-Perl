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

package org::allbinary::game::ag::ai::NumberOnOwnGroupSequenceAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ag::ai::sequence::SequenceAI';


sub _init_fields {
    my ($self) = @_;
    $self->{numberOnSameTeam} = undef;
}


sub new {
    my ($class, $numberOnSameTeam, $artificialIntelligenceInterface, $ownerLayerInterface, $gameInput) = @_;
    my $self = $class->SUPER::new($artificialIntelligenceInterface, $ownerLayerInterface, $gameInput);
    $self->_init_fields();
        # super(...) made $self above
        $self->{numberOnSameTeam} = $numberOnSameTeam;
    return $self;
}


# throws Exception
sub processAI {
    my ($self, $allBinaryLayerManager) = @_;
        my $layerInterface = $self->getOwnerLayerInterface();
        my $index = $self->getIndex();
        if (scalar(@{$self->{numberOnSameTeam}}) > $index) {
            my $size = 'org::allbinary::game::layer::identification::GroupLayerManagerListener'->getInstance()->getGroupSizeFromInterface($layerInterface);
            if (int($self->{numberOnSameTeam}->[$index]) > $size) {
                $self->next();
            }
        }
        $self->SUPER::processAI($allBinaryLayerManager);
}

use org::allbinary::ai::ArtificialIntelligenceInterface;
use org::allbinary::game::ag::ai::sequence::SequenceAI;
use org::allbinary::game::input::GameInput;
use org::allbinary::game::layer::identification::GroupLayerManagerListener;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;

1;

