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
use parent -norequire,'java::lang::Object','org::allbinary::game::ai::ArtificialIntelligenceInterfaceFactoryInterface';

tie our $NULL_AI, 'java::lang::LazyStatic', sub { 'org::allbinary::game::ag::ai::NullAI'->new() };

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance_j3 {
    my ($self, $hashtable, $ownerLayerInterface, $gameInput) = @_;
        return $org::allbinary::game::ag::ai::NullAIFactory::NULL_AI;
}


sub getInstance_j0 {
    my ($class) = @_;
        return $org::allbinary::game::ag::ai::NullAIFactory::NULL_AI;
}

sub getInstance {
    my ($invocant, @arguments) = @_;
    return $invocant->getInstance_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->getInstance_j0(@arguments) if scalar(@arguments) == 0;
    die "No method getInstance takes " . scalar(@arguments) . " arguments";
}

use java::lang::Object ();
use java::lang::LazyStatic ();
use org::allbinary::ai::ArtificialIntelligenceInterface ();
use org::allbinary::game::ai::ArtificialIntelligenceInterfaceFactoryInterface ();
use org::allbinary::game::input::GameInput ();
use org::allbinary::layer::AllBinaryLayer ();
use org::allbinary::util::ABHashtable ();
use org::allbinary::game::ag::ai::NullAI ();

1;

