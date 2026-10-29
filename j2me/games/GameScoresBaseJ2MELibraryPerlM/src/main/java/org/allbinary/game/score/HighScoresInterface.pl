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
package org::allbinary::game::score::HighScoresInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getList {
    my ($self) = @_;
    die "abstract method getList";
}


sub addHighScore {
    my ($self, $newHighScore) = @_;
    die "abstract method addHighScore";
}


sub getTotal {
    my ($self) = @_;
    die "abstract method getTotal";
}


# throws Exception
sub isBestScore {
    my ($self, $newHighScore) = @_;
    die "abstract method isBestScore";
}

use org::allbinary::util::BasicArrayList;

1;

