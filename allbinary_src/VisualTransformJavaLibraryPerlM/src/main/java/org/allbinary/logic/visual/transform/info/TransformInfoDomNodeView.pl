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

package org::allbinary::logic::visual::transform::info::TransformInfoDomNodeView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::info::TransformInfoDomNode','org::allbinary::data::tree::dom::DomNodeInterface';


sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of TransformInfoDomNodeView takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $transformInfoInterface, $mapping) = @_;
    my $self = $class->SUPER::new($transformInfoInterface, $mapping);
        # super(...) made $self above
    return $self;
}


sub _new1 {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
        # super(...) made $self above
    return $self;
}


sub _new2 {
    my ($class, $name, $mappedName) = @_;
    my $self = $class->SUPER::new($name, $mappedName);
        # super(...) made $self above
    return $self;
}


sub _new1 {
    my ($class, $name) = @_;
    my $self = $class->SUPER::new($name, undef);
        # super(...) made $self above
    return $self;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $transformInfoData = 'org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance();
        my $subViewNode = $document->createElement($transformInfoData->{NAME});
        my $viewNameAttr = $document->createAttribute($transformInfoData->{NAME});
        $viewNameAttr->setValue($self->getTransformInfoInterface()->getName());
        my $componentNodeAttributes = $subViewNode->getAttributes();
        $componentNodeAttributes->setNamedItem($viewNameAttr);
        if (defined($self->getMappedName())) {
            my $mappedNameAttr = $document->createAttribute($transformInfoData->{MAPPED});
            $mappedNameAttr->setValue($self->getMappedName());
            $componentNodeAttributes->setNamedItem($mappedNameAttr);
        }
        return $subViewNode;
}

use org::allbinary::data::tree::dom::DomNodeInterface;
use org::w3c::dom::Attr;
use org::w3c::dom::Document;
use org::w3c::dom::NamedNodeMap;
use org::w3c::dom::Node;
use org::allbinary::logic::visual::transform::info::TransformInfoDomNode;
use org::allbinary::logic::visual::transform::info::TransformInfoData;

1;

