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

# Java interface
package org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::TableMappingInterface';



sub log {
    my ($self) = @_;
    die "abstract method log";
}


# throws Exception
sub override {
    my ($self, $hashMap) = @_;
    die "abstract method override";
}


sub getName {
    my ($self) = @_;
    die "abstract method getName";
}


sub setStoreName {
    my ($self, $value) = @_;
    die "abstract method setStoreName";
}


sub getStoreName {
    my ($self) = @_;
    die "abstract method getStoreName";
}


sub getObjectFile {
    my ($self) = @_;
    die "abstract method getObjectFile";
}


sub getObject {
    my ($self) = @_;
    die "abstract method getObject";
}


# throws Exception
sub getTemplateFilePath {
    my ($self) = @_;
    die "abstract method getTemplateFilePath";
}


sub getTemplateFile {
    my ($self) = @_;
    die "abstract method getTemplateFile";
}


sub getTemplate {
    my ($self) = @_;
    die "abstract method getTemplate";
}


# throws Exception
sub getDataFilePath {
    my ($self) = @_;
    die "abstract method getDataFilePath";
}


sub getDataFile {
    my ($self) = @_;
    die "abstract method getDataFile";
}


# throws Exception
sub getDataDocument {
    my ($self) = @_;
    die "abstract method getDataDocument";
}


sub setName {
    my ($self, $value) = @_;
    die "abstract method setName";
}


sub setObjectFile {
    my ($self, $value) = @_;
    die "abstract method setObjectFile";
}


sub setObject {
    my ($self, $anyType) = @_;
    die "abstract method setObject";
}


# throws Exception
sub setObjectConfigInterface {
    my ($self, $transformInfoObjectConfigInterface) = @_;
    die "abstract method setObjectConfigInterface";
}


# throws Exception
sub getObjectConfigInterface {
    my ($self) = @_;
    die "abstract method getObjectConfigInterface";
}


sub setTemplateFile {
    my ($self, $value) = @_;
    die "abstract method setTemplateFile";
}


sub setTemplate {
    my ($self, $value) = @_;
    die "abstract method setTemplate";
}


sub setDataFile {
    my ($self, $value) = @_;
    die "abstract method setDataFile";
}


sub setData {
    my ($self, $value) = @_;
    die "abstract method setData";
}


sub setChild {
    my ($self) = @_;
    die "abstract method setChild";
}


sub isChild {
    my ($self) = @_;
    die "abstract method isChild";
}

use java::util::HashMap;
use org::allbinary::data::tables::TableMappingInterface;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigInterface;
use org::w3c::dom::Document;

1;

