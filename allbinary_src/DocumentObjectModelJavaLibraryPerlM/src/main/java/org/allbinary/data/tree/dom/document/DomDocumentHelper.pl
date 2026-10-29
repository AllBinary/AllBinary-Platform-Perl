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

package org::allbinary::data::tree::dom::document::DomDocumentHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub init {
    my ($class) = @_;
        'java::lang::System'->setProperty("jdk.xml.maxElementDepth", "0");
        'java::lang::System'->setProperty("jdk.xml.xpathExprOpLimit", "0");
        'java::lang::System'->setProperty("jdk.xml.xpathTotalOpLimit", "0");
        my $LIMIT = "500000";
        'java::lang::System'->setProperty("jdk.xml.maxGeneralEntitySizeLimit", $LIMIT);
        'java::lang::System'->setProperty("jdk.xml.totalEntitySizeLimit", $LIMIT);
}


sub create {
    my ($class) = @_;
        try {
            my $factory = 'javax::xml::parsers::DocumentBuilderFactory'->newInstance();
            my $builder = $factory->newDocumentBuilder();
            my $document = $builder->newDocument();
            return $document;
        } catch ($e) {
            return undef;
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub create {
    my ($class, $inputStream) = @_;
        try {
            my $factory = 'javax::xml::parsers::DocumentBuilderFactory'->newInstance();
            my $builder = $factory->newDocumentBuilder();
            my $document = $builder->parse($inputStream);
            return $document;
        } catch ($e) {
            die $e;
        }
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub create {
    my ($class, $xmlString) = @_;
        try {
            my $factory = 'javax::xml::parsers::DocumentBuilderFactory'->newInstance();
            my $builder = $factory->newDocumentBuilder();
            my $document = $builder->parse('java::io::StringBufferInputStream'->new($xmlString));
            return $document;
        } catch ($e) {
            die $e;
        }
}

# use java::io::InputStream;
# use java::io::StringBufferInputStream;
# use javax::xml::parsers::DocumentBuilder;
# use javax::xml::parsers::DocumentBuilderFactory;
use org::w3c::dom::Document;
use java::lang::System;

1;

