# 
# AllBinary Open License Version 1 
# Copyright (c) 2025 AllBinary 
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

package org::allbinary::game::input::NullPlayerGameInputComposite;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::input::PlayerGameInputCompositeInterface';

our $NULL_PLAYER_GAME_INPUT_COMPOSITE = 'org::allbinary::game::input::NullPlayerGameInputComposite'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getName {
    my ($self) = @_;
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}


# throws Exception
sub processInput {
    my ($self, $layerManager) = @_;
}


sub initInputProcessors {
    my ($self) = @_;
}


sub getPlayerGameInput {
    my ($self) = @_;
        return 'org::allbinary::game::input::NoPlayerGameInput'->getInstance();
}

use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::game::input::PlayerGameInputCompositeInterface;
use org::allbinary::game::input::NoPlayerGameInput;

1;

