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

package org::allbinary::input::automation::configuration::InputAutomationConfigurationUtil;
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
    my ($class, $inputAutomationModuleInterface) = @_;
        my $inputAutomationModuleConfiguration = 'org::allbinary::input::automation::module::configuration::InputAutomationModuleConfiguration'->new($inputAutomationModuleInterface);
        my $inputAutomationConfigurationModuleChangeEvent = 'org::allbinary::input::automation::configuration::InputAutomationConfigurationModuleChangeEvent'->new($inputAutomationModuleConfiguration);
        return $inputAutomationConfigurationModuleChangeEvent;
}

use org::allbinary::input::automation::module::InputAutomationModuleFactoryInterface;
use org::allbinary::input::automation::module::configuration::InputAutomationModuleConfiguration;
use org::allbinary::input::automation::configuration::InputAutomationConfigurationModuleChangeEvent;

1;

