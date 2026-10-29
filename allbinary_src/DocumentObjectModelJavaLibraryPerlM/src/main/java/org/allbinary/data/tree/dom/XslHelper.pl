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

#import org.allbinary.data.tree.dom.document.DomDocumentHelper;
package org::allbinary::data::tree::dom::XslHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::data::tree::dom::XslHelper'->new();


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::data::tree::dom::XslHelper::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub translate {
    my ($self, $xsltStreamSource, $xmlStreamSource, $streamResult) = @_;
        try {
            my $transformerFactory = 'javax::xml::transform::TransformerFactory'->newInstance();
            my $transformer = $transformerFactory->newTransformer($xsltStreamSource);
            $transformer->transform($xmlStreamSource, $streamResult);
            return $streamResult->getOutputStream();
        } catch ($e) {
            die $e;
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub translate {
    my ($self, $resolver, $xsltStreamSource, $xmlStreamSource, $streamResult) = @_;
        try {
            my $tFactory = 'javax::xml::transform::TransformerFactory'->newInstance();
            $tFactory->setURIResolver($resolver);
            my $transformer = $tFactory->newTransformer($xsltStreamSource);
            $transformer->transform($xmlStreamSource, $streamResult);
            return $streamResult->getOutputStream();
        } catch ($e) {
            die $e;
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub translate {
    my ($self, $xsltStreamSource, $xmlDocument) = @_;
        try {
            my $outputStream = 'java::io::ByteArrayOutputStream'->new();
            return $self->translate($xsltStreamSource, 'javax::xml::transform::stream::StreamSource'->new('java::io::StringBufferInputStream'->new('org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($xmlDocument))), 'javax::xml::transform::stream::StreamResult'->new($outputStream))->toString();
        } catch ($e) {
            die $e;
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub translate {
    my ($self, $xsltStreamSource, $xmlStreamSource) = @_;
        try {
            my $outputStream = 'java::io::ByteArrayOutputStream'->new();
            return $self->translate($xsltStreamSource, $xmlStreamSource, 'javax::xml::transform::stream::StreamResult'->new($outputStream))->toString();
        } catch ($e) {
            die $e;
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub translate {
    my ($self, $resolver, $xsltStreamSource, $xmlStreamSource) = @_;
        try {
            my $outputStream = 'java::io::ByteArrayOutputStream'->new();
            return $self->translate($resolver, $xsltStreamSource, $xmlStreamSource, 'javax::xml::transform::stream::StreamResult'->new($outputStream))->toString();
        } catch ($e) {
            die $e;
        }
}


# throws Exception
sub export {
    my ($self, $outputFile, $xsltFilePath, $xmlDocument) = @_;
        try {
            $outputFile->createNewFile();
            $self->translate('javax::xml::transform::stream::StreamSource'->new($xsltFilePath), 'javax::xml::transform::stream::StreamSource'->new('java::io::StringBufferInputStream'->new('org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($xmlDocument))), 'javax::xml::transform::stream::StreamResult'->new($outputFile));
        } catch ($e) {
            die $e;
        }
}

# use java::io::ByteArrayOutputStream;
use java::io::File;
# use java::io::OutputStream;
# use java::io::StringBufferInputStream;
# use javax::xml::transform::Transformer;
# use javax::xml::transform::TransformerFactory;
# use javax::xml::transform::URIResolver;
# use javax::xml::transform::stream::StreamResult;
# use javax::xml::transform::stream::StreamSource;
use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::w3c::dom::Document;

1;

