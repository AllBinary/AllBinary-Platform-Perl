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

package org::allbinary::input::automation::module::generic::GenericInputAutomationAction;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::module::InputAutomationActionInterface';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub test {
    my ($self) = @_;
}


sub getInputRobotInterfaceArray {
    my ($self) = @_;
        return undef;
}

use org::allbinary::input::automation::module::InputAutomationActionInterface;
use org::allbinary::input::automation::robot::InputRobotInterface;

1;

