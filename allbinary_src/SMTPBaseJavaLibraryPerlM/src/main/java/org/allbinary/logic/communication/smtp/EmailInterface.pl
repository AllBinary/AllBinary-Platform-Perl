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
package org::allbinary::logic::communication::smtp::EmailInterface;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface','org::allbinary::data::tree::dom::document::mapping::DomDocumentMappingInterface';



sub getDebugInfo {
    my ($self) = @_;
    die "abstract method getDebugInfo";
}


sub getMimeMessage {
    my ($self) = @_;
    die "abstract method getMimeMessage";
}


# throws Exception
sub log {
    my ($self) = @_;
    die "abstract method log";
}

# use javax::mail::internet::MimeMessage;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::document::mapping::DomDocumentMappingInterface;

1;

