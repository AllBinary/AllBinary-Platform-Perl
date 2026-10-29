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

package org::allbinary::business::category::CategoryUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


sub getPathLevel {
    my ($class, $categoryPath) = @_;
        my $count = 'org::apache::commons::lang3::StringUtils'->countMatches($categoryPath->toString(), 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR});
        return $count;
}


sub getNameFromNode {
    my ($class, $node) = @_;
        my $attributes = $node->getAttributes();
        my $attrNode = $attributes->getNamedItem('org::allbinary::business::category::CategoryData'->getInstance()->{LABEL});
        if (defined($attrNode)) {
            return $attrNode->getValue();
        } else {
            my $labelNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNodeNoThrow('org::allbinary::business::category::CategoryData'->getInstance()->{LABEL}, $node->getChildNodes());
            if (defined($labelNode)) {
                return 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($labelNode);
            }
        }
        return 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
}

use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringUtil;
use org::apache::commons::lang3::StringUtils;
use org::w3c::dom::Attr;
use org::w3c::dom::NamedNodeMap;
use org::w3c::dom::Node;
use org::allbinary::business::category::CategoryData;

1;

