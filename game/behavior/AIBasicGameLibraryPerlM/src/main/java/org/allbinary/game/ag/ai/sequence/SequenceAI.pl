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

package org::allbinary::game::ag::ai::sequence::SequenceAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ag::ai::ArrayAI';

our $SEQUENCE_AI = "Sequence AI";

sub _init_fields {
    my ($self) = @_;
    $self->{index} = 0;
}


sub new {
    my ($class, $artificialIntelligenceInterfaceArray, $ownerLayerInterface, $gameInput) = @_;
    my $self = $class->SUPER::new($artificialIntelligenceInterfaceArray, $ownerLayerInterface, $gameInput);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


# throws Exception
sub processAI {
    my ($self, $allBinaryLayerManager) = @_;
        $self->getArtificialIntelligenceInterface()->[$self->{index}]->processAI($allBinaryLayerManager);
}


sub next {
    my ($self) = @_;
        $self->{index}++;
        my $artificialIntelligenceInterface = $self->getSelectedArtificialIntelligenceInterface();
        if ($artificialIntelligenceInterface->getId() == $org::allbinary::ai::ArtificialIntelligence::AI_ID) {
            my $artificialIntelligenceTransitionInterface = $artificialIntelligenceInterface;
            $artificialIntelligenceTransitionInterface->transition();
        }
}


sub getIndex {
    my ($self) = @_;
        return $self->{index};
}


sub setIndex {
    my ($self, $index) = @_;
        $self->{index} = $index;
}


sub getSelectedArtificialIntelligenceInterface {
    my ($self) = @_;
        return $self->getArtificialIntelligenceInterface()->[$self->{index}];
}


sub getName {
    my ($self) = @_;
        return $org::allbinary::game::ag::ai::sequence::SequenceAI::SEQUENCE_AI;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($self->SUPER::toString());
        $stringBuffer->append(" Selected AI: ");
        $stringBuffer->append('org::allbinary::logic::string::StringUtil'->getInstance()->toString($self->getSelectedArtificialIntelligenceInterface()));
        return $stringBuffer->toString();
}

use org::allbinary::ai::ArtificialIntelligence;
use org::allbinary::ai::ArtificialIntelligenceInterface;
use org::allbinary::ai::ArtificialIntelligenceTransitionInterface;
use org::allbinary::game::ag::ai::ArrayAI;
use org::allbinary::game::input::GameInput;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;

1;

