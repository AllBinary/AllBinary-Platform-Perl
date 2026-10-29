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

package org::allbinary::business::user::commerce::money::tax::modules::SimpleStateTaxModule;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::business::user::commerce::money::tax::modules::TaxModuleInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{streetAddress} = undef;
    $self->{storeFrontInterface} = undef;
    $self->{ALL} = 'org::allbinary::string::CommonPhoneStrings'->getInstance()->{STAR};
    $self->{STATETAXPATH} = "/generic/taxes/";
    $self->{STATETAXFILE} = "stateTaxation.xml";
    $self->{document} = undef;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub getTaxRate {
    my ($self, $streetAddress, $storeFrontInterface) = @_;
        $self->{streetAddress} = $streetAddress;
        $self->{storeFrontInterface} = $storeFrontInterface;
        my $fileAbPath = 'org::allbinary::logic::io::path::AbPath'->new('org::allbinary::globals::URLGLOBALS'->getMainPath() + 'org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{XSLPATH} . $self->{storeFrontInterface}->getName() . $self->{STATETAXPATH}, $self->{STATETAXFILE});
        my $data = 'org::allbinary::logic::control::crypt::file::CryptFileReader'->new('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance()->{UNCRYPTED_EXTENSION}, 'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance()->{ENCRYPTED_EXTENSION})->get($fileAbPath);
        $self->{document} = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($data);
        if ($org::allbinary::business::user::commerce::money::tax::modules::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::money::tax::modules::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAX})) {
            $self->{logUtil}->putF("Tax Doc: " . 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($self->{document}), $self, "getTaxRate");
        }
        my $state = $self->{streetAddress}->getState();
        my $country = $self->{streetAddress}->getCountry();
        $state = uc($state);
        my $nodeList = $self->{document}->getElementsByTagName($org::allbinary::business::user::commerce::money::tax::components::TaxData::NAME);
        for (my $index = 0; $index < $nodeList->getLength(); $index++) {
            my $node = $nodeList->item($index);
            my $taxNodeChildren = $node->getChildNodes();
            my $streetAddressNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::business::user::address::StreetAddressData::NAME, $taxNodeChildren);
            my $taxableStreetAddress = 'org::allbinary::business::user::address::StreetAddress'->new($streetAddressNode);
            my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
            if (!$stringValidationUtil->isEmpty($country) && !$stringValidationUtil->isEmpty($taxableStreetAddress->getCountry()) && ($country cmp $taxableStreetAddress->getCountry()) == 0) {
                if (defined($state) && defined($taxableStreetAddress->getState()) && ($state cmp $taxableStreetAddress->getState()) == 0) {
                    my $rateNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::business::user::commerce::money::tax::components::TaxData::RATE, $taxNodeChildren);
                    my $taxRate = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($rateNode);
                    my $taxRateFloat = $taxRate * .01;
                    return $taxRateFloat;
                }
            }
        }
        return 0;
}


sub isValid {
    my ($self, $streetAddress, $storeFrontInterface) = @_;
        try {
            $self->{streetAddress} = $streetAddress;
            $self->{storeFrontInterface} = $storeFrontInterface;
            my $fileAbPath = 'org::allbinary::logic::io::path::AbPath'->new('org::allbinary::globals::URLGLOBALS'->getMainPath() + 'org::allbinary::globals::FREEBLISKET_PATH_GLOBALS'->getInstance()->{XSLPATH} . $self->{storeFrontInterface}->getName() . $self->{STATETAXPATH}, $self->{STATETAXFILE});
            my $data = 'org::allbinary::logic::control::crypt::file::CryptFileReader'->new('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance()->{UNCRYPTED_EXTENSION}, 'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance()->{ENCRYPTED_EXTENSION})->get($fileAbPath);
            $self->{document} = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($data);
            if ($org::allbinary::business::user::commerce::money::tax::modules::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::money::tax::modules::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAX})) {
                $self->{logUtil}->putF("Tax Doc: " . 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($self->{document}), $self, $self->{commonStrings}->{IS_VALID});
            }
            my $country = $self->{streetAddress}->getCountry();
            my $rootNode = $self->{document}->getElementsByTagName('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance()->{NAME})->item(0);
            my $nodeList = $self->{document}->getElementsByTagName($org::allbinary::business::user::commerce::money::tax::components::TaxData::NAME);
            for (my $index = 0; $index < $nodeList->getLength(); $index++) {
                my $node = $nodeList->item($index);
                my $taxNodeChildren = $node->getChildNodes();
                my $streetAddressNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::business::user::address::StreetAddressData::NAME, $taxNodeChildren);
                if ($org::allbinary::business::user::commerce::money::tax::modules::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::money::tax::modules::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAX})) {
                    my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                    $stringBuffer->append("StreetAddress Node: ");
                    $stringBuffer->append($streetAddressNode->getNodeName());
                    $stringBuffer->append(" Value: ");
                    $stringBuffer->append($streetAddressNode->getNodeValue());
                    $stringBuffer->append(" Number Of Children: ");
                    $stringBuffer->appendint(int($streetAddressNode->getChildNodes()->getLength()));
                    $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{IS_VALID});
                }
                my $taxableStreetAddress = 'org::allbinary::business::user::address::StreetAddress'->new($streetAddressNode);
                my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
                if (!$stringValidationUtil->isEmpty($country) && !$stringValidationUtil->isEmpty($taxableStreetAddress->getCountry()) && $taxableStreetAddress->getCountry()->compareTo($self->{ALL}) == 0) {
                    return 1;
                }
                if (!$stringValidationUtil->isEmpty($country) && !$stringValidationUtil->isEmpty($taxableStreetAddress->getCountry()) && ($country cmp $taxableStreetAddress->getCountry()) == 0) {
                    my $state = $self->{streetAddress}->getState();
                    if (defined($state)) {
                        return 1;
                    }
                }
            }
            return 0;
        } catch ($e) {
            if ($org::allbinary::business::user::commerce::money::tax::modules::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::commerce::money::tax::modules::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to validate", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}

use org::allbinary::business::context::modules::storefront::StoreFrontInterface;
use org::allbinary::business::user::address::StreetAddress;
use org::allbinary::business::user::address::StreetAddressData;
use org::allbinary::business::user::commerce::money::tax::components::TaxData;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::globals::FREEBLISKET_PATH_GLOBALS;
use org::allbinary::globals::URLGLOBALS;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::crypt::file::CryptFileReader;
use org::allbinary::logic::io::path::AbPath;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData;
use org::allbinary::string::CommonPhoneStrings;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use org::allbinary::business::user::commerce::money::tax::modules::TaxModuleInterface;

1;

