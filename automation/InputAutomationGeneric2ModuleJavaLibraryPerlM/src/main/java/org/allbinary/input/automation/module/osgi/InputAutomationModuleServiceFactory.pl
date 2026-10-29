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

package org::allbinary::input::automation::module::osgi::InputAutomationModuleServiceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::osgi::framework::ServiceFactory';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{inputAutomationModuleInterfaceArray} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub getService {
    my ($self, $bundle, $registration) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "getService");
        return 'bundle::input::automation::module::InputAutomationModuleService'->new($self->getInputAutomationModuleInterfaceArray());
}


sub ungetService {
    my ($self, $bundle, $registration, $service) = @_;
}


sub getInputAutomationModuleInterfaceArray {
    my ($self) = @_;
        return $self->{inputAutomationModuleInterfaceArray};
}


sub setInputAutomationModuleInterfaceArray {
    my ($self, $inputAutomationModuleInterfaceArray) = @_;
        $self->{inputAutomationModuleInterfaceArray} = $inputAutomationModuleInterfaceArray;
}

use org::osgi::framework::Bundle;
use org::osgi::framework::ServiceFactory;
use org::osgi::framework::ServiceRegistration;
use bundle::input::automation::module::InputAutomationModuleService;
use org::allbinary::input::automation::module::InputAutomationModuleFactoryInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

