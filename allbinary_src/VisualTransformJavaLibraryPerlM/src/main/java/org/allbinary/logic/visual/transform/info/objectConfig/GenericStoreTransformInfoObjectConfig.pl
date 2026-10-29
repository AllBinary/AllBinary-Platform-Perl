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

package org::allbinary::logic::visual::transform::info::objectConfig::GenericStoreTransformInfoObjectConfig;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfig';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{abeClientInformation} = undef;
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    return $class->_new4(@arguments) if scalar(@arguments) == 4;
    die "No constructor of GenericStoreTransformInfoObjectConfig takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $abeClientInformation, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{abeClientInformation} = $abeClientInformation;
    return $self;
}


sub _new3 {
    my ($class, $abeClientInformation, $transformInfoInterface, $document) = @_;
    my $self = $class->SUPER::new($transformInfoInterface, $document);
    $self->_init_fields();
        # super(...) made $self above
        $self->{abeClientInformation} = $abeClientInformation;
        $self->setDocument($self->generate($self->toXmlDoc()));
    return $self;
}


sub _new4 {
    my ($class, $abeClientInformation, $transformInfoInterface, $name, $type) = @_;
    my $self = $class->SUPER::new($transformInfoInterface, $name, $type);
    $self->_init_fields();
        # super(...) made $self above
        $self->{abeClientInformation} = $abeClientInformation;
        $self->setDocument($self->generate($self->toXmlDoc()));
    return $self;
}


# throws Exception
sub generate {
    my ($self, $objectConfigDocument) = @_;
        if ($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("TransformInfo: ");
            if (defined($self->getTransformInfoInterface())) {
                $stringBuffer->append($self->getTransformInfoInterface()->getName());
            } else {
                $stringBuffer->append("No Owner!?#\@");
            }
            $self->{logUtil}->putF($stringBuffer->toString(), $self, "generate()");
        }
        my $transformInfoHttpStoreInterface = $self->getTransformInfoInterface();
        my $objectConfigDocumentString = 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($objectConfigDocument);
        my $replaceHashMap = $self->createReplaceHashMap($transformInfoHttpStoreInterface, $objectConfigDocumentString);
        return $self->generate($objectConfigDocumentString, $replaceHashMap);
}


# throws Exception
sub createReplaceHashMap {
    my ($self, $transformInfoHttpStoreInterface, $objectConfigDocumentString) = @_;
        my $storeName = $transformInfoHttpStoreInterface->getStoreName();
        my $hashMap = $self->createHashMap($transformInfoHttpStoreInterface, $objectConfigDocumentString);
        my $transformInfoObjectConfigData = 'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance();
        $hashMap->put($transformInfoObjectConfigData->{VARKEY} + 'org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $storeName);
        my $pageName = 'org::allbinary::logic::visual::transform::template::util::TransformTemplateCustomizerUtil'->getInstance()->getPageNameHack($self->getTransformInfoInterface()->getName(), $storeName);
        $hashMap->put($transformInfoObjectConfigData->{VARKEY} + 'org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{PARTIAL}, $pageName);
        return $hashMap;
}


# throws Exception
sub createHashMap {
    my ($self, $transformInfoHttpStoreInterface, $objectConfigDocumentString) = @_;
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $storeName = $transformInfoHttpStoreInterface->getStoreName();
        my $propertiesHashMap = $transformInfoHttpStoreInterface->getPropertiesHashMap();
        my $templateNameOverride = 'org::allbinary::logic::string::StringUtil'->getInstance()->getNonNull($propertiesHashMap->get('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{PARTIAL}));
        if ($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("TemplateNameOverride: " . $templateNameOverride, $self, "generate()");
        }
        my $templateNameStringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $templateNameStringBuffer->append($storeName);
        $templateNameStringBuffer->append($templateNameOverride);
        $templateNameStringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
        $templateNameStringBuffer->append($org::allbinary::logic::visual::transform::info::RootTransformInfoData::NAME);
        my $templateNameKey = 'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance()->{VARKEY} + 'org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{OWNER};
        if (index($objectConfigDocumentString, $templateNameKey) != -1) {
            my $templateInterface = 'org::allbinary::logic::visual::transform::template::TransformTemplateFactory'->getInstance()->getInstance($self->{abeClientInformation}, $templateNameStringBuffer->toString(), $transformInfoHttpStoreInterface->getPropertiesHashMap(), $transformInfoHttpStoreInterface->getPageContext());
            my $selectedTemplate = $templateInterface->getName();
            $hashMap->put($templateNameKey, $selectedTemplate);
        }
        return $hashMap;
}


# throws Exception
# Java overloaded method: Perl keeps the last definition
sub generate {
    my ($self, $objectConfigDocumentString, $hashMap) = @_;
        my $replace = 'org::allbinary::logic::string::regex::replace::Replace'->new($hashMap);
        my $newObjectConfigDocument = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($replace->all($objectConfigDocumentString));
        if ($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($org::allbinary::logic::visual::transform::info::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Final ObjectConfig: " . 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($newObjectConfigDocument), $self, "generate()");
        }
        return $newObjectConfigDocument;
}

use java::util::HashMap;
use org::allbinary::business::context::modules::storefront::StoreFrontData;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::regex::replace::Replace;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::visual::transform::info::RootTransformInfoData;
use org::allbinary::logic::visual::transform::info::TransformInfoData;
use org::allbinary::logic::visual::transform::info::TransformInfoHttp;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::template::TransformTemplateFactory;
use org::allbinary::logic::visual::transform::template::TransformTemplateInterface;
use org::allbinary::logic::visual::transform::template::util::TransformTemplateCustomizerUtil;
use org::allbinary::string::CommonSeps;
use org::w3c::dom::Document;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfig;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData;

1;

