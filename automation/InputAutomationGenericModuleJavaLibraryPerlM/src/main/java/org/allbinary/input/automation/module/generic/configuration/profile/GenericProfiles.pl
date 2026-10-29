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

package org::allbinary::input::automation::module::generic::configuration::profile::GenericProfiles;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface','org::allbinary::data::tree::dom::document::mapping::DomDocumentMappingInterface';

our $DEFAULT_PROFILES_PATH = "./modules/configs/profiles/";
our $DEFAULT_PROFILE_ACTIONS_PATH = $org::allbinary::input::automation::module::generic::configuration::profile::GenericProfiles::DEFAULT_PROFILES_PATH . "actions/";
our $DEFAULT_FILE = $org::allbinary::input::automation::module::generic::configuration::profile::GenericProfiles::DEFAULT_PROFILES_PATH . "profiles.xml";

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{hashMap} = undef;
    $self->{profilesDefaultListModelHelper} = undef;
    $self->{fileName} = undef;
}


sub new {
    my ($class, $fileName) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{fileName} = $fileName;
        $self->{profilesDefaultListModelHelper} = 'org::allbinary::input::automation::module::DefaultListModelHelper'->new();
        $self->{hashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        if ('java::io::File'->new($fileName)->isFile()) {
            my $bytes = [(0) x (100000)];
            my $idFile = 'java::io::FileInputStream'->new($fileName);
            my $length = $idFile->read($bytes);
            my $data = pack("C*", @{$bytes});
            my $endIndex = rindex($data, ">");
            my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create(substr($data, 0, ($endIndex + 1) - (0)));
            my $nodeList = $document->getElementsByTagName($org::allbinary::input::automation::module::generic::configuration::profile::GenericProfilesData::NAME);
            $self->{logUtil}->putF("Number Of Profiles Specified: " . $nodeList->getLength(), $self, "Contructor");
            if (defined($nodeList)) {
                $self->initProfiles($nodeList->item(0));
            } else {
                die ($org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionData::NAME . " Name Node Node Children");
            }
            $self->{logUtil}->putF("Loaded: " . $self->{hashMap}->size() . " Configuration Profile Actions", $self, "Contructor");
        } else {
            $self->{logUtil}->putF("No Generic Profile: " . $fileName, $self, "Contructor");
        }
        $self->getDefaultListModelHelper()->initDefaultModelList();
    return $self;
}


# throws Exception
sub initProfiles {
    my ($self, $node) = @_;
        my $nodeList = $node->getChildNodes();
        for (my $index = 0; $index < $nodeList->getLength(); $index++) {
            my $profileNameNode = $nodeList->item($index);
            if ($profileNameNode->getNodeName()->compareTo($org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileData::NAME) == 0) {
                my $genericProfile = 'org::allbinary::input::automation::module::generic::configuration::profile::GenericProfile'->new($profileNameNode);
                $self->{hashMap}->put($genericProfile->getName(), $genericProfile);
                $self->getDefaultListModelHelper()->add($genericProfile->getName());
            }
        }
}


sub getDefaultListModelHelper {
    my ($self) = @_;
        return $self->{profilesDefaultListModelHelper};
}


# throws Exception
sub get {
    my ($self, $name) = @_;
        my $genericProfile = $self->{hashMap}->get($name);
        if (!defined($genericProfile)) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->putF("No Generic Profile Named: " . $name . " availability was: " . $self->{hashMap}, $self, $commonStrings->{GET});
        }
        return $genericProfile;
}


# throws Exception
sub add {
    my ($self, $name) = @_;
        $self->{hashMap}->put($name, 'org::allbinary::input::automation::module::generic::configuration::profile::GenericProfile'->new($name));
        $self->getDefaultListModelHelper()->add($name);
        $self->getDefaultListModelHelper()->initDefaultModelList();
        $self->save();
}


# throws Exception
sub remove {
    my ($self, $name) = @_;
        $self->{hashMap}->remove($name);
        $self->getDefaultListModelHelper()->remove($name);
        $self->getDefaultListModelHelper()->initDefaultModelList();
        $self->save();
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = $document->createElement($org::allbinary::input::automation::module::generic::configuration::profile::GenericProfilesData::NAME);
        my $set = $self->{hashMap}->keySet();
        my $nameArray = $set->toArray();
        my $size = scalar(@{$nameArray});
        for (my $index = 0; $index < $size; $index++) {
            my $genericProfile = $self->{hashMap}->get($nameArray->[$index]);
            $node->appendChild($genericProfile->toXmlNode($document));
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


# throws Exception
sub save {
    my ($self) = @_;
        my $idFile = 'java::io::FileOutputStream'->new($self->{fileName});
        my $idOutData = 'java::io::DataOutputStream'->new($idFile);
        my $documentString = 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($self->toXmlDoc());
        $idOutData->writeBytes($documentString);
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
use org::allbinary::input::automation::module::generic::configuration::profile::actions::GenericProfileActionData;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::input::automation::module::generic::configuration::profile::GenericProfilesData;
use org::allbinary::input::automation::module::generic::configuration::profile::GenericProfileData;
use org::allbinary::input::automation::module::generic::configuration::profile::GenericProfile;

1;

