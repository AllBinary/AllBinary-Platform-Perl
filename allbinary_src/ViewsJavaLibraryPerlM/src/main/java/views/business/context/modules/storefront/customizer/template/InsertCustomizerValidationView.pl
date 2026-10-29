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

#Sets Template Type
package views::business::context::modules::storefront::customizer::template::InsertCustomizerValidationView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::HttpStoreComponentView','org::allbinary::logic::control::validate::ValidationComponentInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{viewName} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        if ($views::business::context::modules::storefront::customizer::template::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::template::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("View Name: " . $transformInfoInterface->getName(), $self, $self->{commonStrings}->{CONSTRUCTOR});
        }
        my $requestHashMap = 'org::allbinary::logic::communication::http::request::RequestParams'->new($self->getPageContext())->toHashMap();
        $self->{viewName} = $requestHashMap->get('org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{NAME});
    return $self;
}


sub isValid {
    my ($self) = @_;
        try {
            if ($views::business::context::modules::storefront::customizer::template::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::template::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Started Validation", $self, $self->{commonStrings}->{IS_VALID});
            }
            my $isValid = 1;
            if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($self->{viewName})) {
                $isValid = 0;
            } else {
                my $objectConfig = 'views::business::context::modules::storefront::customizer::template::objectConfig::NoTemplateTransformInfoObjectConfig'->new($self->getTransformInfoInterface(), $self->getTransformInfoInterface()->getObjectConfigInterface()->toXmlDoc());
                my $componentVector = $objectConfig->getGroupTransforms();
                my $size = $componentVector->size();
                if ($views::business::context::modules::storefront::customizer::template::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::template::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                    my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                    $stringBuffer->append("Pointing ");
                    $stringBuffer->appendint($componentVector->size());
                    $stringBuffer->append(" Components");
                    $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{IS_VALID});
                }
                for (my $index = 0; $index < $size; $index++) {
                    my $transformInfo = $componentVector->get($index);
                    my $transformInfoName = $transformInfo->getName();
                    if ($views::business::context::modules::storefront::customizer::template::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::template::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                        $self->{logUtil}->putF("Setting Template Component with ViewName: " . $transformInfoName, $self, $self->{commonStrings}->{IS_VALID});
                    }
                    my $componentInterface = 'org::allbinary::logic::visual::transform::TransformFactory'->getInstance()->getInstance($self->{abeClientInformation}, $transformInfoName, $self->getTransformInfoInterface());
                    my $templateViewObjectConfig = 'views::business::context::modules::storefront::customizer::template::objectConfig::InsertTemplateCustomizerTransformInfoObjectConfig'->new($componentInterface->getTransformInfoInterface(), $componentInterface->getTransformInfoInterface()->getObjectConfigInterface()->toXmlDoc());
                    my $storeName = $self->getTransformInfoInterface()->getStoreName();
                    my $endIndex = index($self->{viewName}, $storeName) + length($storeName);
                    my $storePrepend = substr($self->{viewName}, 0, ($endIndex) - (0));
                    my $viewNamePostfix = substr($self->{viewName}, $endIndex, (length($self->{viewName})) - ($endIndex));
                    my $newViewNameStringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                    $newViewNameStringBuffer->append($storePrepend);
                    my $commonSeps = 'org::allbinary::string::CommonSeps'->getInstance();
                    my $transformInfosData = 'org::allbinary::logic::visual::transform::info::TransformInfosData'->getInstance();
                    if (index($transformInfoName, $transformInfosData->{SMALL_PREVIEW}) >= 0) {
                        $newViewNameStringBuffer->append($commonSeps->{SPACE});
                        $newViewNameStringBuffer->append($transformInfosData->{SMALL_PREVIEW});
                    } elsif (index($transformInfoName, $transformInfosData->{PREVIEW}) >= 0) {
                        $newViewNameStringBuffer->append($commonSeps->{SPACE});
                        $newViewNameStringBuffer->append($transformInfosData->{PREVIEW});
                    }
                    $newViewNameStringBuffer->append($commonSeps->{SPACE});
                    $newViewNameStringBuffer->append($viewNamePostfix);
                    if (index($transformInfoName, $org::allbinary::logic::visual::transform::info::GeneratorTransformInfoData::NAME) >= 0) {
                        $newViewNameStringBuffer->append($commonSeps->{SPACE});
                        $newViewNameStringBuffer->append($org::allbinary::logic::visual::transform::info::GeneratorTransformInfoData::NAME);
                    }
                    my $newViewName = $newViewNameStringBuffer->toString();
                    if ($views::business::context::modules::storefront::customizer::template::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::template::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                        $stringBuffer->append("Template Component: ");
                        $stringBuffer->append($transformInfoName);
                        $stringBuffer->append("\n Now Pointing To View Name: ");
                        $stringBuffer->append($newViewName);
                        $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{IS_VALID});
                    }
                    $templateViewObjectConfig->set($newViewName);
                    if ($views::business::context::modules::storefront::customizer::template::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::template::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                        my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
                        $stringBuffer->append("Template Component: ");
                        $stringBuffer->append($transformInfoName);
                        $stringBuffer->append("\n with ObjectConfig: ");
                        $stringBuffer->append($templateViewObjectConfig->toString());
                        $self->{logUtil}->putF($stringBuffer->toString(), $self, $self->{commonStrings}->{IS_VALID});
                    }
                    $componentInterface->getTransformInfoInterface()->setObjectConfigInterface($templateViewObjectConfig);
                    my $updatedTransformInfoHashMap = $componentInterface->getTransformInfoInterface()->toHashMap();
                    'org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder'->getInstance()->update($updatedTransformInfoHashMap);
                }
            }
            return $isValid;
        } catch ($e) {
            if ($views::business::context::modules::storefront::customizer::template::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::template::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to validate", $self, $self->{commonStrings}->{IS_VALID}, $e);
            }
            return 0;
        }
}


sub validationInfo {
    my ($self) = @_;
        try {
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append("Error: Template Name Is Empty.");
            return $stringBuffer->toString();
        } catch ($e) {
            if ($views::business::context::modules::storefront::customizer::template::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::template::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put("Failed to generate validation error info", $self, "validationInfo()", $e);
            }
            return "Error Getting Validation Info";
        }
}


sub toValidationInfoDoc {
    my ($self) = @_;
        return undef;
}


sub toValidationInfoNode {
    my ($self, $document) = @_;
        return undef;
}


# throws Exception
sub view {
    my ($self) = @_;
        return $self->{views}->{ValidationOnlyTempUtil}->getInstance()->view($self);
}

use java::util::HashMap;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder;
use org::allbinary::logic::communication::http::request::RequestParams;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::validate::ValidationComponentInterface;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::visual::transform::TransformFactory;
use org::allbinary::logic::visual::transform::TransformInterface;
use org::allbinary::logic::visual::transform::info::GeneratorTransformInfoData;
use org::allbinary::logic::visual::transform::info::TransformInfo;
use org::allbinary::logic::visual::transform::info::TransformInfoData;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::info::TransformInfosData;
use org::allbinary::string::CommonSeps;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::business::context::modules::storefront::HttpStoreComponentView;
use views::business::context::modules::storefront::customizer::template::objectConfig::InsertTemplateCustomizerTransformInfoObjectConfig;
use views::business::context::modules::storefront::customizer::template::objectConfig::NoTemplateTransformInfoObjectConfig;

1;

