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

package org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageTypes;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{vector} = 'org::allbinary::util::BasicArrayListD'->new();
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of ImageTypes takes " . scalar(@arguments) . " arguments";
}


sub _new0 {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


sub _new1 {
    my ($class, $node) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $nodeList = $node->getChildNodes();
        for (my $index = 0; $index < $nodeList->getLength(); $index++) {
            my $childNode = $nodeList->item($index);
            if ($childNode->getNodeName()->compareTo($org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputData::TYPE) == 0) {
                my $nextImageTypeString = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($childNode);
                $self->getVector()->add('org::allbinary::input::media::image::InputImageType'->getInstance($nextImageTypeString));
            } else {
                die ("ImageTypes Unknown Node");
            }
        }
    return $self;
}


sub valueOf {
    my ($class, $anyType) = @_;
        my $imageTypes = 'org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageTypes'->new();
        for (my $index = 0; $index < scalar(@{$anyType}); $index++) {
            my $imageType = 'org::allbinary::input::media::image::InputImageType'->getInstance($anyType->[$index]);
            $imageTypes->getVector()->add($imageType);
        }
        return $imageTypes;
}


sub getVector {
    my ($self) = @_;
        return $self->{vector};
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $newNode = $document->createElement($org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputData::TYPES);
        my $size = $self->{vector}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $imageType = $self->{vector}->get($index);
            $newNode->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createTextNode($document, $org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputData::TYPE, $imageType->getName()));
        }
        return $newNode;
}


sub toString {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("ImageTypes: ");
        my $size = $self->{vector}->size();
        for (my $index = 0; $index < $size; $index++) {
            my $imageType = $self->{vector}->get($index);
            $stringBuffer->append($imageType->getName());
            if ($index < $size - 1) {
                $stringBuffer->append(", ");
            }
        }
        return $stringBuffer->toString();
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::input::media::image::InputImageType;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::string::StringMaker;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::input::automation::module::actions::script::condition::processors::output::ImageActionScriptOutputData;

1;

