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

package org::allbinary::business::context::configuration::ContextConfigurationInterfaceFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::business::context::configuration::ContextConfigurationInterfaceFactory'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::business::context::configuration::ContextConfigurationInterfaceFactory::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $document) = @_;
        my $contextConfigurationData = 'org::allbinary::business::context::configuration::ContextConfigurationData'->getInstance();
        my $contextConfigurationNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($contextConfigurationData->{NAME}, $document->getChildNodes());
        return 'org::allbinary::business::context::configuration::ContextConfigurationView'->new($contextConfigurationNode)->getContextConfigurationInterface();
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub getInstance {
    my ($self, $contextName) = @_;
        my $abPath = 'org::allbinary::business::context::configuration::ContextConfigurationPathUtil'->getAbPath($contextName);
        my $contextConfigurationData = 'org::allbinary::business::context::configuration::ContextConfigurationData'->getInstance();
        my $documentString = 'org::allbinary::logic::control::crypt::file::CryptFileReader'->new($contextConfigurationData->{UNCRYPTED_EXTENSION}, $contextConfigurationData->{ENCRYPTED_EXTENSION})->get($abPath);
        my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($documentString);
        return $self->getInstance($document);
}

use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::logic::control::crypt::file::CryptFileReader;
use org::allbinary::logic::io::path::AbPath;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::context::configuration::ContextConfigurationData;
use org::allbinary::business::context::configuration::ContextConfigurationView;
use org::allbinary::business::context::configuration::ContextConfigurationPathUtil;

1;

