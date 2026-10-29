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

package org::allbinary::business::user::commerce::shipping::ShippingMethodsFactory;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $SHIPPINGMETHODSFILEPATHSTRING = undef;
our $SHIPPINGMETHODSFILENAME = "shippingMethods.xml";

sub _init_fields {
    my ($self) = @_;
    $self->{defaultShippingMethodInterface} = undef;
    $self->{document} = undef;
    $self->{shippingVector} = undef;
}


{ # Java static initializer
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $sep = 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR};
        $stringBuffer->append($sep);
        $stringBuffer->append("generic");
        $stringBuffer->append($sep);
        $stringBuffer->append("shipping");
        $stringBuffer->append($sep);
        $SHIPPINGMETHODSFILEPATHSTRING = $stringBuffer->toString();
}


sub new {
    my ($class, $abeClientInformation, $storeFrontInterface) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        my $sep = 'org::allbinary::logic::io::path::AbPathData'->getInstance()->{SEPARATOR};
        $stringBuffer->append('org::allbinary::globals::URLGLOBALS'->getMainPath());
        $stringBuffer->append('org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{XSLPATH});
        $stringBuffer->append($storeFrontInterface->getName());
        $stringBuffer->append($sep);
        $stringBuffer->append($org::allbinary::business::user::commerce::shipping::ShippingMethodsFactory::SHIPPINGMETHODSFILEPATHSTRING);
        my $abPath = 'org::allbinary::logic::io::path::AbPath'->new($stringBuffer->toString(), $SHIPPINGMETHODSFILENAME);
        my $data = 'org::allbinary::logic::control::crypt::file::CryptFileReader'->new('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance()->{UNCRYPTED_EXTENSION}, 'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance()->{ENCRYPTED_EXTENSION})->get($abPath);
        $self->{document} = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($data);
        $self->{shippingVector} = 'org::allbinary::util::BasicArrayListD'->new();
        my $nodeList = $self->{document}->getElementsByTagName($org::allbinary::business::user::commerce::shipping::ShippingMethodsData::NAME);
        for (my $index = 0; $index < $nodeList->getLength(); $index++) {
            my $node = $nodeList->item($index);
            my $shippingMethodNodeChildren = $node->getChildNodes();
            my $shippingMethodNameNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::business::user::commerce::shipping::ShippingMethodData::NAME, $shippingMethodNodeChildren);
            my $classNameNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::business::DynamicObjectData::NAME, $shippingMethodNameNode->getChildNodes());
            my $shippingMethodClassName = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($classNameNode);
            my $shippingMethodInterface = 'org::allbinary::logic::system::loader::AbeFactory'->getInstance()->getInstance($abeClientInformation, $shippingMethodClassName);
            $self->{shippingVector}->add($shippingMethodInterface);
            my $defaultShippingMethodNameNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::business::user::commerce::shipping::ShippingMethodData::DEFAULT, $shippingMethodNameNode->getChildNodes());
            my $defaultShippingMethodNameNodeValue = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($defaultShippingMethodNameNode);
            if (defined($defaultShippingMethodNameNodeValue) && ($defaultShippingMethodNameNodeValue cmp $org::allbinary::business::user::commerce::shipping::ShippingMethodData::DEFAULT) == 0) {
                $self->{defaultShippingMethodInterface} = $shippingMethodInterface;
            }
        }
        if ($self->{shippingVector}->size() < 1) {
            $self->{defaultShippingMethodInterface} = 'org::allbinary::business::user::commerce::shipping::modules::BasicWeightShippingModuleView'->new();
            $self->{shippingVector}->add($self->{defaultShippingMethodInterface});
            $self->{shippingVector}->add('org::allbinary::business::user::commerce::shipping::modules::NoShippingModuleView'->new());
        }
    return $self;
}


# throws Exception
sub getInstance {
    my ($self) = @_;
        return $self->{shippingVector};
}


sub getDefaultInstance {
    my ($self) = @_;
        return $self->{defaultShippingMethodInterface};
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::business::DynamicObjectData;
use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::commerce::shipping::modules::BasicWeightShippingModuleView;
use org::allbinary::business::user::commerce::shipping::modules::NoShippingModuleView;
use org::allbinary::business::user::commerce::shipping::modules::ShippingInterface;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::globals::FREEBLISKET_PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::control::crypt::file::CryptFileReader;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::io::path::AbPathData;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::system::loader::AbeFactory;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::business::user::commerce::shipping::ShippingMethodsData;
use org::allbinary::business::user::commerce::shipping::ShippingMethodData;

1;

