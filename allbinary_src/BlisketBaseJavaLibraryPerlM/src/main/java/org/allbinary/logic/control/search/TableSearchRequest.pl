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

package org::allbinary::logic::control::search::TableSearchRequest;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{xslFile} = undef;
    $self->{pageName} = undef;
    $self->{contentType} = undef;
    $self->{keywords} = undef;
    $self->{searchParams} = undef;
}


sub new {
    my ($class, $keywords, $searchParams, $xslFile, $contentType) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{keywords} = $keywords;
        $self->{searchParams} = $searchParams;
        $self->{xslFile} = $xslFile;
        $self->{pageName} = $self->{pageName};
        $self->{contentType} = $contentType;
    return $self;
}


sub setKeywords {
    my ($self, $value) = @_;
        $self->{keywords} = $value;
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


sub getKeywords {
    my ($self) = @_;
        return $self->{keywords};
}


sub getParams {
    my ($self) = @_;
        return $self->{searchParams};
}


# throws Exception
sub getXslFile {
    my ($self) = @_;
        my $path = 'org::allbinary::globals::URLGLOBALS'->getMainPath() + 'org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{XSLPATH} . $self->{xslFile};
        return $path;
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

use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::globals::FREEBLISKET_PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::control::search::SearchData;

1;

