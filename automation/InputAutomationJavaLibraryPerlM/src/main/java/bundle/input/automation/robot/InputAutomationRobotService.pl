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

package bundle::input::automation::robot::InputAutomationRobotService;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'bundle::input::automation::robot::InputAutomationRobotServiceInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{inputRobotInterfaceArray} = undef;
}


sub new {
    my ($class, $inputRobotInterfaceArray) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setInputRobotInterfaceArray($inputRobotInterfaceArray);
    return $self;
}


sub getInputRobotInterfaceArray {
    my ($self) = @_;
        return $self->{inputRobotInterfaceArray};
}


sub setInputRobotInterfaceArray {
    my ($self, $inputRobotInterfaceArray) = @_;
        $self->{inputRobotInterfaceArray} = $inputRobotInterfaceArray;
}

use org::allbinary::input::automation::robot::InputRobotInterface;
use bundle::input::automation::robot::InputAutomationRobotServiceInterface;

1;

