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

package org::allbinary::input::automation::osgi::InputAutomationServiceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::osgi::framework::ServiceFactory';

our $inputAutomationServiceFactory = 'org::allbinary::input::automation::osgi::InputAutomationServiceFactory'->new();

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


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::automation::osgi::InputAutomationServiceFactory::inputAutomationServiceFactory;
}


sub getService {
    my ($self, $bundle, $registration) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "getService");
        return 'org::allbinary::input::automation::InputAutomationJFrame'->getInstance();
}


sub ungetService {
    my ($self, $bundle, $registration, $service) = @_;
}

use org::osgi::framework::Bundle;
use org::osgi::framework::ServiceFactory;
use org::osgi::framework::ServiceRegistration;
use org::allbinary::input::automation::InputAutomationJFrame;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;

1;

