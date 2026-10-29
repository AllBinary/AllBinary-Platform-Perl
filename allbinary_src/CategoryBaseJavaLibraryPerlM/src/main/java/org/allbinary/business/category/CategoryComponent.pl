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

package org::allbinary::business::category::CategoryComponent;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::category::CategoryView','org::allbinary::logic::visual::transform::TransformInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{NO_TYPE} = 0;
}


sub new {
    my ($class, $categoryInterface) = @_;
    my $self = $class->SUPER::new($categoryInterface);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub getTypeId {
    my ($self) = @_;
        return $self->{NO_TYPE};
}


sub getTransformDocumentInterface {
    my ($self) = @_;
        return undef;
}


# throws Exception
sub getTransformInfoInterface {
    my ($self) = @_;
        return undef;
}


sub setTransformDocumentInterface {
    my ($self, $viewDocumentInterface) = @_;
}


# throws Exception
sub toXmlDoc {
    my ($self) = @_;
        my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create();
        $document->appendChild('org::allbinary::business::category::CategoryView'->new($self->getCategoryInterface())->toXmlNode($document));
        return $document;
}


# throws Exception
sub view {
    my ($self) = @_;
        return undef;
}

use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::logic::visual::transform::TransformInterface;
use org::allbinary::logic::visual::transform::data::TransformDocumentInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::w3c::dom::Document;
use org::allbinary::business::category::CategoryView;

1;

