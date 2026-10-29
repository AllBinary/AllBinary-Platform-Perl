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

package org::allbinary::logic::communication::http::request::NameSpaceRequestParam;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{nameSpaceVector} = undef;
    $self->{nameSpacePropertiesHashMap} = undef;
    $self->{value} = undef;
}


sub new {
    my ($class, $nameSpace, $value) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
        $self->{nameSpaceVector} = 'org::allbinary::util::BasicArrayListD'->new();
        $self->{nameSpacePropertiesHashMap} = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        $self->{value} = $value;
        my $beginIndex = index($nameSpace, $org::allbinary::logic::communication::http::request::NameSpaceRequestParamData::NAME);
        if ($beginIndex < 0) {
            die ("Not a NameSpaceRequest");
        }
        my $packages = substr($nameSpace, $beginIndex + $org::allbinary::logic::communication::http::request::NameSpaceRequestParamData::NAME->length() + $org::allbinary::logic::communication::http::request::NameSpaceRequestParamData::SEP->length());
        my $sepTokenizer = 'org::allbinary::logic::string::tokens::Tokenizer'->new($org::allbinary::logic::communication::http::request::NameSpaceRequestParamData::SEP);
        my $nameSpaceWithPropertiesVector = $sepTokenizer->getTokensFromString($packages, 'org::allbinary::util::BasicArrayListD'->new());
        if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
            $self->{logUtil}->putF("\nSep Tokens: " . $nameSpaceWithPropertiesVector->toString(), $self, "NameSpaceRequestParam()");
        }
        my $nameSpaceAndPropertiesTokenizer = 'org::allbinary::logic::string::tokens::Tokenizer'->new($org::allbinary::logic::communication::http::request::NameSpaceRequestParamData::PROPERTIES);
        my $packageIndex = 0;
        my $list = 'org::allbinary::util::BasicArrayListD'->new();
        my $index = 0;
        my $size = $nameSpaceWithPropertiesVector->size();
        while ($index < $size) {
            my $nameSpaceWithProperties = $nameSpaceWithPropertiesVector->get($index++);
            $list->clear();
            my $nameSpaceAndPropertiesVector = $nameSpaceAndPropertiesTokenizer->getTokensFromString($nameSpaceWithProperties, $list);
            if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                $self->{logUtil}->putF("\nPackageName and PackageName Properties Tokens: " . $nameSpaceAndPropertiesVector->toString(), $self, "NameSpaceRequestParam()");
            }
            if ($nameSpaceAndPropertiesVector->size() > 0) {
                my $packageName = $nameSpaceAndPropertiesVector->get(0);
                if (!defined($packageName)) {
                    die ("Package Name Is Null");
                }
                $self->{nameSpaceVector}->add($packageName);
                if ($nameSpaceAndPropertiesVector->size() > 1) {
                    my $properties = $nameSpaceAndPropertiesVector->get(1);
                    my $packagePropertiesHashMap = $self->generatePackagePropertiesHashMap($properties);
                    $self->{nameSpacePropertiesHashMap}->put(("" . ($packageIndex)), $packagePropertiesHashMap);
                }
                $packageIndex++;
            }
        }
        if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
            $self->{logUtil}->putF("NameSpace: " . $self->{nameSpaceVector}->toString(), $self, "NameSpaceRequestParam()");
        }
    return $self;
}


sub getPackages {
    my ($self) = @_;
        if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
            $self->{logUtil}->putF("NameSpace: " . $self->{nameSpaceVector}->toString(), $self, "getPackages()");
        }
        return $self->{nameSpaceVector};
}


sub getPackageProperties {
    my ($self, $packageIndex) = @_;
        my $packagePropertiesHashMap = $self->{nameSpacePropertiesHashMap}->get(("" . ($packageIndex)));
        if (!defined($packagePropertiesHashMap)) {
            $packagePropertiesHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        }
        if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
            $self->{logUtil}->putF("Package Properties: " . $packagePropertiesHashMap->toString(), $self, "getPackagesProperties()");
        }
        return $packagePropertiesHashMap;
}


sub getValue {
    my ($self) = @_;
        if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
            $self->{logUtil}->putF("\nValue: " . $self->{value}, $self, "getValue()");
        }
        return $self->{value};
}


# throws Exception
sub generatePackagePropertiesHashMap {
    my ($self, $properties) = @_;
        my $propertiesTokenizer = 'org::allbinary::logic::string::tokens::Tokenizer'->new($org::allbinary::logic::communication::http::request::NameSpaceRequestParamData::PROPERTIESSEPARATOR);
        my $packagePropertiesHashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $propertyVector = $propertiesTokenizer->getTokensFromString($properties, 'org::allbinary::util::BasicArrayListD'->new());
        my $list = 'org::allbinary::util::BasicArrayListD'->new();
        my $propertyTokenizer = 'org::allbinary::logic::string::tokens::Tokenizer'->new('org::allbinary::logic::visual::dhtml::html::name::HtmlNameMathData'->getInstance()->{EQUALS});
        my $index = 0;
        my $size = $propertyVector->size();
        while ($index < $size) {
            my $property = $propertyVector->get($index);
            $list->clear();
            my $propertyNameValueVector = $propertyTokenizer->getTokensFromString($property, $list);
            my $index2 = 0;
            while ($index2 < $propertyNameValueVector->size()) {
                my $propertyName = $propertyNameValueVector->get($index2++);
                if ($propertyNameValueVector->size() > 1) {
                    my $propertyValue = $propertyNameValueVector->get($index2++);
                    if ($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::communication::http::request::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{HTTPREQUEST})) {
                        $self->{logUtil}->putF("\nProperty Name: " . $propertyName . "\nProperty Value: " . $propertyValue, $self, "generatePackagePropertiesHashMap()");
                    }
                    $packagePropertiesHashMap->put($propertyName, $propertyValue);
                } else {
                    $packagePropertiesHashMap->put($propertyName, 'org::allbinary::logic::string::StringUtil'->getInstance()->{EMPTY_STRING});
                }
            }
        }
        return $packagePropertiesHashMap;
}

use java::util::HashMap;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::tokens::Tokenizer;
use org::allbinary::logic::visual::dhtml::html::name::HtmlNameMathData;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::communication::http::request::NameSpaceRequestParamData;

1;

