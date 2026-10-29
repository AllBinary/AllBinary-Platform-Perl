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

package org::allbinary::data::tree::dom::DomNodeListHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getVector {
    my ($class, $nodeList) = @_;
        my $vector = 'org::allbinary::util::BasicArrayListD'->new();
        my $size = $nodeList->getLength();
        for (my $index = 0; $index < $size; $index++) {
            $vector->add('org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($nodeList->item($index)));
        }
        return $vector;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::StdUtil;
use org::w3c::dom::NodeList;
use org::allbinary::data::tree::dom::DomNodeHelper;

1;

