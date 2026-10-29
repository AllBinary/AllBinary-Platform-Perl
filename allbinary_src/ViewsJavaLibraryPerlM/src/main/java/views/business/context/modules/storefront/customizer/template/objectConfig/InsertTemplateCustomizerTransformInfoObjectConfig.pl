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

package views::business::context::modules::storefront::customizer::template::objectConfig::InsertTemplateCustomizerTransformInfoObjectConfig;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::customizer::template::objectConfig::NoTemplateTransformInfoObjectConfig';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    die "No constructor of InsertTemplateCustomizerTransformInfoObjectConfig takes " . scalar(@arguments) . " arguments";
}


sub _new1 {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
    return $self;
}


sub _new2 {
    my ($class, $transformInfoInterface, $document) = @_;
    my $self = $class->SUPER::new($transformInfoInterface, $document);
    $self->_init_fields();
        # super(...) made $self above
        $self->setDocument($self->generate($self->toXmlDoc()));
    return $self;
}


sub _new3 {
    my ($class, $transformInfoInterface, $name, $type) = @_;
    my $self = $class->SUPER::new($transformInfoInterface, $name, $type);
    $self->_init_fields();
        # super(...) made $self above
        $self->setDocument($self->generate($self->toXmlDoc()));
    return $self;
}


# throws Exception
sub set {
    my ($self, $aParentViewName) = @_;
        if ($views::business::context::modules::storefront::customizer::template::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::template::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Setting: " . $aParentViewName, $self, "set()");
        }
        my $document = $self->toXmlDoc();
        my $parentComponentsNodeList = $document->getElementsByTagName('org::allbinary::logic::visual::transform::info::TransformInfosData'->getInstance()->{NAME});
        if (defined($parentComponentsNodeList) && $parentComponentsNodeList->getLength() > 0) {
            if ($views::business::context::modules::storefront::customizer::template::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::template::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Replacing", $self, "set()");
            }
            my $componentNode = $parentComponentsNodeList->item(0)->getChildNodes()->item(0);
            if (defined($componentNode)) {
                $document->removeChild($componentNode);
            }
            $parentComponentsNodeList->item(0)->appendChild('org::allbinary::logic::visual::transform::info::TransformInfoDomNodeView'->new($aParentViewName)->toXmlNode($document));
        } else {
            if ($views::business::context::modules::storefront::customizer::template::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::template::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
                $self->{logUtil}->putF("Setting", $self, "set()");
            }
            my $objectConfigNode = $document->getElementsByTagName('org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance()->{NAME})->item(0);
            my $parentComponentsNode = $document->createElement('org::allbinary::logic::visual::transform::info::TransformInfosData'->getInstance()->{NAME});
            $objectConfigNode->appendChild($parentComponentsNode);
            my $transformInfoDomNodeView = 'org::allbinary::logic::visual::transform::info::TransformInfoDomNodeView'->new($aParentViewName);
            $parentComponentsNode->appendChild($transformInfoDomNodeView->toXmlNode($document));
        }
}

use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::visual::transform::info::TransformInfoDomNodeView;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::info::TransformInfosData;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use org::w3c::dom::NodeList;
use views::business::context::modules::storefront::customizer::template::objectConfig::NoTemplateTransformInfoObjectConfig;

1;

