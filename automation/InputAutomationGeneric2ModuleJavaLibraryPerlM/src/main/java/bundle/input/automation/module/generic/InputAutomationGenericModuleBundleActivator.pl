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

package bundle::input::automation::module::generic::InputAutomationGenericModuleBundleActivator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::module::osgi::InputAutomationModuleBundleActivator';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    return $self;
}


# throws Exception
sub init {
    my ($self) = @_;
        my $inputAutomationGenericModuleServiceFactory = 'org::allbinary::input::automation::module::generic::InputAutomationGenericModuleServiceFactory'->getInstance();
        $self->setInputAutomationModuleInterface($inputAutomationGenericModuleServiceFactory->getInputAutomationModuleInterfaceArray());
        $self->setServiceFactory($inputAutomationGenericModuleServiceFactory);
}

use org::allbinary::input::automation::module::generic::InputAutomationGenericModuleServiceFactory;
use org::allbinary::input::automation::module::osgi::InputAutomationModuleBundleActivator;

1;

