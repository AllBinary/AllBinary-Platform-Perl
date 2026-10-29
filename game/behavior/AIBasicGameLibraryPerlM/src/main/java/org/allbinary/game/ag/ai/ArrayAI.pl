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

package org::allbinary::game::ag::ai::ArrayAI;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::ai::BasicAI';


sub _init_fields {
    my ($self) = @_;
    $self->{artificialIntelligenceInterfaceArray} = undef;
}


sub new {
    my ($class, $artificialIntelligenceInterface, $ownerLayerInterface, $gameInput) = @_;
    my $self = $class->SUPER::new($ownerLayerInterface, $gameInput);
    $self->_init_fields();
        # super(...) made $self above
        $self->{artificialIntelligenceInterfaceArray} = $artificialIntelligenceInterface;
    return $self;
}


# throws Exception
sub processAI {
    my ($self, $allBinaryLayerManager) = @_;
        my $size = scalar(@{$self->{artificialIntelligenceInterfaceArray}});
        for (my $index = 0; $index < $size; $index++) {
            $self->{artificialIntelligenceInterfaceArray}->[$index]->processAI($allBinaryLayerManager);
        }
}


sub getArtificialIntelligenceInterface {
    my ($self) = @_;
        return $self->{artificialIntelligenceInterfaceArray};
}

use org::allbinary::ai::ArtificialIntelligenceInterface;
use org::allbinary::game::input::GameInput;
use org::allbinary::layer::AllBinaryLayer;
use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::game::ai::BasicAI;

1;

