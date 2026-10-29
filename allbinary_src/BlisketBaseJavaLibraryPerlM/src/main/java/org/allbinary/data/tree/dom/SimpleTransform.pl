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

package org::allbinary::data::tree::dom::SimpleTransform;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{xsltFilePath} = undef;
    $self->{dataFilePath} = undef;
}


sub new {
    my ($class, $xsltFilePath, $dataFilePath) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{xsltFilePath} = $xsltFilePath;
        $self->{dataFilePath} = $dataFilePath;
    return $self;
}


# throws Exception
sub transform {
    my ($self) = @_;
        my $inputStream = 'org::allbinary::logic::io::AbFileLocalInputStream'->new('org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($self->{xsltFilePath}));
        my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create('org::allbinary::logic::io::AbFileLocalInputStream'->new('org::allbinary::logic::io::file::AbFile'->createAbFileFromAbPath($self->{dataFilePath})));
        my $result = 'org::allbinary::data::tree::dom::XslHelper'->getInstance()->translate('javax::xml::transform::stream::StreamSource'->new($inputStream), 'javax::xml::transform::stream::StreamSource'->new('java::io::StringBufferInputStream'->new('org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($document))));
        return $result;
}

# use java::io::StringBufferInputStream;
# use javax::xml::transform::stream::StreamSource;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::logic::io::AbFileLocalInputStream;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::path::AbPath;
use org::w3c::dom::Document;
use org::allbinary::data::tree::dom::XslHelper;

1;

