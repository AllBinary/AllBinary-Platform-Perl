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

package org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActions;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface','org::allbinary::data::tree::dom::document::mapping::DomDocumentMappingInterface';

our $DEFAULT_PROFILE_ACTIONS_PATH = $org::allbinary::input::automation::module::generic::configuration::profile::GenericProfiles::DEFAULT_PROFILES_PATH . "actions/";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonFileStrings} = 'org::allbinary::logic::io::file::CommonDataFileStrings'->getInstance();
    $self->{name} = undef;
    $self->{genericProfileActionsJPanel} = undef;
    $self->{actionsDefaultListModelHelper} = undef;
    $self->{hashMap} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    die "No constructor of GenericProfileActions takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $genericProfileActionsJPanel, $name) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setName($name);
        $self->init($genericProfileActionsJPanel);
        $self->load();
    return $self;
}


sub _new3 {
    my ($class, $genericProfileActionsJPanel, $abPath, $name) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setName($name);
        $self->init($genericProfileActionsJPanel);
        $self->load();
    return $self;
}


sub _new3 {
    my ($class, $genericProfileActionsJPanel, $fileInputStream, $name) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setName($name);
        $self->init($genericProfileActionsJPanel);
        $self->fileInit($fileInputStream);
    return $self;
}


# throws Exception
sub init {
    my ($self, $genericProfileActionsJPanel) = @_;
        $self->setGenericProfileActionsJPanel($genericProfileActionsJPanel);
        $self->{actionsDefaultListModelHelper} = 'org::allbinary::input::automation::module::DefaultListModelHelper'->new();
        $self->setHashMap('java::util::HashMap'->new());
}


# throws Exception
sub save {
    my ($self) = @_;
        my $idFile = 'java::io::FileOutputStream'->new($org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActions::DEFAULT_PROFILE_ACTIONS_PATH . $self->getName() . $self->{commonFileStrings}->{_XML});
        my $idOutData = 'java::io::DataOutputStream'->new($idFile);
        $idOutData->writeBytes('org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($self->toXmlDoc()));
}


sub getFile {
    my ($self, $name) = @_;
        my $fileName = $DEFAULT_PROFILE_ACTIONS_PATH . $name . $self->{commonFileStrings}->{_XML};
        return 'java::io::File'->new($fileName);
}


# throws Exception
sub load {
    my ($self) = @_;
        my $file = $self->getFile($self->getName());
        if ($file->isFile()) {
            my $idFile = 'java::io::FileInputStream'->new($file);
            $self->fileInit($idFile);
        } else {
            $self->{logUtil}->putF("No Profile: " . $file->getAbsolutePath(), $self, "Contructor");
        }
}


# throws Exception
sub fileInit {
    my ($self, $fileInputStream) = @_;
        my $bytes = [(0) x (100000)];
        my $length = $fileInputStream->read($bytes);
        my $data = pack("C*", @{$bytes});
        my $endIndex = rindex($data, ">");
        my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create(substr($data, 0, ($endIndex + 1) - (0)));
        my $nameNodeList = $document->getElementsByTagName($org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionsData::NAME);
        $self->{logUtil}->putF("Number Of Profiles Specified: " . $nameNodeList->getLength(), $self, "Contructor");
        for (my $index = 0; $index < $nameNodeList->getLength(); $index++) {
            my $node = $nameNodeList->item($index);
            my $nodeList = $node->getChildNodes();
            if (defined($nodeList)) {
                $self->initActions($nodeList);
            } else {
                die ($org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionData::NAME . " Name Node Node Children");
            }
        }
        $self->{logUtil}->putF("Loaded: " . $self->getHashMap()->size() . " Configuration Profile Action(s)", $self, "Contructor");
        $self->getDefaultListModelHelper()->initDefaultModelList();
}


# throws Exception
sub initActions {
    my ($self, $nodeList) = @_;
        for (my $index = 0; $index < $nodeList->getLength(); $index++) {
            my $actionNode = $nodeList->item($index);
            if (defined($actionNode)) {
                my $genericConfigurationProfileAction = 'org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileAction'->new($self->getGenericProfileActionsJPanel()->getGenericProfileActionJPanel(), $actionNode);
                $self->getHashMap()->put($genericConfigurationProfileAction->getName(), $genericConfigurationProfileAction);
                $self->getDefaultListModelHelper()->add($genericConfigurationProfileAction->getName());
            } else {
                die ($org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionData::NAME . " Node Null");
            }
        }
}


sub getDefaultListModelHelper {
    my ($self) = @_;
        return $self->{actionsDefaultListModelHelper};
}


sub getAction {
    my ($self, $string) = @_;
        return $self->getHashMap()->get($string);
}


# throws Exception
sub add {
    my ($self, $name) = @_;
        my $genericProfileAction = 'org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileAction'->new($name);
        $self->getHashMap()->put($genericProfileAction->getName(), $genericProfileAction);
        $self->getDefaultListModelHelper()->add($genericProfileAction->getName());
        $self->getDefaultListModelHelper()->initDefaultModelList();
        $self->save();
}


# throws Exception
sub remove {
    my ($self, $name) = @_;
        $self->getHashMap()->remove($name);
        $self->getDefaultListModelHelper()->remove($name);
        $self->getDefaultListModelHelper()->initDefaultModelList();
        $self->save();
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $self->{logUtil}->putF("HashMap: " . $hashMap->toString(), $self, "toHashMap()");
        return $hashMap;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = $document->createElement($org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionsData::NAME);
        my $set = $self->getHashMap()->keySet();
        my $actionNameArray = $set->toArray();
        my $size = scalar(@{$actionNameArray});
        for (my $index = 0; $index < $size; $index++) {
            my $nextActionName = $actionNameArray->[$index];
            my $nextGenericProfileAction = $self->getAction($nextActionName);
            $node->appendChild($nextGenericProfileAction->toXmlNode($document));
        }
        return $node;
}


# throws Exception
sub toXmlDoc {
    my ($self) = @_;
        my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create();
        my $node = $self->toXmlNode($document);
        $document->appendChild($node);
        return $document;
}


sub getGenericProfileActionsJPanel {
    my ($self) = @_;
        return $self->{genericProfileActionsJPanel};
}


sub setGenericProfileActionsJPanel {
    my ($self, $genericProfileActionsJPanel) = @_;
        $self->{genericProfileActionsJPanel} = $genericProfileActionsJPanel;
}


sub getHashMap {
    my ($self) = @_;
        return $self->{hashMap};
}


sub setHashMap {
    my ($self, $hashMap) = @_;
        $self->{hashMap} = $hashMap;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub setName {
    my ($self, $name) = @_;
        $self->{name} = $name;
}

# use java::io::DataOutputStream;
use java::io::File;
# use java::io::FileInputStream;
# use java::io::FileOutputStream;
use java::util::HashMap;
# use java::util::Set;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::data::tree::dom::document::mapping::DomDocumentMappingInterface;
use org::allbinary::input::automation::module::DefaultListModelHelper;
use org::allbinary::input::automation::module::generic::configuration::profile::GenericProfiles;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::io::file::CommonDataFileStrings;
use org::allbinary::logic::io::path::AbPath;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionsData;
use org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionData;
use org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileAction;

1;

