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

package org::allbinary::ai::ArtificialIntelligence;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::ai::ArtificialIntelligenceInterface';

our $AI_ID = 2;
our $instance = 'org::allbinary::ai::ArtificialIntelligence'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::ai::ArtificialIntelligence::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub processAI {
    my ($self, $layerManager) = @_;
}


sub getId {
    my ($self) = @_;
        return 1;
}

use org::allbinary::layer::AllBinaryLayerManager;
use org::allbinary::ai::ArtificialIntelligenceInterface;

1;

