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

package org::allbinary::input::automation::robot::osgi::InputAutomationRobotUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub getChangeEvent {
    my ($class, $inputRobotInterface) = @_;
        my $inputAutomationRobotInterfaceWrapper = 'org::allbinary::input::automation::robot::osgi::InputAutomationRobotInterfaceWrapper'->new($inputRobotInterface);
        my $inputAutomationRobotChangeEvent = 'org::allbinary::input::automation::robot::osgi::InputAutomationRobotChangeEvent'->new($inputAutomationRobotInterfaceWrapper);
        return $inputAutomationRobotChangeEvent;
}

use org::allbinary::input::automation::robot::InputRobotInterface;
use org::allbinary::input::automation::robot::osgi::InputAutomationRobotInterfaceWrapper;
use org::allbinary::input::automation::robot::osgi::InputAutomationRobotChangeEvent;

1;

