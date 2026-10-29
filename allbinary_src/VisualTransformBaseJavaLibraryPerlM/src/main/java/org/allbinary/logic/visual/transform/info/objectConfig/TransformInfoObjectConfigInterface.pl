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
package org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::document::mapping::DomDocumentMappingInterface';



sub containsView {
    my ($self, $transformInfoInterface) = @_;
    die "abstract method containsView";
}


# throws Exception
sub getName {
    my ($self) = @_;
    die "abstract method getName";
}


# throws Exception
sub getTransformsGroup {
    my ($self, $group) = @_;
    die "abstract method getTransformsGroup";
}


# throws Exception
sub getTransforms {
    my ($self) = @_;
    die "abstract method getTransforms";
}


# throws Exception
sub getParentTransforms {
    my ($self) = @_;
    die "abstract method getParentTransforms";
}


# throws Exception
sub getGroupTransforms {
    my ($self) = @_;
    die "abstract method getGroupTransforms";
}


# throws Exception
sub getOutputTypeName {
    my ($self) = @_;
    die "abstract method getOutputTypeName";
}


sub setOutputTypeName {
    my ($self, $value) = @_;
    die "abstract method setOutputTypeName";
}


# throws Exception
sub getInputOutputTypeName {
    my ($self) = @_;
    die "abstract method getInputOutputTypeName";
}


# throws Exception
sub getInputOutputTypeFile {
    my ($self) = @_;
    die "abstract method getInputOutputTypeFile";
}


# throws Exception
sub getImportUriPath {
    my ($self) = @_;
    die "abstract method getImportUriPath";
}


sub toString {
    my ($self) = @_;
    die "abstract method toString";
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tree::dom::document::mapping::DomDocumentMappingInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;

1;

