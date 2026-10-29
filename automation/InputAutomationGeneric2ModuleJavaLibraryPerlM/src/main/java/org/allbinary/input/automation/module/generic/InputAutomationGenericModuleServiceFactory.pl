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

package org::allbinary::input::automation::module::generic::InputAutomationGenericModuleServiceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::module::osgi::InputAutomationModuleServiceFactory';

our $inputAutomationGenericModuleServiceFactory = 'org::allbinary::input::automation::module::generic::InputAutomationGenericModuleServiceFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        try {
            my $inputAutomationModuleInterfaceArray = [(undef) x (1)];
            $inputAutomationModuleInterfaceArray->[0] = 'org::allbinary::input::automation::module::generic::GenericModuleFactory'->new();
            $self->setInputAutomationModuleInterfaceArray($inputAutomationModuleInterfaceArray);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{CONSTRUCTOR}, $e);
        }
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::automation::module::generic::InputAutomationGenericModuleServiceFactory::inputAutomationGenericModuleServiceFactory;
}

use org::allbinary::input::automation::module::InputAutomationModuleFactoryInterface;
use org::allbinary::input::automation::module::osgi::InputAutomationModuleServiceFactory;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::input::automation::module::generic::GenericModuleFactory;

1;

