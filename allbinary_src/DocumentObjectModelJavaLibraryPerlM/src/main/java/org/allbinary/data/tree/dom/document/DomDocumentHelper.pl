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
use parent -norequire,'java::lang::Object';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub init {
    my ($class) = @_;
        my $commonPhoneStrings = 'org::allbinary::string::CommonPhoneStrings'->getInstance();
        'java::lang::System'->setProperty("jdk.xml.maxElementDepth", $commonPhoneStrings->{ZERO});
        'java::lang::System'->setProperty("jdk.xml.xpathExprOpLimit", $commonPhoneStrings->{ZERO});
        'java::lang::System'->setProperty("jdk.xml.xpathTotalOpLimit", $commonPhoneStrings->{ZERO});
        my $LIMIT = "500000";
        'java::lang::System'->setProperty("jdk.xml.maxGeneralEntitySizeLimit", $LIMIT);
        'java::lang::System'->setProperty("jdk.xml.totalEntitySizeLimit", $LIMIT);
}


sub create_j0 {
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
sub create_j1_1 {
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
sub create_j1_2 {
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

sub create {
    my ($invocant, @arguments) = @_;
    return $invocant->create_j0(@arguments) if scalar(@arguments) == 0;
    return $invocant->create_j1(@arguments) if scalar(@arguments) == 1;
    die "No method create takes " . scalar(@arguments) . " arguments";
}

sub create_j1 {
    my ($invocant, @arguments) = @_;
    return $invocant->create_j1_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY'));
    return $invocant->create_j1_2(@arguments);
}

use java::lang::Object ();
# use java::io::InputStream ();
# use java::io::StringBufferInputStream ();
# use javax::xml::parsers::DocumentBuilder ();
# use javax::xml::parsers::DocumentBuilderFactory ();
use org::allbinary::string::CommonPhoneStrings ();
use org::w3c::dom::Document ();
use java::lang::System ();

1;

