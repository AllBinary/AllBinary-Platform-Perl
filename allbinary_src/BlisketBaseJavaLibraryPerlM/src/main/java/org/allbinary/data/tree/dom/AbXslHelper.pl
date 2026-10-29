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

package org::allbinary::data::tree::dom::AbXslHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'org::allbinary::data::tree::dom::AbXslHelper'->new();

sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getInstance {
    my ($class) = @_;
        return $org::allbinary::data::tree::dom::AbXslHelper::instance;
}


# throws Exception
sub translate {
    my ($self, $xslFile, $xmlFile) = @_;
        return $self->translate($xslFile->getAbsolutePath(), $xmlFile->getAbsolutePath());
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub translate {
    my ($self, $xslPath, $xmlPath) = @_;
        return $self->translate($xslPath->getPath(), $xmlPath->getPath());
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub translate {
    my ($self, $xsltFilePath, $xmlFilePath) = @_;
        try {
            my $outputStream = 'java::io::ByteArrayOutputStream'->new();
            return 'org::allbinary::data::tree::dom::XslHelper'->getInstance()->translate('javax::xml::transform::stream::StreamSource'->new($xsltFilePath), 'javax::xml::transform::stream::StreamSource'->new($xmlFilePath), 'javax::xml::transform::stream::StreamResult'->new($outputStream))->toString();
        } catch ($e) {
            die $e;
        }
}

# use java::io::ByteArrayOutputStream;
# use javax::xml::transform::stream::StreamResult;
# use javax::xml::transform::stream::StreamSource;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::data::tree::dom::XslHelper;

1;

