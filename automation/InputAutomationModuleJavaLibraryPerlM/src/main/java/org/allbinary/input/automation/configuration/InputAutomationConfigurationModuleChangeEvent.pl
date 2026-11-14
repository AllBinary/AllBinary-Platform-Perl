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

package org::allbinary::input::automation::configuration::InputAutomationConfigurationModuleChangeEvent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'java::lang::Object';


sub _init_fields {
    my ($self) = @_;
    $self->{inputAutomationModuleConfiguration} = undef;
}


sub new {
    my ($class, $inputAutomationModuleConfiguration) = @_;
    my $self = bless({}, $class);
    _init_fields($self);
        $self->setInputAutomationModuleConfiguration($inputAutomationModuleConfiguration);
    return $self;
}


sub getInputAutomationModuleConfiguration {
    my ($self) = @_;
        return $self->{inputAutomationModuleConfiguration};
}


sub setInputAutomationModuleConfiguration {
    my ($self, $inputAutomationModuleConfiguration) = @_;
        $self->{inputAutomationModuleConfiguration} = $inputAutomationModuleConfiguration;
}

use java::lang::Object ();
use org::allbinary::input::automation::module::configuration::InputAutomationModuleConfiguration ();

1;

