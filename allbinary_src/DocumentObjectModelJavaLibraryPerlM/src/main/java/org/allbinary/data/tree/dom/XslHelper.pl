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
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::data::tree::dom::XslHelper'->new() };


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
sub translate_j3_1 {
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
sub translate_j4 {
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
sub translateTemplate {
    my ($self, $templates, $xmlStreamSource) = @_;
        try {
            my $outputStream = 'java::io::ByteArrayOutputStream'->new();
            my $streamResult = 'javax::xml::transform::stream::StreamResult'->new($outputStream);
            $templates->newTransformer()->transform($xmlStreamSource, $streamResult);
            return $streamResult->getOutputStream()->toString();
        } catch ($e) {
            die $e;
        }
}


# throws Exception
sub translate_j2_1 {
    my ($self, $xsltStreamSource, $xmlDocument) = @_;
        try {
            my $outputStream = 'java::io::ByteArrayOutputStream'->new();
            return $self->translate($xsltStreamSource, 'javax::xml::transform::stream::StreamSource'->new('java::io::StringBufferInputStream'->new('org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($xmlDocument))), 'javax::xml::transform::stream::StreamResult'->new($outputStream))->toString();
        } catch ($e) {
            die $e;
        }
}


# throws Exception
sub translate_j2_2 {
    my ($self, $xsltStreamSource, $xmlStreamSource) = @_;
        try {
            my $outputStream = 'java::io::ByteArrayOutputStream'->new();
            return $self->translate($xsltStreamSource, $xmlStreamSource, 'javax::xml::transform::stream::StreamResult'->new($outputStream))->toString();
        } catch ($e) {
            die $e;
        }
}


# throws Exception
sub translate_j3_2 {
    my ($self, $resolver, $xsltStreamSource, $xmlStreamSource) = @_;
        try {
            my $outputStream = 'java::io::ByteArrayOutputStream'->new();
            return $self->translate($resolver, $xsltStreamSource, $xmlStreamSource, 'javax::xml::transform::stream::StreamResult'->new($outputStream))->toString();
        } catch ($e) {
            die $e;
        }
}

sub translate {
    my ($invocant, @arguments) = @_;
    return $invocant->translate_j3(@arguments) if scalar(@arguments) == 3;
    return $invocant->translate_j4(@arguments) if scalar(@arguments) == 4;
    return $invocant->translate_j2(@arguments) if scalar(@arguments) == 2;
    die "No method translate takes " . scalar(@arguments) . " arguments";
}

sub translate_j3 {
    my ($invocant, @arguments) = @_;
    return $invocant->translate_j3_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY')) && (!defined($arguments[2]) || (ref($arguments[2]) && ref($arguments[2]) ne 'ARRAY'));
    return $invocant->translate_j3_2(@arguments);
}

sub translate_j2 {
    my ($invocant, @arguments) = @_;
    return $invocant->translate_j2_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY'));
    return $invocant->translate_j2_2(@arguments);
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

use java::lang::Object ();
use java::lang::LazyStatic ();
# use java::io::ByteArrayOutputStream ();
use java::io::File ();
# use java::io::OutputStream ();
# use java::io::StringBufferInputStream ();
# use javax::xml::transform::Templates ();
# use javax::xml::transform::Transformer ();
# use javax::xml::transform::TransformerFactory ();
# use javax::xml::transform::URIResolver ();
# use javax::xml::transform::stream::StreamResult ();
# use javax::xml::transform::stream::StreamSource ();
use org::allbinary::data::tree::dom::document::XmlDocumentHelper ();
use org::w3c::dom::Document ();

1;

