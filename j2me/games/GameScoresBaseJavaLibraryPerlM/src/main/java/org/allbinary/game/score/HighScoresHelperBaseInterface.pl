# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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
package org::allbinary::game::score::HighScoresHelperBaseInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::game::score::HighScoresResultsListener';



sub setSelectedHighScores {
    my ($self, $selectedHighScores) = @_;
    die "abstract method setSelectedHighScores";
}


sub getHighScoresArray {
    my ($self) = @_;
    die "abstract method getHighScoresArray";
}


sub getSelectedHighScores {
    my ($self) = @_;
    die "abstract method getSelectedHighScores";
}

use org::allbinary::game::score::HighScoresResultsListener;

1;

