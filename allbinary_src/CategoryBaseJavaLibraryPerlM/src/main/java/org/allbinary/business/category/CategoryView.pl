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

package org::allbinary::business::category::CategoryView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{categoryInterface} = undef;
}


sub new {
    my ($class, $categoryInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{categoryInterface} = $categoryInterface;
    return $self;
}


sub getCategoryInterface {
    my ($self) = @_;
        return $self->{categoryInterface};
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $node = $document->createElement('org::allbinary::business::category::CategoryData'->getInstance()->{NAME});
        my $childCategoryVector = $self->{categoryInterface}->getChildNodes();
        if ($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::category::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{CATEGORY})) {
            $self->{logUtil}->putF("Number Of Children: " . $childCategoryVector->size(), $self, "toXmlNode");
        }
        my $size = $childCategoryVector->size();
        for (my $i = 0; $i < $size; $i++) {
            my $anyType = $childCategoryVector->get($i);
            my $categoryPropertiesInterface = undef;
            if ('org::allbinary::logic::java::anyType::InterfaceUtil'->isImplemented("CategoryPropertiesInterface", $anyType)) {
                $categoryPropertiesInterface = $anyType;
            } elsif ('org::allbinary::logic::java::anyType::InterfaceUtil'->isImplemented("CategoryInterface", $anyType)) {
                my $categoryInterface = $anyType;
                $categoryPropertiesInterface = $categoryInterface->getProperties();
            } else {
                my $isImpl = 'org::allbinary::logic::java::anyType::InterfaceUtil'->viewAll(ref($anyType), 'org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE});
                die ("CategoryView found unknown object.\n" . "Show Testing:" . $isImpl);
            }
            my $childCategoryNode = 'org::allbinary::business::category::properties::CategoryPropertiesView'->new($categoryPropertiesInterface)->toXmlNode($document);
            $node->appendChild($childCategoryNode);
        }
        return $node;
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::category::properties::CategoryPropertiesInterface;
use org::allbinary::business::category::properties::CategoryPropertiesView;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::java::anyType::InterfaceUtil;
use org::allbinary::string::CommonSeps;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::category::CategoryData;

1;

