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

package org::allbinary::data::tree::dom::document::DomDocumentFileHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub createDocument {
    my ($class, $xmlFile) = @_;
        try {
            return 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create('org::allbinary::logic::io::AbFileInputStream'->new($xmlFile));
        } catch ($e) {
            die $e;
        }
}


# throws Exception
sub save {
    my ($class, $file, $document) = @_;
        my $dataOutputStream = undef;
        try {
            my $copyTransformerFactory = 'javax::xml::transform::TransformerFactory'->newInstance();
            my $copyTransformer = $copyTransformerFactory->newTransformer();
            my $domSource = 'javax::xml::transform::dom::DOMSource'->new($document);
            if ($file->isFile()) {
                $file->delete();
            }
            $file->createNewFile();
            $dataOutputStream = 'org::allbinary::logic::io::DataOutputStreamFactory'->getInstance()->getInstanceForAbFile($file);
            my $streamResult = 'javax::xml::transform::stream::StreamResult'->new($dataOutputStream);
            $copyTransformer->transform($domSource, $streamResult);
            $dataOutputStream->flush();
        } catch ($e) {
            die $e;
        } finally {
            'org::allbinary::logic::io::StreamUtil'->getInstance()->close($dataOutputStream);
        }
}

# use javax::xml::transform::Transformer;
# use javax::xml::transform::TransformerFactory;
# use javax::xml::transform::dom::DOMSource;
# use javax::xml::transform::stream::StreamResult;
use org::allbinary::logic::io::AbDataOutputStream;
use org::allbinary::logic::io::AbFileInputStream;
use org::allbinary::logic::io::DataOutputStreamFactory;
use org::allbinary::logic::io::StreamUtil;
use org::allbinary::logic::io::file::AbFile;
use org::w3c::dom::Document;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;

1;

