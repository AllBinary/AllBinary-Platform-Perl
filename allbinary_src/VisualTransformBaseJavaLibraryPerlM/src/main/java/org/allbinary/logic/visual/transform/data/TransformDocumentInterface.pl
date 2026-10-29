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
package org::allbinary::logic::visual::transform::data::TransformDocumentInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub getBaseNode {
    my ($self) = @_;
    die "abstract method getBaseNode";
}


sub getDoc {
    my ($self) = @_;
    die "abstract method getDoc";
}

use org::w3c::dom::Document;
use org::w3c::dom::Node;

1;

