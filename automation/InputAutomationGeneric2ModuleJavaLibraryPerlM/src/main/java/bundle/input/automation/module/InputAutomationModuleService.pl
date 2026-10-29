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

package bundle::input::automation::module::InputAutomationModuleService;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'bundle::input::automation::module::InputAutomationModuleServiceInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{inputAutomationModuleInterfaceArray} = undef;
}


sub new {
    my ($class, $inputAutomationModuleInterfaceArray) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setInputAutomationModuleInterfaceArray($inputAutomationModuleInterfaceArray);
    return $self;
}


sub getInputAutomationModuleInterfaceArray {
    my ($self) = @_;
        return $self->{inputAutomationModuleInterfaceArray};
}


sub setInputAutomationModuleInterfaceArray {
    my ($self, $inputAutomationModuleInterfaceArray) = @_;
        $self->{inputAutomationModuleInterfaceArray} = $inputAutomationModuleInterfaceArray;
}

use org::allbinary::input::automation::module::InputAutomationModuleFactoryInterface;
use bundle::input::automation::module::InputAutomationModuleServiceInterface;

1;

