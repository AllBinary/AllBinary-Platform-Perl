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
package org::allbinary::logic::visual::theme::ThemeInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tables::TableMappingInterface';



sub getName {
    my ($self) = @_;
    die "abstract method getName";
}


sub getPath {
    my ($self) = @_;
    die "abstract method getPath";
}


sub getPreviewImageName {
    my ($self) = @_;
    die "abstract method getPreviewImageName";
}


sub getPreviewImagePath {
    my ($self) = @_;
    die "abstract method getPreviewImagePath";
}

use org::allbinary::data::tables::TableMappingInterface;

1;

