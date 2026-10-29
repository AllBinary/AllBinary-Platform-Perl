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

#containing string values and other hashmaps of the like
package org::allbinary::logic::communication::http::request::NameSpaceRequestParams;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Scalar::Util ();
use parent -norequire,'org::allbinary::logic::communication::http::request::RequestParams';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of NameSpaceRequestParams takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = $class->SUPER::new();
    $self->_init_fields();
        # super(...) made $self above
        if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
            $self->{logUtil}->putF("Constructing empty", $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


sub _new1 {
    my ($class, $httpServletRequest) = @_;
    my $self = $class->SUPER::new($httpServletRequest);
    $self->_init_fields();
        # super(...) made $self above
        if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
            $self->{logUtil}->putF("Constructing from HttpServletRequest", $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


sub _new1 {
    my ($class, $pageContext) = @_;
    my $self = $class->SUPER::new($pageContext);
    $self->_init_fields();
        # super(...) made $self above
        if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
            $self->{logUtil}->putF("Constructing from PageContext", $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
    return $self;
}


# throws Exception
sub createPackageNode {
    my ($self, $document, $packageName, $packagePropertiesHashMap) = @_;
        my $node = $document->createElement($packageName);
        my $propertyKeySet = $packagePropertiesHashMap->keySet();
        my $propertyKeySetArray = $propertyKeySet->toArray();
        my $size = scalar(@{$propertyKeySetArray});
        for (my $index = 0; $index < $size; $index++) {
            my $propertyName = $propertyKeySetArray->[$index];
            my $propertyValue = $packagePropertiesHashMap->get($propertyName);
            my $propertyNode = 'org::allbinary::data::tree::dom::ModDomHelper'->createTextNode($document, $propertyName, $propertyValue);
            $node->appendChild($propertyNode);
        }
        return $node;
}


# throws Exception
sub createPackageMultiNode {
    my ($self, $document, $nameSpaceRequestParam, $packageName, $packagePropertiesHashMap) = @_;
        my $beginIndex = index($packageName, "[");
        my $indexValue = substr($packageName, $beginIndex + 1, (length($packageName) - 1) - ($beginIndex + 1));
        my $multiElementPackage = substr($packageName, 0, ($beginIndex) - (0));
        my $selectedValue = $nameSpaceRequestParam->getValue();
        my $propertyValue = $packagePropertiesHashMap->get($org::allbinary::data::tree::dom::DomData::VALUE);
        if (($propertyValue cmp $org::allbinary::logic::communication::http::request::NameSpaceRequestParamData::VALUE) != 0) {
            $selectedValue = $propertyValue;
        }
        if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
            $self->{logUtil}->putF("\nAppending Multinode Element: " . $multiElementPackage . "[" . $indexValue . "] " . $selectedValue, $self, "createPackageMultiNode");
        }
        my $nextNode = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $multiElementPackage, $selectedValue);
        my $indexNode = 'org::allbinary::data::tree::dom::ModDomHelper'->createTextNode($document, $org::allbinary::data::tree::dom::DomData::INDEX, $indexValue);
        $nextNode->appendChild($indexNode);
        return $nextNode;
}


# throws Exception
sub getRootNode {
    my ($self, $rootElementPackage, $packagePropertiesHashMap, $document) = @_;
        my $rootNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNodeNoThrow($rootElementPackage, $document->getChildNodes());
        if (!defined($rootNode)) {
            if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                $self->{logUtil}->putF("\nAppending Document Root: " . "\nElementName: " . $rootElementPackage . "\nProperties: " . $packagePropertiesHashMap->toString(), $self, "getRootNode");
            }
            my $node = $self->createPackageNode($document, $rootElementPackage, $packagePropertiesHashMap);
            $document->appendChild($node);
            if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                $self->{logUtil}->putF("\nAppended Document Created: " . 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($document), $self, "getRootNode");
            }
            return $node;
        } else {
            if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                $self->{logUtil}->putF("\nUsing Existing Root Node", $self, "getRootNode");
            }
            return $rootNode;
        }
}


# throws Exception
sub addNewProperties {
    my ($self, $document, $node, $nextPackagePropertiesHashMap) = @_;
        if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("\nAdding Any New Properties: ")->append($nextPackagePropertiesHashMap->toString())->append("\nto node: ")->append($node->getNodeName())->toString(), $self, "addNewProperties");
        }
        my $propertyNameSet = $nextPackagePropertiesHashMap->keySet();
        my $propertyNameSetArray = $propertyNameSet->toArray();
        my $size = scalar(@{$propertyNameSetArray});
        for (my $index = 0; $index < $size; $index++) {
            my $nextPropertyName = $propertyNameSetArray->[$index];
            my $propertyValue = 'org::allbinary::logic::string::StringUtil'->getInstance()->getNonNull($nextPackagePropertiesHashMap->get($nextPropertyName));
            my $valueNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNodeNoThrow($nextPropertyName, $node->getChildNodes());
            if (defined($valueNode)) {
                my $existingElementNodeTextNodeValue = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($valueNode);
                if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                    $self->{logUtil}->putF("\nIf property: \"" . $nextPropertyName . " is the same as:\n" . "Node: " . $node->getNodeName() . " then: " . $propertyValue . "==" . $existingElementNodeTextNodeValue, $self, "addNewProperties");
                }
                if (($propertyValue cmp $existingElementNodeTextNodeValue) != 0) {
                    if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                        $self->{logUtil}->putF("At least one Property from NameSpaceRequest Package was different from Node", $self, "addNewProperties");
                    }
                    die ("Property Modifications Should Not Occur");
                }
            } else {
                if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                    $self->{logUtil}->putF("Adding a new Property: " . $nextPropertyName . "=" . $propertyValue, $self, "addNewProperties");
                }
                my $newPropertyNode = 'org::allbinary::data::tree::dom::ModDomHelper'->createTextNode($document, $nextPropertyName, $propertyValue);
                $node->appendChild($newPropertyNode);
            }
        }
        return $node;
}


# throws Exception
sub isElementValueTextNodeEqual {
    my ($self, $nextPackagePropertiesHashMap, $node) = @_;
        if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
            $self->{logUtil}->putF("\nComparing the value property in: " . $nextPackagePropertiesHashMap->toString() . "\nto node child leaves of node: " . $node->getNodeName(), $self, "isElementValueTextNodeEqual");
        }
        my $propertyValue = $nextPackagePropertiesHashMap->get($org::allbinary::data::tree::dom::DomData::VALUE);
        my $valueNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNodeNoThrow($org::allbinary::data::tree::dom::DomData::VALUE, $node->getChildNodes());
        if (defined($valueNode)) {
            my $existingElementNodeTextNodeValue = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($valueNode);
            if (($propertyValue cmp $existingElementNodeTextNodeValue) == 0) {
                if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                    $self->{logUtil}->putF("Value Node is the same", $self, "isElementValueTextNodeEqual");
                }
                return 1;
            }
        } else {
            return 1;
        }
        return 0;
}


# throws Exception
sub isElementValueTextNodeUnique {
    my ($self, $nextPackagePropertiesHashMap, $elementNodeVector) = @_;
        if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
            $self->{logUtil}->putF("\nComparing Properties of: " . $elementNodeVector->size() . " Nodes", $self, "isElementValueTextNodeUnique");
        }
        my $size = $elementNodeVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $existingElementNode = $elementNodeVector->get($index);
            if ($self->isElementValueTextNodeEqual($nextPackagePropertiesHashMap, $existingElementNode)) {
                return $index;
            }
        }
        return -1;
}


# throws Exception
sub addChildren {
    my ($self, $document, $rootNode, $nameSpaceRequestParam) = @_;
        my $node = $rootNode;
        my $packageVector = $nameSpaceRequestParam->getPackages();
        my $size = $packageVector->size();
        for (my $index = 1; $index < $size; $index++) {
            my $nextPackageName = $packageVector->get($index);
            if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("\nTrying to Add Child to Node: ")->append($node->getNodeName())->append("\nwith new PackageName: ")->append($nextPackageName)->toString(), $self, "addChildren");
            }
            my $nextPackagePropertiesHashMap = $nameSpaceRequestParam->getPackageProperties($index);
            my $elementNodeVector = 'org::allbinary::data::tree::dom::DomSearchHelper'->getAllNodesNoThrow($nextPackageName, $node->getChildNodes());
            if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                $self->{logUtil}->putF("\nDocument Contains " . $elementNodeVector->size() . " Node(s) With Same Name", $self, "addChildren");
            }
            my $isElementValueTextNodeUniqueIndex = $self->isElementValueTextNodeUnique($nextPackagePropertiesHashMap, $elementNodeVector);
            if (($elementNodeVector->size() == 0 || $isElementValueTextNodeUniqueIndex == -1) && !(substr($nextPackageName, -length('org::allbinary::string::CommonSeps'->getInstance()->{BRACKET_CLOSE})) eq 'org::allbinary::string::CommonSeps'->getInstance()->{BRACKET_CLOSE})) {
                my $nextNode = $self->createPackageNode($document, $nextPackageName, $nextPackagePropertiesHashMap);
                $node->appendChild($nextNode);
                $node = $nextNode;
                if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                    $self->{logUtil}->putF("\nAppended Package: " . $node->getNodeName(), $self, "addChildren");
                    $self->{logUtil}->putF("\nAppended Document Created: " . 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($document), $self, "addChildren");
                }
            } elsif ((substr($nextPackageName, -length('org::allbinary::string::CommonSeps'->getInstance()->{BRACKET_CLOSE})) eq 'org::allbinary::string::CommonSeps'->getInstance()->{BRACKET_CLOSE})) {
                if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                    $self->{logUtil}->putF("Package is MultiNode: just append", $self, "addChildren");
                }
                my $nextNode = $self->createPackageMultiNode($document, $nameSpaceRequestParam, $nextPackageName, $nextPackagePropertiesHashMap);
                $node->appendChild($nextNode);
                $node = $nextNode;
                if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                    $self->{logUtil}->putF("\nAppended Multinode Element: " . 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($document), $self, "addChildren");
                }
            } else {
                if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                    $self->{logUtil}->putF("Value Node already exists: Now compare (properties to leaf nodes)", $self, "addChildren");
                }
                my $nodeNameDuplicateNode = $elementNodeVector->get($isElementValueTextNodeUniqueIndex);
                $node = $self->addNewProperties($document, $nodeNameDuplicateNode, $nextPackagePropertiesHashMap);
                if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                    $self->{logUtil}->putF("\nDuplicate Node Found: Moving to next child ^", $self, "addChildre");
                }
            }
        }
        return $document;
}


# throws Exception
sub addNameSpace {
    my ($self, $key, $value, $document) = @_;
        if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
            $self->{logUtil}->putF('org::allbinary::logic::string::StringMaker'->new()->append("NameSpace key: ")->append($key)->append(" Value: ")->append($value)->toString(), $self, "addNameSpace");
        }
        my $nameSpaceRequestParam = 'org::allbinary::logic::communication::http::request::NameSpaceRequestParam'->new($key, $value);
        my $packageVector = $nameSpaceRequestParam->getPackages();
        my $size = $packageVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $packageName = $packageVector->get($index);
            my $packagePropertiesHashMap = $nameSpaceRequestParam->getPackageProperties($packageVector->indexOf($packageName));
            my $rootNode = $self->getRootNode($packageName, $packagePropertiesHashMap, $document);
            if ($index < $size - 1) {
                return $self->addChildren($document, $rootNode, $nameSpaceRequestParam);
            }
        }
        return $document;
}


# throws Exception
sub toHashMap {
    my ($self) = @_;
        my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create();
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $keys = $self->getMap()->keySet();
        my $keyArray = $keys->toArray();
        my $keySize = scalar(@{$keyArray});
        if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
            $self->{logUtil}->putF("NameSpace Request Size: " . $keys->size(), $self, "toHashMap");
        }
        for (my $i = 0; $i < $keySize; $i++) {
            my $key = $keyArray->[$i];
            my $anyType = $self->getMap()->get($key);
            my $className = ref($anyType);
            if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                $self->{logUtil}->putF("Request Param Class: " . $className, $self, "toHashMap");
            }
            if ((Scalar::Util::blessed($self->getMap()->get($key)) && $self->getMap()->get($key)->isa('String'))) {
                my $value = $self->getMap()->get($key);
                if (index($key, $org::allbinary::logic::communication::http::request::NameSpaceRequestParamData::NAME) < 0) {
                    if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                        $self->{logUtil}->putF("Not NameSpace key: " . $key . " Value: " . $value, $self, "toHashMap()");
                    }
                    $hashMap->put(("" . $key), ("" . $value));
                } else {
                    $document = $self->addNameSpace(("" . $key), ("" . $value), $document);
                }
            } elsif ((Scalar::Util::blessed($self->getMap()->get($key)) && $self->getMap()->get($key)->isa('ARRAY'))) {
                my $values = $self->getMap()->get($key);
                if (index($key, $org::allbinary::logic::communication::http::request::NameSpaceRequestParamData::NAME) < 0) {
                    if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                        $self->{logUtil}->putF("Not NameSpace key: " . $key . " Value: " . $values->[0], $self, "toHashMap()");
                    }
                    $hashMap->put(("" . $key), ("" . $values->[0]));
                } else {
                    $document = $self->addNameSpace(("" . $key), ("" . $values->[0]), $document);
                }
            }
        }
        if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
            $self->{logUtil}->putF("NameSpaceRequestParams: " . $self->getMap()->toString() . "\ntoHashMap(): " . $hashMap->toString() . "\nDocument Created: " . 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($document), $self, "toHashMap()");
        }
        $hashMap->put($org::allbinary::logic::communication::http::request::NameSpaceRequestParamData::DOCUMENT, $document);
        return $hashMap;
}

use java::util::HashMap;
# use java::util::Set;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
# use javax::servlet::http::HttpServletRequest;
# use javax::servlet::jsp::PageContext;
use org::allbinary::data::tree::dom::DomData;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::string::CommonSeps;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::logic::communication::http::request::RequestParams;
use org::allbinary::logic::communication::http::request::NameSpaceRequestParamData;
use org::allbinary::logic::communication::http::request::NameSpaceRequestParam;

1;

