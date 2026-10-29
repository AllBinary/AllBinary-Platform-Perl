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

package org::allbinary::game::init::BasicBuildGameInitializerFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::init::GameInitializationInterfaceFactoryInterface';

our $NULL_BASE_BUILD_GMAE_INITIALIZER_FACTORY = 'org::allbinary::game::init::BasicBuildGameInitializerFactory'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($self) = @_;
        return $org::allbinary::game::init::BaseGameInitialization::NULL_BASE_GAME_INITIALIZATION;
}

use org::allbinary::game::init::GameInitializationInterfaceFactoryInterface;
use org::allbinary::game::init::BaseGameInitialization;

1;

