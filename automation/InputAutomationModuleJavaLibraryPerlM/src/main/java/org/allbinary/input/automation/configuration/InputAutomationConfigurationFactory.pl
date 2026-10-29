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

package org::allbinary::input::automation::configuration::InputAutomationConfigurationFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::input::automation::configuration::InputAutomationConfigurationFactory'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{inputAutomationConfiguration} = undef;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::input::automation::configuration::InputAutomationConfigurationFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub init {
    my ($self, $abeClientInformation) = @_;
        my $logUtil = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
        my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
        my $INPUT_AUTOMATION_CONFIGURATION = "InputAutomationConfiguration";
        my $file = 'org::allbinary::input::automation::configuration::InputAutomationConfiguration'->getFile();
        if ($file->isFile()) {
            $logUtil->putF("LoadingConfiguration", $INPUT_AUTOMATION_CONFIGURATION, $commonStrings->{INIT});
            my $jaxbContext = 'javax::xml::bind::JAXBContext'->newInstance('org::allbinary::input::automation::configuration::InputAutomationConfiguration');
            my $unmarshaller = $jaxbContext->createUnmarshaller();
            my $root = $unmarshaller->unmarshal('javax::xml::transform::stream::StreamSource'->new('java::io::FileInputStream'->new($file)), 'org::allbinary::input::automation::configuration::InputAutomationConfiguration');
            $self->{inputAutomationConfiguration} = $root->getValue();
            my $inputAutomationModuleConfigurationList = $self->{inputAutomationConfiguration}->getInputAutomationModuleConfigurationList();
            $logUtil->putF("isInstalled: " . $self->{inputAutomationConfiguration}->isInstalled() . " inputAutomationModuleConfigurationList: " . $inputAutomationModuleConfigurationList, $INPUT_AUTOMATION_CONFIGURATION, $commonStrings->{INIT});
            if (defined($inputAutomationModuleConfigurationList)) {
                my $size = $inputAutomationModuleConfigurationList->size();
                my $inputAutomationModuleConfiguration = undef;
                for (my $index = 0; $index < $size; $index++) {
                    $inputAutomationModuleConfiguration = $inputAutomationModuleConfigurationList->get($index);
                    $inputAutomationModuleConfiguration->init($abeClientInformation);
                }
            }
            $logUtil->putF("LoadedConfiguration", $INPUT_AUTOMATION_CONFIGURATION, $commonStrings->{INIT});
        } else {
            $logUtil->putF("New Configuration", $INPUT_AUTOMATION_CONFIGURATION, $commonStrings->{INIT});
            $self->{inputAutomationConfiguration} = 'org::allbinary::input::automation::configuration::InputAutomationConfiguration'->new();
        }
}

use java::io::File;
# use java::io::FileInputStream;
# use java::util::List;
# use javax::xml::bind::JAXBContext;
# use javax::xml::bind::JAXBElement;
# use javax::xml::bind::Unmarshaller;
# use javax::xml::transform::stream::StreamSource;
use org::allbinary::input::automation::module::configuration::InputAutomationModuleConfiguration;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::string::CommonStrings;
use org::allbinary::input::automation::configuration::InputAutomationConfiguration;

1;

