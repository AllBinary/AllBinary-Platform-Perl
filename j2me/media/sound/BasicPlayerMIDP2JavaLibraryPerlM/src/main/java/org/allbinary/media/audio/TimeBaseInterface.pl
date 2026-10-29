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
package org::allbinary::media::audio::TimeBaseInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getTimeBase {
    my ($self) = @_;
    die "abstract method getTimeBase";
}


# throws MediaException
sub setTimeBase {
    my ($self, $timeBase) = @_;
    die "abstract method setTimeBase";
}

# use javax::microedition::media::MediaException;
# use javax::microedition::media::TimeBase;

1;

