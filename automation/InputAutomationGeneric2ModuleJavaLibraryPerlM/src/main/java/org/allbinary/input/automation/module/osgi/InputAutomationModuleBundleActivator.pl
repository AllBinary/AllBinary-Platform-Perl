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

package org::allbinary::input::automation::module::osgi::InputAutomationModuleBundleActivator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::osgi::framework::BundleActivator';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{inputAutomationModuleInterface} = undef;
    $self->{serviceFactory} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->init();
    return $self;
}


# throws Exception
sub init {
    my ($self) = @_;
        die ("RuntimeException");
}


# throws Exception
sub getInputAutomationConfigurationModuleChangeListener {
    my ($self, $context) = @_;
        my $serviceReference = $context->getServiceReference('bundle::input::automation::module::configuration::InputAutomationConfigurationModuleChangeListener'->getName());
        if (defined($serviceReference)) {
            my $inputAutomationConfigurationModuleChangeListener = $context->getService($serviceReference);
            if (!defined($inputAutomationConfigurationModuleChangeListener)) {
                die ("No Service For ServiceReference");
            }
            return $inputAutomationConfigurationModuleChangeListener;
        } else {
            $self->{logUtil}->putF("No ServiceReference: " . 'bundle::input::automation::module::configuration::InputAutomationConfigurationModuleChangeListener'->getName(), $self, "addModules");
            return undef;
        }
}


sub addModules {
    my ($self, $context) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "addModules");
            my $inputAutomationConfigurationModuleChangeListener = $self->getInputAutomationConfigurationModuleChangeListener($context);
            if (defined($inputAutomationConfigurationModuleChangeListener)) {
                for (my $index = 0; $index < scalar(@{$self->getInputAutomationModuleInterface()}); $index++) {
                    my $inputAutomationConfigurationModuleChangeEvent = 'org::allbinary::input::automation::configuration::InputAutomationConfigurationUtil'->getChangeEvent($self->getInputAutomationModuleInterface()->[$index]);
                    $inputAutomationConfigurationModuleChangeListener->onAdd($inputAutomationConfigurationModuleChangeEvent);
                }
            }
        } catch ($e) {
            $self->{logUtil}->putF($self->{commonStrings}->{EXCEPTION}, $self, "addModules");
        }
}


# throws Exception
sub registerAsService {
    my ($self, $bundleContext) = @_;
        'org::allbinary::osgi::OSGIActivatorUtil'->registerAsService($bundleContext, $self->getServiceFactory(), 'bundle::input::automation::module::InputAutomationModuleServiceInterface'->getName());
}


sub removeModules {
    my ($self, $context) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "removeModules");
            my $inputAutomationConfigurationModuleChangeListener = $self->getInputAutomationConfigurationModuleChangeListener($context);
            if (defined($inputAutomationConfigurationModuleChangeListener)) {
                for (my $index = 0; $index < scalar(@{$self->getInputAutomationModuleInterface()}); $index++) {
                    my $inputAutomationConfigurationModuleChangeEvent = 'org::allbinary::input::automation::configuration::InputAutomationConfigurationUtil'->getChangeEvent($self->getInputAutomationModuleInterface()->[$index]);
                    $inputAutomationConfigurationModuleChangeListener->onRemove($inputAutomationConfigurationModuleChangeEvent);
                }
            }
        } catch ($e) {
            $self->{logUtil}->putF($self->{commonStrings}->{EXCEPTION}, $self, "removeModules");
        }
}


# throws Exception
sub start {
    my ($self, $context) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{START});
        $self->addModules($context);
        $self->registerAsService($context);
}


# throws Exception
sub stop {
    my ($self, $context) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "stop");
        $self->removeModules($context);
}


sub getInputAutomationModuleInterface {
    my ($self) = @_;
        return $self->{inputAutomationModuleInterface};
}


sub setInputAutomationModuleInterface {
    my ($self, $inputAutomationModuleInterface) = @_;
        $self->{inputAutomationModuleInterface} = $inputAutomationModuleInterface;
}


sub getServiceFactory {
    my ($self) = @_;
        return $self->{serviceFactory};
}


sub setServiceFactory {
    my ($self, $serviceObject) = @_;
        $self->{serviceFactory} = $serviceObject;
}

use org::osgi::framework::BundleActivator;
use org::osgi::framework::BundleContext;
use org::osgi::framework::ServiceFactory;
use org::osgi::framework::ServiceReference;
use bundle::input::automation::module::InputAutomationModuleServiceInterface;
use bundle::input::automation::module::configuration::InputAutomationConfigurationModuleChangeListener;
use org::allbinary::input::automation::configuration::InputAutomationConfigurationModuleChangeEvent;
use org::allbinary::input::automation::configuration::InputAutomationConfigurationUtil;
use org::allbinary::input::automation::module::InputAutomationModuleFactoryInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::osgi::OSGIActivatorUtil;
use org::allbinary::string::CommonStrings;

1;

