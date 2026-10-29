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

package views::business::context::RootContextView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::HttpStoreComponentView','org::allbinary::logic::visual::transform::template::TransformTemplateInterface';


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
            $self->{logUtil}->putF("View Name: " . $transformInfoInterface->getName(), $self, "RootContextView()");
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
            my $viewName = $self->getName();
            my $componentInterface = 'org::allbinary::logic::visual::transform::TransformFactory'->getInstance()->getInstance($self->{abeClientInformation}, $viewName, $self->getTransformInfoInterface());
            return $componentInterface->view();
        } catch ($e) {
            if ($views::business::context::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            die $e;
        }
}


# throws Exception
sub getName {
    my ($self) = @_;
        try {
            my $objectConfig = 'views::business::context::modules::storefront::customizer::template::objectConfig::NoTemplateTransformInfoObjectConfig'->new($self->getTransformInfoInterface(), $self->getTransformInfoInterface()->getObjectConfigInterface()->toXmlDoc());
            my $componentsVector = $objectConfig->getTransforms();
            if ($componentsVector->size() == 0) {
                die ("Template View Not Set - No Components");
            }
            if ($componentsVector->size() > 1) {
                die ("To Many Root Template Views: " . $componentsVector->size());
            }
            my $transformInfoInterface = $componentsVector->get(0);
            my $viewName = $transformInfoInterface->getName();
            if ($views::business::context::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Root Template With View Name: " . $viewName, $self, "getName()");
            }
            if ('org::allbinary::logic::string::StringValidationUtil'->getInstance()->isEmpty($viewName)) {
                die ("Template View Not Set - No View Name");
            }
            return $viewName;
        } catch ($e) {
            if ($views::business::context::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEWERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "getName()", $e);
            }
            die $e;
        }
}

use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::string::StringValidationUtil;
use org::allbinary::logic::visual::transform::TransformFactory;
use org::allbinary::logic::visual::transform::TransformInterface;
use org::allbinary::logic::visual::transform::info::TransformInfo;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::template::TransformTemplateInterface;
use views::business::context::modules::storefront::HttpStoreComponentView;
use views::business::context::modules::storefront::customizer::template::objectConfig::NoTemplateTransformInfoObjectConfig;

1;

