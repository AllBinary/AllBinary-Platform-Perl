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

package views::compound::objectConfig::CompoundContextTransformInfoObjectConfig;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::info::objectConfig::GenericStoreTransformInfoObjectConfig';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    return $class->_new4(@arguments) if scalar(@arguments) == 4;
    die "No constructor of CompoundContextTransformInfoObjectConfig takes " . scalar(@arguments) . " arguments";
}


sub _new2 {
    my ($class, $abeClientInformation, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($abeClientInformation, $transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub _new3 {
    my ($class, $abeClientInformation, $transformInfoInterface, $document) = @_;
    my $self = $class->SUPER::new($abeClientInformation, $transformInfoInterface, $document);
    $self->_init_fields();
        # super(...) made $self above
        $self->setDocument($self->generate($self->toXmlDoc()));
    return $self;
}


sub _new4 {
    my ($class, $abeClientInformation, $transformInfoInterface, $name, $type) = @_;
    my $self = $class->SUPER::new($abeClientInformation, $transformInfoInterface, $name, $type);
    $self->_init_fields();
        # super(...) made $self above
        $self->setDocument($self->generate($self->toXmlDoc()));
    return $self;
}


# throws Exception
sub get {
    my ($self) = @_;
        my $storeName = $self->getTransformInfoInterface()->getStoreName();
        my $httpTransformInfoInterface = $self->getTransformInfoInterface();
        my $templateNameOverride = 'org::allbinary::logic::string::StringUtil'->getInstance()->getNonNull($httpTransformInfoInterface->getPropertiesHashMap()->get('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{PARTIAL}));
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        $stringBuffer->append($storeName);
        $stringBuffer->append($templateNameOverride);
        $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
        $stringBuffer->append($org::allbinary::logic::visual::transform::info::RootTransformInfoData::NAME);
        my $rootComponentInterface = 'org::allbinary::logic::visual::transform::TransformFactory'->getInstance()->getInstance($self->{abeClientInformation}, $stringBuffer->toString(), $self->getTransformInfoInterface());
        my $viewVector = $self->getTransformDomNodes();
        if ($views::compound::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::compound::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Root View Called with: " . $viewVector->size(), $self, "get(transformInfoInterface)");
        }
        my $rootView = $rootComponentInterface->view();
        my $startXMLHeader = "<xsl:text disable-output-escaping=\"yes\" ><![CDATA[";
        my $endXMLHeader = "]]></xsl:text>";
        my $size = $viewVector->size();
        for (my $index = 0; $index < $size; $index++) {
            my $objectConfigTransformInfoDomNode = $viewVector->get($index);
            my $templateKey = $objectConfigTransformInfoDomNode->getReplaceKey();
            my $componentInterface = 'org::allbinary::logic::visual::transform::TransformFactory'->getInstance()->getInstance($self->{abeClientInformation}, $objectConfigTransformInfoDomNode->getTransformInfoInterface()->getName(), $self->getTransformInfoInterface());
            my $replacementViewString = $componentInterface->view();
            $replacementViewString = 'org::allbinary::data::tree::dom::document::DocumentToNode'->convertDocumentToNodeString($replacementViewString);
            $stringBuffer->delete(0, $stringBuffer->length());
            $stringBuffer->append($startXMLHeader);
            $stringBuffer->append($replacementViewString);
            $stringBuffer->append($endXMLHeader);
            my $templateValue = $stringBuffer->toString();
            if ($views::compound::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::compound::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $stringBuffer->delete(0, $stringBuffer->length());
                $stringBuffer->append("Replacing: ");
                $stringBuffer->append($templateKey);
                $stringBuffer->append(" with ");
                $stringBuffer->append($templateValue);
                $self->{logUtil}->putF($stringBuffer->toString(), $self, "get()");
            }
            my $replace = 'org::allbinary::logic::string::regex::replace::Replace'->new($templateKey, $templateValue);
            $rootView = $replace->all($rootView);
        }
        if ($views::compound::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::compound::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("End: Result of a compound view: " . $rootView, $self, "get()");
        }
        return $rootView;
}


# throws Exception
sub createInputStream {
    my ($self) = @_;
        my $completeTemplateViewBytes = $self->get()->getBytes();
        my $bais = 'java::io::ByteArrayInputStream'->new($completeTemplateViewBytes);
        if ($views::compound::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::compound::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Template: " . pack("C*", @{$completeTemplateViewBytes})->toString(), $self, "createInputStream()");
        }
        return $bais;
}

# use java::io::ByteArrayInputStream;
# use java::io::InputStream;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tree::dom::document::DocumentToNode;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringUtil;
use org::allbinary::logic::string::regex::replace::Replace;
use org::allbinary::logic::system::security::licensing::AbeClientInformationInterface;
use org::allbinary::logic::visual::transform::TransformFactory;
use org::allbinary::logic::visual::transform::TransformInterface;
use org::allbinary::logic::visual::transform::info::RootTransformInfoData;
use org::allbinary::logic::visual::transform::info::TransformInfoData;
use org::allbinary::logic::visual::transform::info::TransformInfoDomNode;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::info::objectConfig::GenericStoreTransformInfoObjectConfig;
use org::allbinary::string::CommonSeps;
use org::w3c::dom::Document;

1;

