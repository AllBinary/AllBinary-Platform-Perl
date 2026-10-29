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

package org::allbinary::data::tree::dom::BasicErrorNodeUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub get {
    my ($class, $document, $errorText) = @_;
        try {
            my $node = $document->createElement('org::allbinary::business::error::ErrorData'->getInstance()->{NAME});
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, 'org::allbinary::business::error::ErrorData'->getInstance()->{TEXT}, $errorText));
            return $node;
        } catch ($e) {
            die ("Error Node Creation Failure");
        }
}

use org::allbinary::business::error::ErrorData;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::data::tree::dom::ModDomHelper;

1;

