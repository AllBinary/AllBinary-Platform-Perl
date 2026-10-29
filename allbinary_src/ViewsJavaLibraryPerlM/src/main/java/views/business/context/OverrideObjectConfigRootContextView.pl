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

package views::business::context::OverrideObjectConfigRootContextView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::HttpStoreComponentView';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        if ($views::business::context::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("View Name: " . $transformInfoInterface->getName(), $self, "OverrideObjectRootContextView()");
        }
    return $self;
}


# throws Exception
sub view {
    my ($self) = @_;
        try {
            if ($views::business::context::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("View Name: " . $self->getTransformInfoInterface()->getName(), $self, "view()");
            }
            my $rootTransformInfoInterface = 'org::allbinary::logic::visual::transform::info::TransformInfoHttp'->new($self->getTransformInfoInterface());
            my $stringBuffer = 'org::allbinary::logic::string::StringMaker'->new();
            $stringBuffer->append($self->getTransformInfoInterface()->getStoreName());
            $stringBuffer->append('org::allbinary::string::CommonSeps'->getInstance()->{SPACE});
            my $nameStart = $stringBuffer->toString();
            if ($self->getTransformInfoInterface()->getName()->indexOf($org::allbinary::logic::visual::transform::info::GeneratorTransformInfoData::NAME) > 0) {
                $rootTransformInfoInterface->setName($nameStart . $org::allbinary::logic::visual::transform::info::GeneratorTransformInfoData::NAME);
            } elsif ($self->getTransformInfoInterface()->getName()->indexOf($org::allbinary::logic::visual::transform::info::RootTransformInfoData::NAME) > 0) {
                $rootTransformInfoInterface->setName($nameStart . $org::allbinary::logic::visual::transform::info::RootTransformInfoData::NAME);
            } else {
                die ("Override Currently Not Supported");
            }
            my $overrideObjectConfigDocument = $self->getTransformInfoInterface()->getObjectConfigInterface()->toXmlDoc();
            if ($views::business::context::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Retrieved OverrideObjectConfig: " . 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($overrideObjectConfigDocument), $self, "view()");
            }
            my $transformFactory = 'org::allbinary::logic::visual::transform::TransformFactory'->getInstance();
            my $rootComponentInterface = $transformFactory->getInstance($self->{abeClientInformation}, $rootTransformInfoInterface->getName(), $rootTransformInfoInterface);
            my $transformTemplateInterface = $rootComponentInterface;
            my $componentInterface = $transformFactory->getInstance($self->{abeClientInformation}, $transformTemplateInterface->getName(), $rootComponentInterface->getTransformInfoInterface());
            my $transformInfoObjectConfigInterface = 'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigAndManipulatorFactory'->getInstance()->getInstance($self->{abeClientInformation}, $componentInterface->getTransformInfoInterface(), $overrideObjectConfigDocument);
            $componentInterface->getTransformInfoInterface()->setObjectConfigInterface($transformInfoObjectConfigInterface);
            if ($views::business::context::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Set OverrideObjectConfig: " . $componentInterface->getTransformInfoInterface()->getObjectConfigInterface()->toString(), $self, "view()");
            }
            return $componentInterface->view();
        } catch ($e) {
            if ($views::business::context::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            die $e;
        }
}

use org::allbinary::data::tree::dom::document::XmlDocumentHelper;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringMaker;
use org::allbinary::logic::visual::transform::TransformFactory;
use org::allbinary::logic::visual::transform::TransformInterface;
use org::allbinary::logic::visual::transform::info::GeneratorTransformInfoData;
use org::allbinary::logic::visual::transform::info::RootTransformInfoData;
use org::allbinary::logic::visual::transform::info::TransformInfoHttp;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigAndManipulatorFactory;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigInterface;
use org::allbinary::logic::visual::transform::template::TransformTemplateInterface;
use org::allbinary::string::CommonSeps;
use org::w3c::dom::Document;
use views::business::context::modules::storefront::HttpStoreComponentView;

1;

