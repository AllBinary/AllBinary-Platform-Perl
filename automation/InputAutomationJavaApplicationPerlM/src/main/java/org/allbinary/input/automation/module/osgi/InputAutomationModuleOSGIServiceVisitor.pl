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

package org::allbinary::input::automation::module::osgi::InputAutomationModuleOSGIServiceVisitor;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::osgi::OSGIServiceVisitorInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub visit {
    my ($self, $anyType) = @_;
        return $self->visit($anyType);
}


# Java overloaded method: Perl keeps the last definition
sub visit {
    my ($self, $osgiServiceInterface) = @_;
        try {
            my $inputAutomationModuleService = $osgiServiceInterface;
            my $inputAutomationModuleInterfaceArray = $inputAutomationModuleService->getInputAutomationModuleInterfaceArray();
            for (my $index = 0; $index < scalar(@{$inputAutomationModuleInterfaceArray}); $index++) {
                'org::allbinary::input::automation::InputAutomationJFrame'->getInstance()->onAdd('org::allbinary::input::automation::configuration::InputAutomationConfigurationUtil'->getChangeEvent($inputAutomationModuleInterfaceArray->[$index]));
            }
            return 1;
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "visit", $e);
            return 0;
        }
}

use bundle::input::automation::module::InputAutomationModuleService;
use org::allbinary::input::automation::InputAutomationJFrame;
use org::allbinary::input::automation::configuration::InputAutomationConfigurationUtil;
use org::allbinary::input::automation::module::InputAutomationModuleFactoryInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::osgi::OSGIServiceInterface;
use org::allbinary::osgi::OSGIServiceVisitorInterface;
use org::allbinary::string::CommonStrings;

1;

