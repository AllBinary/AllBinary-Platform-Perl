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

package org::allbinary::data::tree::dom::ModDomHelper;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use Scalar::Util ();
use parent -norequire,'java::lang::Object';



sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    return $self;
}


# throws Exception
sub createTextNode {
    my ($class, $document, $name, $text) = @_;
        my $newValueNode = $document->createElement($name);
        my $newValueTextNode = $document->createTextNode($text);
        $newValueNode->appendChild($newValueTextNode);
        return $newValueNode;
}


# throws Exception
sub createValueNode {
    my ($class, $document, $text) = @_;
        return 'org::allbinary::data::tree::dom::ModDomHelper'->createTextNode($document, $org::allbinary::data::tree::dom::DomData::VALUE, $text);
}


# throws Exception
sub createNameNode {
    my ($class, $document, $text) = @_;
        return 'org::allbinary::data::tree::dom::ModDomHelper'->createTextNode($document, $org::allbinary::data::tree::dom::DomData::NAME, $text);
}


# throws Exception
sub createIndexNode {
    my ($class, $document, $index) = @_;
        return 'org::allbinary::data::tree::dom::ModDomHelper'->createTextNode($document, $org::allbinary::data::tree::dom::DomData::INDEX, $index->toString());
}


# throws Exception
sub createNameValueNodes_j4_1 {
    my ($class, $document, $elementName, $nameText, $valueText) = @_;
        my $newNode = $document->createElement($elementName);
        $newNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameNode($document, $nameText));
        $newNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createValueNode($document, $valueText));
        return $newNode;
}


# throws Exception
sub createNameValueNodes_j3_1 {
    my ($class, $document, $elementNameAndNameText, $valueText) = @_;
        my $newNode = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $elementNameAndNameText, $elementNameAndNameText, $valueText);
        return $newNode;
}


# throws Exception
sub createNameValueIndexNodes_j4_1 {
    my ($class, $document, $elementNameAndNameText, $index, $valueText) = @_;
        my $newNode = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $elementNameAndNameText, $valueText);
        $newNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createIndexNode($document, $index));
        return $newNode;
}


# throws Exception
sub createNameValueNodes_j3_2 {
    my ($class, $document, $rootNode, $hashMap) = @_;
        my $node = $document->createElement($rootNode);
        return 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $node, $hashMap);
}


# throws Exception
sub createNameValueNodes_j3_3 {
    my ($class, $document, $node, $hashMap) = @_;
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $keySet = $hashMap->keySet();
        my $keyArray = $keySet->toArray();
        my $size = scalar(@{$keyArray});
        for (my $i = 0; $i < $size; $i++) {
            my $objectKey = $keyArray->[$i];
            my $name = $objectKey;
            my $anyType = $hashMap->get($objectKey);
            if (!defined($anyType)) {
                my $value = $stringUtil->{EMPTY_STRING};
                $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $name, $value));
            } elsif ((Scalar::Util::blessed($anyType) && $anyType->isa('String'))) {
                my $value = $stringUtil->getNonNull($anyType);
                $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $name, $value));
            } elsif ((Scalar::Util::blessed($anyType) && $anyType->isa('java::util::HashMap'))) {
                $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $name, $hashMap));
            } else {
                die ("HashMap value is the wrong instance and is: " . 'org::allbinary::logic::java::anyType::clazz::ClassUtil'->viewAll($anyType, 'org::allbinary::string::CommonSeps'->getInstance()->{NEW_LINE}));
            }
        }
        return $node;
}


# throws Exception
sub createNameValueNodes_j4_2 {
    my ($class, $document, $rootNodeName, $duplicateNodeName, $valueVector) = @_;
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $node = $document->createElement($rootNodeName);
        my $size = $valueVector->size();
        for (my $i = 0; $i < $size; $i++) {
            my $value = $stringUtil->getNonNull($valueVector->get($i));
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $duplicateNodeName, $value));
        }
        return $node;
}

sub createNameValueNodes {
    my ($invocant, @arguments) = @_;
    return $invocant->createNameValueNodes_j4(@arguments) if scalar(@arguments) == 4;
    return $invocant->createNameValueNodes_j3(@arguments) if scalar(@arguments) == 3;
    die "No method createNameValueNodes takes " . scalar(@arguments) . " arguments";
}

sub createNameValueNodes_j4 {
    my ($invocant, @arguments) = @_;
    return $invocant->createNameValueNodes_j4_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && !ref($arguments[1]) && !ref($arguments[2]) && !ref($arguments[3]);
    return $invocant->createNameValueNodes_j4_2(@arguments);
}

sub createNameValueNodes_j3 {
    my ($invocant, @arguments) = @_;
    return $invocant->createNameValueNodes_j3_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && !ref($arguments[1]) && !ref($arguments[2]);
    return $invocant->createNameValueNodes_j3_2(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && !ref($arguments[1]) && (!defined($arguments[2]) || (ref($arguments[2]) && ref($arguments[2]) ne 'ARRAY'));
    return $invocant->createNameValueNodes_j3_3(@arguments);
}


# throws Exception
sub createNameValueIndexNodes_j4_2 {
    my ($class, $document, $rootNodeName, $duplicateNodeName, $valueVector) = @_;
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $node = $document->createElement($rootNodeName);
        my $size = $valueVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $value = $stringUtil->getNonNull($valueVector->get($index));
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueIndexNodes($document, $duplicateNodeName, $index, $value));
        }
        return $node;
}

sub createNameValueIndexNodes {
    my ($invocant, @arguments) = @_;
    return $invocant->createNameValueIndexNodes_j4(@arguments) if scalar(@arguments) == 4;
    die "No method createNameValueIndexNodes takes " . scalar(@arguments) . " arguments";
}

sub createNameValueIndexNodes_j4 {
    my ($invocant, @arguments) = @_;
    return $invocant->createNameValueIndexNodes_j4_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && !ref($arguments[1]) && !ref($arguments[2]) && !ref($arguments[3]);
    return $invocant->createNameValueIndexNodes_j4_2(@arguments);
}


# throws Exception
sub createNodeWithValueNodes_j3_1 {
    my ($class, $document, $rootNode, $hashMap) = @_;
        my $node = $document->createElement($rootNode);
        return 'org::allbinary::data::tree::dom::ModDomHelper'->createNodeWithValueNodes($document, $node, $hashMap);
}


# throws Exception
sub createNodeWithValueNodes_j3_2 {
    my ($class, $document, $node, $hashMap) = @_;
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $keySet = $hashMap->keySet();
        my $keyArray = $keySet->toArray();
        my $size = scalar(@{$keyArray});
        for (my $i = 0; $i < $size; $i++) {
            my $name = $keyArray->[$i];
            my $anyType = $hashMap->get($name);
            my $value = $stringUtil->getNonNull($anyType);
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createTextNode($document, $name, $value));
        }
        return $node;
}

sub createNodeWithValueNodes {
    my ($invocant, @arguments) = @_;
    return $invocant->createNodeWithValueNodes_j3(@arguments) if scalar(@arguments) == 3;
    die "No method createNodeWithValueNodes takes " . scalar(@arguments) . " arguments";
}

sub createNodeWithValueNodes_j3 {
    my ($invocant, @arguments) = @_;
    return $invocant->createNodeWithValueNodes_j3_1(@arguments) if 1 && (!defined($arguments[0]) || (ref($arguments[0]) && ref($arguments[0]) ne 'ARRAY')) && !ref($arguments[1]) && (!defined($arguments[2]) || (ref($arguments[2]) && ref($arguments[2]) ne 'ARRAY'));
    return $invocant->createNodeWithValueNodes_j3_2(@arguments);
}

use java::lang::Object ();
use java::util::HashMap ();
use java::util::Set ();
use org::allbinary::util::BasicArrayList ();
use org::allbinary::util::BasicArrayListD ();
use org::allbinary::logic::java::anyType::clazz::ClassUtil ();
use org::allbinary::logic::string::StringUtil ();
use org::allbinary::string::CommonSeps ();
use org::w3c::dom::Document ();
use org::w3c::dom::Node ();
use org::allbinary::data::tree::dom::DomData ();

1;

