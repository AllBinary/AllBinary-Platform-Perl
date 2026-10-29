# 
# AllBinary Open License Version 1 
# Copyright (c) 2022 AllBinary 
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

package org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{INDENT_NUMBER} = "indent-number";
    $self->{transformer} = undef;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::data::tree::dom::document::XmlDocumentHelper::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->init(4, 1);
    return $self;
}


sub init {
    my ($self, $indent, $ignoreDeclaration) = @_;
        try {
            my $booleanFactory = 'org::allbinary::logic::java::bool::BooleanFactory'->getInstance();
            my $transformerFactory = 'javax::xml::transform::TransformerFactory'->newInstance();
            $transformerFactory->setAttribute($self->{INDENT_NUMBER}, $indent);
            $self->{transformer} = $transformerFactory->newTransformer();
            $self->{transformer}->setOutputProperty($javax::xml::transform::OutputKeys::ENCODING, 'org::allbinary::logic::java::characters::CharacterSetData'->getInstance()->{UTF_8});
            $self->{transformer}->setOutputProperty($javax::xml::transform::OutputKeys::OMIT_XML_DECLARATION, ($ignoreDeclaration ? $booleanFactory->{YES} : $booleanFactory->{NO}));
            $self->{transformer}->setOutputProperty($javax::xml::transform::OutputKeys::INDENT, $booleanFactory->{YES});
        } catch ($e) {
            my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
            $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, $commonStrings->{INIT}, $e);
        }
}


# throws Exception
sub format {
    my ($self, $xmlString) = @_;
        my $src = 'org::xml::sax::InputSource'->new('java::io::StringReader'->new($xmlString));
        my $document = 'javax::xml::parsers::DocumentBuilderFactory'->newInstance()->newDocumentBuilder()->parse($src);
        my $out = 'java::io::StringWriter'->new();
        $self->{transformer}->transform('javax::xml::transform::dom::DOMSource'->new($document), 'javax::xml::transform::stream::StreamResult'->new($out));
        return $out->toString();
}


# throws Exception
sub toString {
    my ($class, $document) = @_;
        try {
            my $domSource = 'javax::xml::transform::dom::DOMSource'->new($document);
            my $byteArrayOutputStream = 'java::io::ByteArrayOutputStream'->new();
            my $streamResult = 'javax::xml::transform::stream::StreamResult'->new($byteArrayOutputStream);
            my $copyTransformerFactory = 'javax::xml::transform::TransformerFactory'->newInstance();
            my $copyTransformer = $copyTransformerFactory->newTransformer();
            $copyTransformer->transform($domSource, $streamResult);
            return $byteArrayOutputStream->toString();
        } catch ($e) {
            die $e;
        }
}

# use java::io::ByteArrayOutputStream;
# use java::io::StringReader;
# use java::io::StringWriter;
# use java::io::Writer;
# use javax::xml::parsers::DocumentBuilderFactory;
# use javax::xml::transform::OutputKeys;
# use javax::xml::transform::Transformer;
# use javax::xml::transform::TransformerFactory;
# use javax::xml::transform::dom::DOMSource;
# use javax::xml::transform::stream::StreamResult;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::java::bool::BooleanFactory;
use org::allbinary::logic::java::characters::CharacterSetData;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::xml::sax::InputSource;

1;

