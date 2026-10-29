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

package org::allbinary::input::automation::robot::osgi::InputAutomationRobotChangeEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{inputAutomationRobotInterfaceWrapper} = undef;
}


sub new {
    my ($class, $inputAutomationRobotInterfaceWrapper) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setInputAutomationRobotInterfaceWrapper($inputAutomationRobotInterfaceWrapper);
    return $self;
}


sub getInputAutomationRobotInterfaceWrapper {
    my ($self) = @_;
        return $self->{inputAutomationRobotInterfaceWrapper};
}


sub setInputAutomationRobotInterfaceWrapper {
    my ($self, $inputAutomationRobotInterfaceWrapper) = @_;
        $self->{inputAutomationRobotInterfaceWrapper} = $inputAutomationRobotInterfaceWrapper;
}


1;

