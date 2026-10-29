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

package org::allbinary::logic::control::search::SearchRequest;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::context::AbContext';


sub _init_fields {
    my ($self) = @_;
    $self->{xslFile} = undef;
    $self->{pageName} = undef;
    $self->{contentType} = undef;
    $self->{searchParams} = undef;
    $self->{storeFront} = undef;
}


sub new {
    my ($class, $storeFront, $searchParams, $xslFile, $contentType, $propertiesHashMap, $pageContext) = @_;
    my $self = $class->SUPER::new($propertiesHashMap, $pageContext);
    $self->_init_fields();
        # super(...) made $self above
        $self->{storeFront} = $storeFront;
        $self->{searchParams} = $searchParams;
        $self->{xslFile} = $xslFile;
        $self->{pageName} = $self->{pageName};
        $self->{contentType} = $contentType;
    return $self;
}


sub setStoreFront {
    my ($self, $storeFront) = @_;
        $self->{storeFront} = $storeFront;
}


sub setParams {
    my ($self, $searchParams) = @_;
        $self->{searchParams} = $searchParams;
}


sub setXslFile {
    my ($self, $value) = @_;
        $self->{xslFile} = $value;
}


sub setFileBaseName {
    my ($self, $value) = @_;
        $self->{pageName} = $value;
}


sub setContentType {
    my ($self, $value) = @_;
        $self->{contentType} = $value;
}


sub getStoreFront {
    my ($self) = @_;
        return $self->{storeFront};
}


sub getParams {
    my ($self) = @_;
        return $self->{searchParams};
}


sub getXslFile {
    my ($self) = @_;
        return $self->{xslFile};
}


sub getFileBaseName {
    my ($self) = @_;
        return $self->{pageName};
}


sub getContentType {
    my ($self) = @_;
        return $self->{contentType};
}


# throws Exception
sub getFileBaseNameNode {
    my ($self, $document) = @_;
        return 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::logic::control::search::SearchData::FILENAME, $self->getFileBaseName());
}

use java::util::HashMap;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::context::AbContext;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::control::search::SearchData;

1;

