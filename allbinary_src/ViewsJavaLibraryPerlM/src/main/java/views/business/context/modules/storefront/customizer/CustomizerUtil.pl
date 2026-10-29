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

package views::business::context::modules::storefront::customizer::CustomizerUtil;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';

our $instance = 'views::business::context::modules::storefront::customizer::CustomizerUtil'->new();

sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub getInstance {
    my ($class) = @_;
        return $views::business::context::modules::storefront::customizer::CustomizerUtil::instance;
}


sub new {
    my ($class) = @_;
    my $self = bless({}, $class);
    $self->_init_fields();
    return $self;
}


# throws Exception
sub getTransformInfoInterfaceToCustomize {
    my ($self, $customizerTransformInfoInterface, $transformInfoInterface) = @_;
        if ($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("View Name: " . $customizerTransformInfoInterface->getName(), $self, "getTransformInfoInterfaceToCustomize()");
        }
        my $transformInfoEntityInterface = 'org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder'->getInstance();
        my $viewName = $transformInfoInterface->getName();
        my $httpTransformInfoInterface = $customizerTransformInfoInterface;
        my $customizedTransformInfoInterface = $transformInfoEntityInterface->get($viewName, $httpTransformInfoInterface->getPropertiesHashMap(), $httpTransformInfoInterface->getPageContext());
        return $customizedTransformInfoInterface;
}


# throws Exception
sub getTransformInfoObjectConfigComponentNodesToCustomize {
    my ($self, $customizerTransformInfoInterface, $transformInfoInterface) = @_;
        if ($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("View Name: " . $customizerTransformInfoInterface->getName(), $self, "getTransformInfoObjectConfigComponentNodesToCustomize()");
        }
        my $transformInfoEntityInterface = 'org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder'->getInstance();
        my $viewName = $transformInfoInterface->getName();
        my $httpTransformInfoInterface = $customizerTransformInfoInterface;
        my $customizedTransformInfoInterface = $transformInfoEntityInterface->get($viewName, $httpTransformInfoInterface->getPropertiesHashMap(), $httpTransformInfoInterface->getPageContext());
        return $self->getTransformInfoObjectConfigComponentNodes($customizedTransformInfoInterface);
}


# throws Exception
sub getTransformInfoObjectConfigComponentNodes {
    my ($self, $transformInfoInterface) = @_;
        if ($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("View Name: " . $transformInfoInterface->getName(), $self, "getTransformInfoObjectConfigComponentNodes()");
        }
        my $transformInfoObjectConfigInterface = $transformInfoInterface->getObjectConfigInterface();
        return $transformInfoObjectConfigInterface->getTransforms();
}


# throws Exception
sub getTransformInfoObjectConfigGroupComponentNodes {
    my ($self, $transformInfoInterface) = @_;
        if ($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("View Name: " . $transformInfoInterface->getName(), $self, "getTransformInfoObjectConfigComponentNodes()");
        }
        my $transformInfoObjectConfigInterface = $transformInfoInterface->getObjectConfigInterface();
        return $transformInfoObjectConfigInterface->getGroupTransforms();
}


# throws Exception
sub insert {
    my ($self, $transformInfoInterface, $domNodeInterface) = @_;
        if ($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("View Name: " . $transformInfoInterface->getName(), $self, "insert()");
        }
        my $transformInfoEntityInterface = 'org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder'->getInstance();
        my $allViewsToBeModified = $self->getTransformInfoObjectConfigGroupComponentNodes($transformInfoInterface);
        my $document = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create();
        $document->appendChild($domNodeInterface->toXmlNode($document));
        my $documentString = 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($document);
        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
        if ($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $stringBuffer->append("Total Views For Modification: ");
            $stringBuffer->appendint($allViewsToBeModified->size());
            $stringBuffer->append(" New Xml/Data: ");
            $stringBuffer->append($documentString);
            $self->{logUtil}->putF($stringBuffer->toString(), $self, "insert()");
        }
        $transformInfoInterface->setData($documentString);
        my $size = $allViewsToBeModified->size();
        for (my $index = 0; $index < $size; $index++) {
            my $transformInfo = $allViewsToBeModified->get($index);
            my $viewNameOfViewToBeModified = $transformInfo->getName();
            if ($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $stringBuffer->delete(0, $stringBuffer->length());
                $stringBuffer->append($transformInfoInterface->getName());
                $stringBuffer->append(" is modifying view: ");
                $stringBuffer->append($viewNameOfViewToBeModified);
                $self->{logUtil}->putF($stringBuffer->toString(), $self, "insert()");
            }
            my $httpTransformInfoInterface = $transformInfoInterface;
            my $specifiedTransformInfoInterface = $transformInfoEntityInterface->get($viewNameOfViewToBeModified, $httpTransformInfoInterface->getPropertiesHashMap(), $httpTransformInfoInterface->getPageContext());
            if (!defined($specifiedTransformInfoInterface)) {
                if ($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $stringBuffer->delete(0, $stringBuffer->length());
                    $stringBuffer->append($transformInfoInterface->getName());
                    $stringBuffer->append(" is unable to add data to view: ");
                    $stringBuffer->append($viewNameOfViewToBeModified);
                    $stringBuffer->append(" since it does not exist");
                    $self->{logUtil}->putF($stringBuffer->toString(), $self, "insert()");
                }
            } else {
                if ($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $self->{logUtil}->putF($transformInfoInterface->getName() . " is adding data to view: " . $viewNameOfViewToBeModified, $self, "insert()");
                }
                if ($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    $stringBuffer->delete(0, $stringBuffer->length());
                    $stringBuffer->append($viewNameOfViewToBeModified);
                    $stringBuffer->append(" is changing data in ");
                    $stringBuffer->append($specifiedTransformInfoInterface->getDataFilePath()->toString());
                    $stringBuffer->append(" to the following data:\n");
                    $stringBuffer->append($documentString);
                    $self->{logUtil}->putF($stringBuffer->toString(), $self, "insert()");
                }
                $self->write($specifiedTransformInfoInterface, $documentString);
            }
        }
}


# throws Exception
sub write {
    my ($self, $specifiedTransformInfoInterface, $documentString) = @_;
        if ($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("View Name: " . $specifiedTransformInfoInterface->getName(), $self, "write()");
        }
        my $transformInfoEntityInterface = 'org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder'->getInstance();
        $specifiedTransformInfoInterface->setData($documentString);
        $transformInfoEntityInterface->update($specifiedTransformInfoInterface->toHashMap());
}


# throws Exception
sub getViewDataForComponentsInObjectConfig {
    my ($self, $transformInfoInterface) = @_;
        if ($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("View Name: " . $transformInfoInterface->getName(), $self, "getViewDataForComponentsInObjectConfig()");
        }
        my $transformInfoObjectConfigInterface = $transformInfoInterface->getObjectConfigInterface();
        my $allViewsToBeModified = $transformInfoObjectConfigInterface->getGroupTransforms();
        my $transformInfoEntityInterface = 'org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder'->getInstance();
        my $size = $allViewsToBeModified->size();
        for (my $index = 0; $index < $size; $index++) {
            my $nextTransformInfoInterface = $allViewsToBeModified->get($index);
            my $viewNameOfViewToBeModified = $nextTransformInfoInterface->getName();
            my $httpTransformInfoInterface = $transformInfoInterface;
            my $specifiedTransformInfoInterface = $transformInfoEntityInterface->get($viewNameOfViewToBeModified, $httpTransformInfoInterface->getPropertiesHashMap(), $httpTransformInfoInterface->getPageContext());
            return $specifiedTransformInfoInterface->getDataDocument();
        }
        die ("No Components Specified in ObjectConfig");
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::data::tables::transform::info::TransformInfoEntity;
use org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::document::DomDocumentHelper;
use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::transform::info::TransformInfo;
use org::allbinary::logic::visual::transform::info::TransformInfoHttpInterface;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigInterface;
use org::w3c::dom::Document;

1;

