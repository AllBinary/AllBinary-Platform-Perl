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
package org::allbinary::game::score::remote::RemoteHighScoresSubmissionProcessorInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub process {
    my ($self, $remoteHighScores, $abeClientInformation, $highScore) = @_;
    die "abstract method process";
}

use org::allbinary::game::score::HighScore;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;

1;

