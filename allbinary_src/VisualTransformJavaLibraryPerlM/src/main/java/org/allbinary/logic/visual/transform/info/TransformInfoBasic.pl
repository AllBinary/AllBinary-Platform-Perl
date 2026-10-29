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

#Hack class should not exist
package org::allbinary::logic::visual::transform::info::TransformInfoBasic;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::context::AbContext','org::allbinary::logic::visual::transform::info::TransformInfoHttpInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{storeFrontInterface} = undef;
}


sub new {
    my ($class, $storeFrontInterface, $propertiesHashMap, $pageContext) = @_;
    my $self = $class->SUPER::new($propertiesHashMap, $pageContext);
    $self->_init_fields();
        # super(...) made $self above
        $self->{storeFrontInterface} = $storeFrontInterface;
    return $self;
}


sub getStoreName {
    my ($self) = @_;
        return $self->{storeFrontInterface}->getName();
}


sub log {
    my ($self) = @_;
        return $self->{commonStrings}->{NOT_IMPLEMENTED};
}


sub override {
    my ($self, $hashMap) = @_;
}


sub getName {
    my ($self) = @_;
        return undef;
}


sub getObjectFile {
    my ($self) = @_;
        return undef;
}


sub getObject {
    my ($self) = @_;
        return undef;
}


sub getObjectConfigInterface {
    my ($self) = @_;
        return undef;
}


sub setObjectConfigInterface {
    my ($self, $transformInfoObjectConfigInterface) = @_;
}


sub getTemplateFilePath {
    my ($self) = @_;
        return undef;
}


sub getTemplateFile {
    my ($self) = @_;
        return undef;
}


sub getTemplate {
    my ($self) = @_;
        return undef;
}


sub getDataFilePath {
    my ($self) = @_;
        return undef;
}


sub getDataFile {
    my ($self) = @_;
        return undef;
}


# throws Exception
sub getDataDocument {
    my ($self) = @_;
        die ($self->{commonStrings}->{NOT_IMPLEMENTED});
}


sub setName {
    my ($self, $value) = @_;
}


sub setStoreName {
    my ($self, $value) = @_;
}


sub setObjectFile {
    my ($self, $value) = @_;
}


sub setObject {
    my ($self, $anyType) = @_;
}


sub setObjectConfigFile {
    my ($self, $value) = @_;
}


sub setTemplateFile {
    my ($self, $value) = @_;
}


sub setTemplate {
    my ($self, $value) = @_;
}


sub setDataFile {
    my ($self, $value) = @_;
}


sub setData {
    my ($self, $value) = @_;
}


sub setChild {
    my ($self) = @_;
}


sub isChild {
    my ($self) = @_;
        return 1;
}


sub getImportUriPath {
    my ($self) = @_;
        return undef;
}


sub setImportUriPath {
    my ($self, $importUriPath) = @_;
}


# throws Exception
sub getKey {
    my ($self) = @_;
        return undef;
}


# throws Exception
sub toVector {
    my ($self) = @_;
        return undef;
}


# throws Exception
sub toHashMap {
    my ($self) = @_;
        return undef;
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::jsp::PageContext;
use org::allbinary::business::context::AbContext;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigInterface;
use org::w3c::dom::Document;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpInterface;

1;

