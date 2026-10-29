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
package org::allbinary::input::automation::actions::script::condition::ProfileActionScriptConditionInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::actions::script::ProfileActionScriptNodeInterface','org::allbinary::input::automation::actions::script::condition::CustomTreeNodeInterface','org::allbinary::input::automation::actions::script::ProfileActionScriptItemInterface';



sub addProcessor {
    my ($self, $profileActionProcessorInterface) = @_;
    die "abstract method addProcessor";
}


sub removeProcessor {
    my ($self, $profileActionProcessorInterface) = @_;
    die "abstract method removeProcessor";
}


# throws Exception
sub shouldProcess {
    my ($self, $frame) = @_;
    die "abstract method shouldProcess";
}

use org::allbinary::input::automation::actions::script::ProfileActionScriptItemInterface;
use org::allbinary::input::automation::actions::script::ProfileActionScriptNodeInterface;
use org::allbinary::input::automation::actions::script::condition::processors::ProfileActionScriptProcessorInterface;
use org::allbinary::input::automation::actions::script::condition::CustomTreeNodeInterface;

1;

