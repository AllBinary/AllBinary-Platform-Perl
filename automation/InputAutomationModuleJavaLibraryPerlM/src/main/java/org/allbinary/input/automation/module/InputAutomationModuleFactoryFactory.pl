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

package org::allbinary::input::automation::module::InputAutomationModuleFactoryFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{hashMap} = undef;
    $self->{defaultListModelHelper} = undef;
    $self->{helpSetListenerInterface} = undef;
}


sub new {
    my ($class, $inputAutomationModuleConfigurations, $helpSetListenerInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{helpSetListenerInterface} = $helpSetListenerInterface;
        $self->{defaultListModelHelper} = 'org::allbinary::input::automation::module::DefaultListModelHelper'->new();
        $self->{hashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $collection = $inputAutomationModuleConfigurations->getHashMap()->values();
        my $iterator = $collection->iterator();
        my $inputAutomationModuleConfiguration = undef;
        while ($iterator->hasNext()) {
            $inputAutomationModuleConfiguration = $iterator->next();
            $self->add($inputAutomationModuleConfiguration);
        }
        $self->{defaultListModelHelper}->initDefaultModelList();
        $self->{logUtil}->putF("Loaded " . $self->{hashMap}->size() . "/" . $self->{defaultListModelHelper}->getListModel()->getSize() . " Input Automation Modules", $self, "Contructor");
    return $self;
}


sub add {
    my ($self, $inputAutomationModuleConfiguration) = @_;
        my $inputAutomationModuleInterface = $inputAutomationModuleConfiguration->getInputAutomationModuleInterface();
        $self->{hashMap}->put($inputAutomationModuleConfiguration->getName(), $inputAutomationModuleInterface);
        $self->{defaultListModelHelper}->add($inputAutomationModuleConfiguration->getName());
        my $helpSet = $inputAutomationModuleInterface->getHelpSet();
        if (!'org::allbinary::logic::java::help::JavaHelpSetNotifier'->isNotified($helpSet)) {
            my $helpSetEvent = 'javax::help::event::HelpSetEvent'->new($self, $helpSet, $javax::help::event::HelpSetEvent::HELPSET_ADDED);
            $self->{helpSetListenerInterface}->helpSetAdded($helpSetEvent);
        }
}


sub getListModel {
    my ($self) = @_;
        return $self->{defaultListModelHelper}->getListModel();
}


sub getInstance {
    my ($self, $moduleName) = @_;
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        $self->{logUtil}->putF("Getting Module: " . $moduleName, $self, $commonStrings->{GET_INSTANCE});
        my $inputAutomationModuleFactoryInterface = $self->{hashMap}->get($moduleName);
        if (!defined($inputAutomationModuleFactoryInterface)) {
            $self->{logUtil}->putF("Module: " . $moduleName . " was null", $self, $commonStrings->{GET_INSTANCE});
        }
        return $inputAutomationModuleFactoryInterface;
}

# use java::util::Collection;
use java::util::HashMap;
use java::util::Iterator;
# use javax::help::HelpSet;
# use javax::help::event::HelpSetEvent;
# use javax::help::event::HelpSetListener;
# use javax::swing::ListModel;
use org::allbinary::input::automation::module::configuration::InputAutomationModuleConfiguration;
use org::allbinary::input::automation::module::configuration::InputAutomationModuleConfigurations;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::java::help::JavaHelpSetNotifier;
use org::allbinary::string::CommonStrings;
use org::allbinary::input::automation::module::DefaultListModelHelper;

1;

