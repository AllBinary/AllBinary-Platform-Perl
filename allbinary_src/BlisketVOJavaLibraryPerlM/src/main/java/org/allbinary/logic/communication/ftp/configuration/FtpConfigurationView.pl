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

package org::allbinary::logic::communication::ftp::configuration::FtpConfigurationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{ftpConfigurationInterface} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of FtpConfigurationView takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setFtpConfigurationInterface('org::allbinary::logic::communication::ftp::configuration::FtpConfiguration'->new());
        my $chileNodeList = $node->getChildNodes();
        my $server = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($org::allbinary::logic::communication::ftp::configuration::FtpConfigurationData::SERVER, $chileNodeList);
        $self->getFtpConfigurationInterface()->setServer($server);
        my $userName = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($org::allbinary::logic::communication::ftp::configuration::FtpConfigurationData::USERNAME, $chileNodeList);
        $self->getFtpConfigurationInterface()->setUserName($userName);
        my $password = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($org::allbinary::logic::communication::ftp::configuration::FtpConfigurationData::PASSWORD, $chileNodeList);
        $self->getFtpConfigurationInterface()->setPassword($password);
        my $path = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($org::allbinary::logic::communication::ftp::configuration::FtpConfigurationData::PATH, $chileNodeList);
        $self->getFtpConfigurationInterface()->setPath($path);
    return $self;
}


sub _new1 {
    my ($class, $ftpConfigurationInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setFtpConfigurationInterface($ftpConfigurationInterface);
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $ftpConfigurationMapping = 'org::allbinary::logic::communication::ftp::configuration::FtpConfigurationMapping'->new($self->getFtpConfigurationInterface());
        my $hashMap = $ftpConfigurationMapping->toHashMap();
        my $node = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::logic::communication::ftp::configuration::FtpConfigurationData::NAME, $hashMap);
        return $node;
}


sub getFtpConfigurationInterface {
    my ($self) = @_;
        return $self->{ftpConfigurationInterface};
}


sub setFtpConfigurationInterface {
    my ($self, $ftpConfigurationInterface) = @_;
        $self->{ftpConfigurationInterface} = $ftpConfigurationInterface;
}

use java::util::HashMap;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::logic::communication::ftp::configuration::FtpConfiguration;
use org::allbinary::logic::communication::ftp::configuration::FtpConfigurationData;
use org::allbinary::logic::communication::ftp::configuration::FtpConfigurationMapping;

1;

