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

package org::allbinary::logic::communication::java::vm::stats::JvmStatisticsView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::communication::java::vm::stats::JvmStatisticsMapping','org::allbinary::data::tree::dom::DomNodeInterface';



sub new {
    my ($class) = @_;
    my $self = $class->SUPER::new();
        # super(...) made $self above
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $hashMap = $self->toHashMap();
        my $node = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData::NAME, $hashMap);
        return $node;
}

use java::util::HashMap;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::communication::java::vm::stats::JvmStatisticsMapping;
use org::allbinary::logic::communication::java::vm::stats::JvmStatisticsData;

1;

