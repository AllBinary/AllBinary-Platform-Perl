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

package org::allbinary::game::configuration::persistance::GameConfigurationPersistanceSingleton;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::configuration::persistance::KeyValuePersistance';

our $GAME_PERSISTANCE = 'org::allbinary::game::configuration::persistance::GameConfigurationPersistanceSingleton'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::game::configuration::persistance::GameConfigurationPersistanceSingleton::GAME_PERSISTANCE;
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new('org::allbinary::game::configuration::persistance::GamePersistanceStrings'->getInstance()->{SAVED_GAME_CONFIGURATION_RECORD_ID});
        # super(...) made $self above
    return $self;
}

use org::allbinary::game::configuration::persistance::KeyValuePersistance;
use org::allbinary::game::configuration::persistance::GamePersistanceStrings;

1;

