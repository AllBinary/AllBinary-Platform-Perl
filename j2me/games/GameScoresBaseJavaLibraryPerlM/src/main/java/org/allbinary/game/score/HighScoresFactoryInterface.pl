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

# Java interface
package org::allbinary::game::score::HighScoresFactoryInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub fetchHighScores {
    my ($self, $gameInfo, $highScoresResultsListener) = @_;
    die "abstract method fetchHighScores";
}


sub fetchHighScoresPreload {
    my ($self, $gameInfo, $highScoresResultsListener, $preload) = @_;
    die "abstract method fetchHighScoresPreload";
}


sub createHighScoresHelper {
    my ($self) = @_;
    die "abstract method createHighScoresHelper";
}

use org::allbinary::game::GameInfo;

1;

