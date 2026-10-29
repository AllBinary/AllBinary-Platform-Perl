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
package org::allbinary::input::automation::actions::script::condition::processors::input::ProfileActionScriptInputInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::actions::script::condition::processors::ProfileActionScriptProcessorInterface';



sub setInputRobotInterface {
    my ($self, $inputRobotInterface) = @_;
    die "abstract method setInputRobotInterface";
}


sub getInputRobotInterface {
    my ($self) = @_;
    die "abstract method getInputRobotInterface";
}


sub getTime {
    my ($self) = @_;
    die "abstract method getTime";
}


sub setTime {
    my ($self, $time) = @_;
    die "abstract method setTime";
}

use org::allbinary::input::automation::actions::script::condition::processors::ProfileActionScriptProcessorInterface;
use org::allbinary::input::automation::robot::InputRobotInterface;

1;

