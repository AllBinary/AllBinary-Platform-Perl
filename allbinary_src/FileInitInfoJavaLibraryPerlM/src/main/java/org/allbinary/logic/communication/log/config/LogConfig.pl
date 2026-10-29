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

package org::allbinary::logic::communication::log::config::LogConfig;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{isEnabled} = undef;
    $self->{name} = undef;
    $self->{description} = undef;
    $self->{path} = undef;
    $self->{fileName} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new4(@arguments) if scalar(@arguments) == 4;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of LogConfig takes " . scalar(@arguments) . " arguments";
}


sub _new4 {
    my ($class, $aName, $aDescription, $aPath, $aFileName) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{isEnabled} = 0;
        $self->{name} = $aName;
        $self->{description} = $aDescription;
        $self->{path} = $aPath;
        $self->{fileName} = $aFileName;
    return $self;
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $enabledValueNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode('org::allbinary::business::entry::EntryData'->getInstance()->{ENABLE}, $node->getChildNodes());
        my $isEnabledString = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($enabledValueNode);
        $self->{isEnabled} = 'org::allbinary::logic::java::bool::BooleanUtil'->getInstance()->getFromString($isEnabledString);
        my $logConfigData = 'org::allbinary::logic::communication::log::config::LogConfigData'->getInstance();
        my $nameValueNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($logConfigData->{NAME}, $node->getChildNodes());
        $self->{name} = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($nameValueNode);
        my $descriptionValueNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($logConfigData->{DESCRIPTION}, $node->getChildNodes());
        $self->{description} = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($descriptionValueNode);
        my $fileValueNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($logConfigData->{FILE}, $node->getChildNodes());
        $self->{fileName} = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($fileValueNode);
    return $self;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub isEnabled {
    my ($self) = @_;
        return $self->{isEnabled};
}


sub enable {
    my ($self) = @_;
        $self->{isEnabled} = 1;
}


sub disable {
    my ($self) = @_;
        $self->{isEnabled} = 0;
}


sub getDescription {
    my ($self) = @_;
        return $self->{description};
}


sub getFileName {
    my ($self) = @_;
        return $self->{fileName};
}


sub setName {
    my ($self, $value) = @_;
        $self->{name} = $value;
}


sub setDescription {
    my ($self, $value) = @_;
        $self->{description} = $value;
}


sub setPath {
    my ($self, $value) = @_;
        $self->{path} = $value;
}


sub setFileName {
    my ($self, $value) = @_;
        $self->{fileName} = $value;
}


# throws Exception
sub getDoc {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getWebappPath());
        $stringBuffer->append('org::allbinary::globals::PATH_GLOBALS'->getInstance()->{INIT_PATH});
        $stringBuffer->append($self->getFileName());
        my $file = 'org::allbinary::logic::io::file::AbFile'->createAbFile($stringBuffer->toString());
        my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create('org::allbinary::logic::io::AbFileLocalInputStream'->new($file));
        return $document;
}


# throws Exception
sub getTypeVector {
    my ($self) = @_;
        my $logKeyVector = 'org::allbinary::util::BasicArrayListD'->new();
        my $document = $self->getDoc();
        my $logConfigTypesNodeList = $document->getElementsByTagName('org::allbinary::logic::communication::log::config::type::LogConfigTypesData'->getInstance()->{NAME});
        my $logConfigTypesNode = $logConfigTypesNodeList->item(0);
        my $logConfigTypeNodeVector = 'org::allbinary::data::tree::dom::DomSearchHelper'->getAllNodes('org::allbinary::logic::communication::log::config::type::LogConfigTypeData'->getInstance()->{NAME}, $logConfigTypesNode->getChildNodes());
        my $size = $logConfigTypeNodeVector->size();
        for (my $i = 0; $i < $size; $i++) {
            my $node = $logConfigTypeNodeVector->get($i);
            my $logType = 'org::allbinary::logic::communication::log::config::type::LogConfigTypes'->getInstance($node);
            $logKeyVector->add($logType);
        }
        return $logKeyVector;
}

use org::allbinary::business::entry::EntryData;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::globals::PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::log::config::type::LogConfigType;
use org::allbinary::logic::communication::log::config::type::LogConfigTypeData;
use org::allbinary::logic::communication::log::config::type::LogConfigTypes;
use org::allbinary::logic::communication::log::config::type::LogConfigTypesData;
use org::allbinary::logic::io::AbFileLocalInputStream;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::java::bool::BooleanUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::logic::communication::log::config::LogConfigData;

1;

