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

package org::allbinary::game::GameInfoCopyFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstanceMaxLevel {
    my ($class, $gameInfo, $maxLevel) = @_;
        return 'org::allbinary::game::GameInfo'->new($gameInfo->getGameType(), $gameInfo->getGameMode(), $gameInfo->getPlayerType(), $maxLevel, $gameInfo->getCurrentLevel());
}


sub getInstance {
    my ($class, $gameInfo) = @_;
        return 'org::allbinary::game::GameInfo'->new($gameInfo->getGameType(), $gameInfo->getGameMode(), $gameInfo->getPlayerType(), $gameInfo->getHighestLevel(), $gameInfo->getCurrentLevel());
}

use org::allbinary::game::GameInfo;

1;

