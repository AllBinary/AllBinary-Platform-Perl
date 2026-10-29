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

package bundle::input::automation::InputAutomationBundleActivator;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::osgi::framework::BundleActivator','bundle::input::automation::InputAutomationBundleActivatorListenerInterface';

our $moduleManagementThread = undef;
our $bundleContext = undef;

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


sub getBundleContext {
    my ($class) = @_;
        return $bundle::input::automation::InputAutomationBundleActivator::bundleContext;
}


# throws Exception
sub start {
    my ($self, $bundleContext) = @_;
        try {
            $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, $self->{commonStrings}->{START});
            $bundleContext = $bundleContext;
            $bundle::input::automation::InputAutomationBundleActivator::moduleManagementThread = 'java::lang::Thread'->new('org::allbinary::input::automation::module::osgi::InputAutomationNewBundleRunnable'->new($self));
            $bundle::input::automation::InputAutomationBundleActivator::moduleManagementThread->start();
            'org::allbinary::input::automation::InputAutomationJFrame'->create($self);
        } catch ($e) {
            $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, $self->{commonStrings}->{START}, $e);
            die $e;
        }
}


# throws Exception
sub registerAsService {
    my ($self) = @_;
        'org::allbinary::osgi::OSGIActivatorUtil'->registerAsService($self->getBundleContext(), 'org::allbinary::input::automation::osgi::InputAutomationServiceFactory'->getInstance(), 'bundle::input::automation::module::configuration::InputAutomationConfigurationModuleChangeListener'->getName());
        'org::allbinary::osgi::OSGIActivatorUtil'->registerAsService($self->getBundleContext(), 'org::allbinary::input::automation::osgi::InputAutomationServiceFactory'->getInstance(), 'bundle::input::automation::robot::InputAutomationRobotChangeListener'->getName());
}


# throws Exception
sub useServices {
    my ($self) = @_;
        'org::allbinary::input::automation::robot::osgi::InputAutomationRobotServiceConsumer'->new($self->getBundleContext())->process();
        'org::allbinary::input::automation::module::osgi::InputAutomationModuleServiceConsumer'->new($self->getBundleContext())->process();
}


# throws Exception
sub stop {
    my ($self, $context) = @_;
        $self->{logUtil}->putF($self->{commonStrings}->{START}, $self, "stop");
        if (defined('org::allbinary::input::automation::InputAutomationJFrame'->getInstance())) {
            'org::allbinary::input::automation::InputAutomationJFrame'->destroy();
        } else {
            $self->{logUtil}->putF("Nothing to stop", $self, "stop");
        }
}

use org::osgi::framework::BundleActivator;
use org::osgi::framework::BundleContext;
use bundle::input::automation::module::configuration::InputAutomationConfigurationModuleChangeListener;
use bundle::input::automation::robot::InputAutomationRobotChangeListener;
use org::allbinary::input::automation::InputAutomationJFrame;
use org::allbinary::input::automation::module::osgi::InputAutomationModuleServiceConsumer;
use org::allbinary::input::automation::module::osgi::InputAutomationNewBundleRunnable;
use org::allbinary::input::automation::osgi::InputAutomationServiceFactory;
use org::allbinary::input::automation::robot::osgi::InputAutomationRobotServiceConsumer;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::osgi::OSGIActivatorUtil;
use org::allbinary::string::CommonStrings;
use bundle::input::automation::InputAutomationBundleActivatorListenerInterface;
use java::lang::Thread;

1;

