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
use parent -norequire,'java::lang::Object';

tie our $instance, 'java::lang::LazyStatic', sub { 'org::allbinary::data::tree::dom::AbXslHelper'->new() };

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
sub translate_j2_1 {
    my ($self, $xslFile, $xmlFile) = @_;
        return $self->translate($xslFile->getAbsolutePath(), $xmlFile->getAbsolutePath());
}


# throws Exception
sub translate_j2_2 {
    my ($self, $xslPath, $xmlPath) = @_;
        return $self->translate($xslPath->getPath(), $xmlPath->getPath());
}


# throws Exception
sub translate_j2_3 {
    my ($self, $xsltFilePath, $xmlFilePath) = @_;
        try {
            my $outputStream = 'java::io::ByteArrayOutputStream'->new();
            return 'org::allbinary::data::tree::dom::XslHelper'->getInstance()->translate('javax::xml::transform::stream::StreamSource'->new($xsltFilePath), 'javax::xml::transform::stream::StreamSource'->new($xmlFilePath), 'javax::xml::transform::stream::StreamResult'->new($outputStream))->toString();
        } catch ($e) {
            die $e;
        }
}

sub translate {
    my ($invocant, @arguments) = @_;
    return $invocant->translate_j2(@arguments) if scalar(@arguments) == 2;
    die "No method translate takes " . scalar(@arguments) . " arguments";
}

sub translate_j2 {
    my ($invocant, @arguments) = @_;
    return $invocant->translate_j2_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY'));
    return $invocant->translate_j2_2(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && (!defined($arguments[1]) || (ref($arguments[1]) && ref($arguments[1]) ne 'ARRAY'));
    return $invocant->translate_j2_3(@arguments);
}

use java::lang::Object ();
use java::lang::LazyStatic ();
# use java::io::ByteArrayOutputStream ();
# use javax::xml::transform::stream::StreamResult ();
# use javax::xml::transform::stream::StreamSource ();
use org::allbinary::logic::io::file::AbFile ();
use org::allbinary::logic::io::path::AbPath ();
use org::allbinary::data::tree::dom::XslHelper ();

1;

