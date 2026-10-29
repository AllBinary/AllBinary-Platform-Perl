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

package org::allbinary::input::automation::module::generic::GenericModuleFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::input::automation::module::AbstractInputAutomationFactory';

our $NAME = "Generic" . $org::allbinary::input::automation::module::InputAutomationModuleData::MODULE_NAME_END;


sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new($NAME, 'org::allbinary::input::automation::module::generic::configuration::GenericModuleConfigurationJPanel'->new());
        # super(...) made $self above
    return $self;
}


# throws Exception
sub getInstance {
    my ($self) = @_;
        my $genericProfile = ($self->getConfigurationJPanel())->getSelectedGenericProfile();
        my $inputAutomationActionInterface = 'org::allbinary::input::automation::module::generic::GenericInputAutomationAction'->new();
        return 'org::allbinary::input::automation::module::generic::GenericInputAutomationWorker'->new($inputAutomationActionInterface, $genericProfile, 'org::allbinary::input::automation::module::generic::constraints::NoMotionRectangleConstraints'->new(), 'org::allbinary::input::automation::module::generic::constraints::NoImageComparatorConstraints'->new());
}

use org::allbinary::input::automation::module::AbstractInputAutomationFactory;
use org::allbinary::input::automation::module::InputAutomationActionInterface;
use org::allbinary::input::automation::module::InputAutomationModuleData;
use org::allbinary::input::automation::module::generic::configuration::GenericModuleConfigurationJPanel;
use org::allbinary::input::automation::module::generic::configuration::profile::GenericProfile;
use org::allbinary::input::automation::module::generic::constraints::NoImageComparatorConstraints;
use org::allbinary::input::automation::module::generic::constraints::NoMotionRectangleConstraints;
use org::allbinary::thread::RunnableInterface;
use org::allbinary::input::automation::module::generic::GenericInputAutomationAction;
use org::allbinary::input::automation::module::generic::GenericInputAutomationWorker;

1;

