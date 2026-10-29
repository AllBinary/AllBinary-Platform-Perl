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

package org::allbinary::business::category::properties::CategoryPropertiesView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{categoryPropertiesInterface} = undef;
}


sub new {
    my ($class, $categoryPropertiesInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{categoryPropertiesInterface} = $categoryPropertiesInterface;
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $categoryNode = $document->createElement('org::allbinary::business::category::CategoryData'->getInstance()->{NAME});
        my $newCategoryNode = $categoryNode;
        $newCategoryNode->setAttribute('org::allbinary::business::category::CategoryData'->getInstance()->{LABEL}, $self->{categoryPropertiesInterface}->getValue());
        return $categoryNode;
}

use org::allbinary::business::category::CategoryData;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::w3c::dom::Document;
use org::w3c::dom::Element;
use org::w3c::dom::Node;

1;

