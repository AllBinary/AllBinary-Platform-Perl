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

package org::allbinary::business::context::configuration::ContextConfigurationDomDocumentMapping;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::document::mapping::DomDocumentMappingInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{contextConfigurationInterface} = undef;
}


sub new {
    my ($class, $contextConfigurationInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{contextConfigurationInterface} = $contextConfigurationInterface;
    return $self;
}


# throws Exception
sub toXmlDoc {
    my ($self) = @_;
        my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create();
        my $node = 'org::allbinary::business::context::configuration::ContextConfigurationView'->new($self->{contextConfigurationInterface})->toXmlNode($document);
        $document->appendChild($node);
        return $document;
}


# throws Exception
sub toDomDocumentString {
    my ($self) = @_;
        return 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($self->toXmlDoc());
}

use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::data::tree::dom::document::mapping::DomDocumentMappingInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::context::configuration::ContextConfigurationView;

1;

