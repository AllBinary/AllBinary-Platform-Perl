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

package org::allbinary::input::automation::module::configuration::InputAutomationModuleConfigurations;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{hashMap} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    die "No constructor of InputAutomationModuleConfigurations takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $abeClientInformation, $file) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setHashMap('java::util::HashMap'->new());
        my $bytes = [(0) x (100000)];
        my $idFile = 'java::io::FileInputStream'->new($file);
        my $length = $idFile->read($bytes);
        my $data = pack("C*", @{$bytes});
        my $endIndex = rindex($data, ">");
        my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create(substr($data, 0, ($endIndex + 1) - (0)));
        my $nodeList = $document->getElementsByTagName($org::allbinary::input::automation::module::NewInputAutomationModulesData::NAME);
        if ($nodeList->getLength() > 0) {
            my $nameNodeList = $document->getElementsByTagName($org::allbinary::input::automation::module::InputAutomationModuleData::NAME);
            $self->{logUtil}->putF("Number Of Module(s) Specified: " . $nameNodeList->getLength(), $self, "Contructor");
            for (my $index = 0; $index < $nameNodeList->getLength(); $index++) {
                my $node = $nameNodeList->item($index);
                $self->add('org::allbinary::input::automation::module::configuration::InputAutomationModuleConfiguration'->new($abeClientInformation, $node));
            }
        }
    return $self;
}


sub _new2 {
    my ($class, $abeClientInformation, $document) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setHashMap('java::util::HashMap'->new());
        my $nameNodeList = $document->getElementsByTagName($org::allbinary::input::automation::module::InputAutomationModuleData::NAME);
        $self->{logUtil}->putF("Number Of Module(s) Specified: " . $nameNodeList->getLength(), $self, "Contructor");
        for (my $index = 0; $index < $nameNodeList->getLength(); $index++) {
            my $node = $nameNodeList->item($index);
            $self->add('org::allbinary::input::automation::module::configuration::InputAutomationModuleConfiguration'->new($abeClientInformation, $node));
        }
    return $self;
}


sub _new1 {
    my ($class, $inputAutomationModuleConfigurationList) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setHashMap('java::util::HashMap'->new());
        my $size = $inputAutomationModuleConfigurationList->size();
        my $inputAutomationModuleConfiguration = undef;
        for (my $index = 0; $index < $size; $index++) {
            $inputAutomationModuleConfiguration = $inputAutomationModuleConfigurationList->get($index);
            $self->add($inputAutomationModuleConfiguration);
        }
    return $self;
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setHashMap('java::util::HashMap'->new());
    return $self;
}


sub add {
    my ($self, $inputAutomationModuleConfiguration) = @_;
        $self->getHashMap()->put($inputAutomationModuleConfiguration->getClassName(), $inputAutomationModuleConfiguration);
}


sub remove {
    my ($self, $inputAutomationModuleConfiguration) = @_;
        $self->getHashMap()->remove($inputAutomationModuleConfiguration->getClassName());
}


sub getHashMap {
    my ($self) = @_;
        return $self->{hashMap};
}


sub setHashMap {
    my ($self, $hashMap) = @_;
        $self->{hashMap} = $hashMap;
}

use java::io::File;
# use java::io::FileInputStream;
use java::util::HashMap;
# use java::util::List;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::input::automation::module::InputAutomationModuleData;
use org::allbinary::input::automation::module::NewInputAutomationModulesData;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::input::automation::module::configuration::InputAutomationModuleConfiguration;

1;

