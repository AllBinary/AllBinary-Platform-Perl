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

package org::allbinary::input::automation::robot::osgi::InputAutomationRobotBundleActivator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::osgi::framework::BundleActivator';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{inputRobotInterface} = undef;
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
sub registerAsService {
    my ($self, $bundleContext) = @_;
        'org::allbinary::osgi::OSGIActivatorUtil'->registerAsService($bundleContext, $self->getServiceFactory(), 'bundle::input::automation::robot::InputAutomationRobotServiceInterface'->getName());
}


# throws Exception
sub getInputAutomationRobotChangeListener {
    my ($self, $context) = @_;
        my $serviceReference = $context->getServiceReference('bundle::input::automation::robot::InputAutomationRobotChangeListener'->getName());
        if (defined($serviceReference)) {
            my $inputAutomationRobotChangeListener = $context->getService($serviceReference);
            if (!defined($inputAutomationRobotChangeListener)) {
                die ("No Service For ServiceReference");
            }
            return $inputAutomationRobotChangeListener;
        } else {
            $self->{logUtil}->putF("No ServiceReference: " . 'bundle::input::automation::robot::InputAutomationRobotChangeListener'->getName(), $self, "getInputAutomationRobotChangeListener");
            return undef;
        }
}


sub addRobots {
    my ($self, $context) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "addRobots");
            my $inputAutomationRobotChangeListener = $self->getInputAutomationRobotChangeListener($context);
            if (defined($inputAutomationRobotChangeListener)) {
                for (my $index = 0; $index < scalar(@{$self->getInputRobotInterface()}); $index++) {
                    my $inputAutomationRobotChangeEvent = 'org::allbinary::input::automation::robot::osgi::InputAutomationRobotUtil'->getChangeEvent($self->getInputRobotInterface()->[$index]);
                    $inputAutomationRobotChangeListener->onAdd($inputAutomationRobotChangeEvent);
                }
            }
        } catch ($e) {
            $self->{logUtil}->putF($self->{commonStrings}->{EXCEPTION}, $self, "addModules");
        }
}


sub removeRobots {
    my ($self, $context) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "removeRobots");
            my $inputAutomationRobotChangeListener = $self->getInputAutomationRobotChangeListener($context);
            if (defined($inputAutomationRobotChangeListener)) {
                for (my $index = 0; $index < scalar(@{$self->getInputRobotInterface()}); $index++) {
                    my $inputAutomationRobotChangeEvent = 'org::allbinary::input::automation::robot::osgi::InputAutomationRobotUtil'->getChangeEvent($self->getInputRobotInterface()->[$index]);
                    $inputAutomationRobotChangeListener->onRemove($inputAutomationRobotChangeEvent);
                }
            }
        } catch ($e) {
            $self->{logUtil}->putF($self->{commonStrings}->{EXCEPTION}, $self, "removeRobots");
        }
}


# throws Exception
sub start {
    my ($self, $context) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{START});
        $self->addRobots($context);
        $self->registerAsService($context);
}


# throws Exception
sub stop {
    my ($self, $context) = @_;
        $self->{logUtil}->putF("Stop", $self, $self->{commonStrings}->{START});
        $self->removeRobots($context);
}


sub getServiceFactory {
    my ($self) = @_;
        return $self->{serviceFactory};
}


sub setServiceFactory {
    my ($self, $serviceObject) = @_;
        $self->{serviceFactory} = $serviceObject;
}


sub getInputRobotInterface {
    my ($self) = @_;
        return $self->{inputRobotInterface};
}


sub setInputRobotInterface {
    my ($self, $inputRobotInterface) = @_;
        $self->{inputRobotInterface} = $inputRobotInterface;
}

use org::osgi::framework::BundleActivator;
use org::osgi::framework::BundleContext;
use org::osgi::framework::ServiceFactory;
use org::osgi::framework::ServiceReference;
use bundle::input::automation::robot::InputAutomationRobotChangeListener;
use bundle::input::automation::robot::InputAutomationRobotServiceInterface;
use org::allbinary::input::automation::robot::InputRobotInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::osgi::OSGIActivatorUtil;
use org::allbinary::string::CommonStrings;
use org::allbinary::input::automation::robot::osgi::InputAutomationRobotUtil;

1;

