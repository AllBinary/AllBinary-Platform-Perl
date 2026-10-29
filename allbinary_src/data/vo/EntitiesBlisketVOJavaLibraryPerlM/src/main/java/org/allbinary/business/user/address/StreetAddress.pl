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

package org::allbinary::business::user::address::StreetAddress;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{id} = undef;
    $self->{name} = undef;
    $self->{street} = undef;
    $self->{city} = undef;
    $self->{state} = undef;
    $self->{code} = undef;
    $self->{country} = undef;
    $self->{isDefault} = 0;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new0(@arguments) if scalar(@arguments) == 0;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new6(@arguments) if scalar(@arguments) == 6;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    die "No constructor of StreetAddress takes " . scalar(@arguments) . " arguments";
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
        my $nameNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::business::user::address::StreetAddressData::NAME, $node->getChildNodes());
        $self->{name} = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($nameNode);
        my $streetNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::business::user::address::StreetAddressData::STREET, $node->getChildNodes());
        $self->{street} = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($streetNode);
        my $cityNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::business::user::address::StreetAddressData::CITY, $node->getChildNodes());
        $self->{city} = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($cityNode);
        my $stateNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::business::user::address::StreetAddressData::STATE, $node->getChildNodes());
        $self->{state} = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($stateNode);
        my $codeNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::business::user::address::StreetAddressData::CODE, $node->getChildNodes());
        $self->{code} = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($codeNode);
        my $countryNode = 'org::allbinary::data::tree::dom::DomSearchHelper'->getNode($org::allbinary::business::user::address::StreetAddressData::COUNTRY, $node->getChildNodes());
        $self->{country} = 'org::allbinary::data::tree::dom::DomNodeHelper'->getTextNodeValue($countryNode);
        $self->log();
    return $self;
}


sub _new1 {
    my ($class, $streetAddress) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{id} = $streetAddress->getId();
        $self->{name} = $streetAddress->getName();
        $self->{street} = $streetAddress->getStreet();
        $self->{city} = $streetAddress->getCity();
        $self->{state} = $streetAddress->getState();
        $self->{code} = $streetAddress->getCode();
        $self->{country} = $streetAddress->getCountry();
        $self->{isDefault} = $streetAddress->isDefault();
        $self->log();
    return $self;
}


sub _new1 {
    my ($class, $request) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->setId($request->getParameter($org::allbinary::business::user::address::StreetAddressData::ID));
        $self->setName($request->getParameter($org::allbinary::business::user::address::StreetAddressData::NAME));
        $self->setStreet($request->getParameter($org::allbinary::business::user::address::StreetAddressData::STREET));
        $self->setCity($request->getParameter($org::allbinary::business::user::address::StreetAddressData::CITY));
        $self->setState($request->getParameter($org::allbinary::business::user::address::StreetAddressData::STATE));
        $self->setCode($request->getParameter($org::allbinary::business::user::address::StreetAddressData::CODE));
        $self->setCountry($request->getParameter($org::allbinary::business::user::address::StreetAddressData::COUNTRY));
        $self->log();
    return $self;
}


sub _new6 {
    my ($class, $name, $street, $city, $state, $code, $country) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{name} = $name;
        $self->{street} = $street;
        $self->{city} = $city;
        $self->{state} = $state;
        $self->{code} = $code;
        $self->{country} = $country;
        $self->log();
    return $self;
}


sub _new1 {
    my ($class, $address) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{id} = $address->get($org::allbinary::business::user::address::StreetAddressData::ID);
        $self->{name} = $address->get($org::allbinary::business::user::address::StreetAddressData::NAME);
        $self->{street} = $address->get($org::allbinary::business::user::address::StreetAddressData::STREET);
        $self->{city} = $address->get($org::allbinary::business::user::address::StreetAddressData::CITY);
        $self->{state} = $address->get($org::allbinary::business::user::address::StreetAddressData::STATE);
        $self->{code} = $address->get($org::allbinary::business::user::address::StreetAddressData::CODE);
        $self->{country} = $address->get($org::allbinary::business::user::address::StreetAddressData::COUNTRY);
        my $def = $address->get($org::allbinary::business::user::address::StreetAddressData::DEFAULT);
        if (defined($def) && ($def cmp $org::allbinary::business::user::address::StreetAddressData::DEFAULT) == 0) {
            $self->{isDefault} = 1;
        } else {
            $self->{isDefault} = 0;
        }
        $self->log();
    return $self;
}


sub log {
    my ($self) = @_;
        if ($org::allbinary::business::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGING})) {
            $self->{logUtil}->putF("Created Address: \n" . $self->toHashMap(), $self, "log");
        }
}


sub setId {
    my ($self, $id) = @_;
        $self->{id} = $id;
}


sub setName {
    my ($self, $name) = @_;
        $self->{name} = $name;
}


sub setStreet {
    my ($self, $value) = @_;
        $self->{street} = $value;
}


sub setCity {
    my ($self, $value) = @_;
        $self->{city} = $value;
}


sub setState {
    my ($self, $value) = @_;
        $self->{state} = $value;
}


sub setCode {
    my ($self, $value) = @_;
        $self->{code} = $value;
}


sub setCountry {
    my ($self, $value) = @_;
        $self->{country} = $value;
}


sub getName {
    my ($self) = @_;
        return $self->{name};
}


sub getStreet {
    my ($self) = @_;
        return $self->{street};
}


sub getCity {
    my ($self) = @_;
        return $self->{city};
}


sub getState {
    my ($self) = @_;
        return $self->{state};
}


sub getCode {
    my ($self) = @_;
        return $self->{code};
}


sub getCountry {
    my ($self) = @_;
        return $self->{country};
}


sub getId {
    my ($self) = @_;
        return $self->{id};
}


sub isDefault {
    my ($self) = @_;
        return $self->{isDefault};
}


sub isEmpty {
    my ($self) = @_;
        my $EMPTY_STRING = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        if (!defined($self->getName()) && $self->getName()->compareTo($EMPTY_STRING) == 0 && !defined($self->getStreet()) && $self->getStreet()->compareTo($EMPTY_STRING) == 0 && !defined($self->getCity()) && $self->getCity()->compareTo($EMPTY_STRING) == 0 && !defined($self->getState()) && $self->getState()->compareTo($EMPTY_STRING) == 0 && !defined($self->getCode()) && $self->getCode()->compareTo($EMPTY_STRING) == 0 && !defined($self->getCountry()) && $self->getCountry()->compareTo($EMPTY_STRING) == 0) {
            return 1;
        }
        return 0;
}


sub isValid {
    my ($self) = @_;
        my $EMPTY_STRING = 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING};
        if (!defined($self->getName()) || $self->getName()->compareTo($EMPTY_STRING) == 0 || !defined($self->getStreet()) || $self->getStreet()->compareTo($EMPTY_STRING) == 0 || !defined($self->getCity()) || $self->getCity()->compareTo($EMPTY_STRING) == 0 || !defined($self->getState()) || $self->getState()->compareTo($EMPTY_STRING) == 0 || !defined($self->getCode()) || $self->getCode()->compareTo($EMPTY_STRING) == 0 || !defined($self->getCountry()) || $self->getCountry()->compareTo($EMPTY_STRING) == 0) {
            return 0;
        }
        return 1;
}


sub validationInfo {
    my ($self) = @_;
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append("Address Failed To Validate - All fields must contain data.<br></br>");
        my $stringValidationUtil = 'org::allbinary::logic::string::StringValidationUtil'->getInstance();
        if (!$stringValidationUtil->isValidRequired($self->getName(), $org::allbinary::business::user::address::StreetAddressData::MIN, $org::allbinary::business::user::address::StreetAddressData::MAX)) {
            $stringBuffer->append("Please enter a valid name");
            $stringBuffer->append("<br></br>");
        }
        if (!$stringValidationUtil->isValidRequired($self->getStreet(), $org::allbinary::business::user::address::StreetAddressData::MIN, $org::allbinary::business::user::address::StreetAddressData::MAX)) {
            $stringBuffer->append("Please enter a valid street");
            $stringBuffer->append("<br></br>");
        }
        if (!$stringValidationUtil->isValidRequired($self->getCity(), $org::allbinary::business::user::address::StreetAddressData::MIN, $org::allbinary::business::user::address::StreetAddressData::MAX)) {
            $stringBuffer->append("Please enter a valid city");
            $stringBuffer->append("<br></br>");
        }
        if (!$stringValidationUtil->isValidRequired($self->getState(), $org::allbinary::business::user::address::StreetAddressData::MIN, $org::allbinary::business::user::address::StreetAddressData::MAX)) {
            $stringBuffer->append("Please enter a valid state");
            $stringBuffer->append("<br></br>");
        }
        if (!$stringValidationUtil->isValidRequired($self->getCode(), $org::allbinary::business::user::address::StreetAddressData::MIN, $org::allbinary::business::user::address::StreetAddressData::MAX)) {
            $stringBuffer->append("Please enter a valid zipcode");
            $stringBuffer->append("<br></br>");
        }
        if (!$stringValidationUtil->isValidRequired($self->getCountry(), $org::allbinary::business::user::address::StreetAddressData::MIN, $org::allbinary::business::user::address::StreetAddressData::MAX)) {
            $stringBuffer->append("Please enter a valid country");
            $stringBuffer->append("<br></br>");
        }
        return $stringBuffer->toString();
}


sub toValidationInfoDoc {
    my ($self) = @_;
        return undef;
}


sub toValidationInfoNode {
    my ($self, $document) = @_;
        try {
            my $node = $document->createElement($org::allbinary::business::user::address::StreetAddressData::FORM);
            $node->appendChild($self->toXmlNode($document));
            return $node;
        } catch ($e) {
            if ($org::allbinary::business::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::business::user::address::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{SQLLOGGINGERROR})) {
                my $commonStrings = 'org::allbinary::string::CommonStrings'->getInstance();
                $self->{logUtil}->put($commonStrings->{EXCEPTION}, $self, "toValidationInfoNode", $e);
            }
            return undef;
        }
}


sub toHashMap {
    my ($self) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $hashMap->put($org::allbinary::business::user::address::StreetAddressData::ID, $self->{id});
        $hashMap->put($org::allbinary::business::user::address::StreetAddressData::NAME, $self->{name});
        $hashMap->put($org::allbinary::business::user::address::StreetAddressData::STREET, $self->{street});
        $hashMap->put($org::allbinary::business::user::address::StreetAddressData::CITY, $self->{city});
        $hashMap->put($org::allbinary::business::user::address::StreetAddressData::STATE, $self->{state});
        $hashMap->put($org::allbinary::business::user::address::StreetAddressData::CODE, $self->{code});
        $hashMap->put($org::allbinary::business::user::address::StreetAddressData::COUNTRY, $self->{country});
        return $hashMap;
}


# throws Exception
sub toXmlNode {
    my ($self, $document) = @_;
        my $stringUtil = 'org::allbinary::logic::string::StringUtil'->getInstance();
        my $hashMap = $self->toHashMap();
        my $keySet = $hashMap->keySet();
        my $keyArray = $keySet->toArray();
        my $size = scalar(@{$keyArray});
        my $node = $document->createElement($org::allbinary::business::user::address::StreetAddressData::ADDRESS);
        for (my $i = 0; $i < $size; $i++) {
            my $name = $keyArray->[$i];
            my $value = $stringUtil->getNonNull($hashMap->get($name));
            $node->appendChild('org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $name, $value));
        }
        return $node;
}

use java::util::HashMap;
# use java::util::Set;
# use javax::servlet::http::HttpServletRequest;
use org::allbinary::data::tree::dom::DomNodeHelper;
use org::allbinary::data::tree::dom::DomSearchHelper;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::allbinary::business::user::address::StreetAddressData;

1;

