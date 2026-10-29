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

package org::allbinary::data::tree::dom::DirectoryDataModel;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface','org::allbinary::logic::visual::transform::TransformInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{fileBasicArrayList} = undef;
    $self->{transformDocumentInterface} = undef;
    $self->{NO_TYPE} = 0;
}


sub new {
    my ($class, $file) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{fileBasicArrayList} = 'org::allbinary::logic::io::file::directory::Directory'->getInstance()->search($file);
        $self->{transformDocumentInterface} = 'org::allbinary::logic::visual::transform::data::TransformDocumentFactory'->getInstance();
    return $self;
}


sub getTypeId {
    my ($self) = @_;
        return $self->{NO_TYPE};
}


# throws Exception
sub getTransformInfoInterface {
    my ($self) = @_;
        return undef;
}


sub setTransformDocumentInterface {
    my ($self, $transformDocumentInterface) = @_;
        $self->{transformDocumentInterface} = $transformDocumentInterface;
}


sub getTransformDocumentInterface {
    my ($self) = @_;
        return $self->{transformDocumentInterface};
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $dirNode = $document->createElement("dir");
        my $size = $self->{fileBasicArrayList}->size();
        my $nextFile = undef;
        my $fileNode = undef;
        for (my $index = 0; $index < $size; $index++) {
            $nextFile = $self->{fileBasicArrayList}->get($index);
            $fileNode = 'org::allbinary::data::tree::dom::FileDomDataModel'->new($nextFile)->toXmlNode($document);
            $dirNode->appendChild($fileNode);
        }
        return $dirNode;
}


# throws Exception
sub toXmlDoc {
    my ($self) = @_;
        return $self->getTransformDocumentInterface()->getDoc();
}


# throws Exception
sub view {
    my ($self) = @_;
        my $node = $self->toXmlNode($self->getTransformDocumentInterface()->getDoc());
        $self->getTransformDocumentInterface()->getBaseNode()->appendChild($node);
        return 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($self->getTransformDocumentInterface()->getDoc());
}

use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::logic::io::file::AbFile;
use org::allbinary::logic::io::file::directory::Directory;
use org::allbinary::logic::visual::transform::TransformInterface;
use org::allbinary::logic::visual::transform::data::TransformDocumentFactory;
use org::allbinary::logic::visual::transform::data::TransformDocumentInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::util::BasicArrayList;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::FileDomDataModel;

1;

