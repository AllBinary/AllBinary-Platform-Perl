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

package views::business::context::modules::storefront::customizer::template::objectConfig::NoTemplateTransformInfoObjectConfig;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfig';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
}

sub new {
    my ($class, @arguments) = @_;
    return $class->_new1(@arguments) if scalar(@arguments) == 1;
    return $class->_new2(@arguments) if scalar(@arguments) == 2;
    return $class->_new3(@arguments) if scalar(@arguments) == 3;
    die "No constructor of NoTemplateTransformInfoObjectConfig takes " . scalar(@arguments) . " arguments";
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
sub generate {
    my ($self, $objectConfigDocument) = @_;
        my $docString = 'org::allbinary::data::tree::dom::document::XmlDocumentHelper'->toString($objectConfigDocument);
        if ($views::business::context::modules::storefront::customizer::template::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::template::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
            $self->{logUtil}->putF("Initial ObjectConfig: " . $docString, $self, "generate()");
        }
        my $storeName = $self->getTransformInfoInterface()->getStoreName();
        my $viewName = $self->getTransformInfoInterface()->getName();
        my $hashMap = 'org::allbinary::logic::StdUtil'->getInstance()->createHashMap();
        my $VARKEY = 'org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData'->getInstance()->{VARKEY};
        $hashMap->put($VARKEY . 'org::allbinary::business::context::modules::storefront::StoreFrontData'->getInstance()->{NAME}, $storeName);
        $hashMap->put($VARKEY . 'org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{OWNER}, $viewName);
        my $pageName = 'org::allbinary::logic::visual::transform::template::util::TransformTemplateCustomizerUtil'->getInstance()->getPageNameHack($self->getTransformInfoInterface()->getName(), $self->getTransformInfoInterface()->getStoreName());
        $hashMap->put($VARKEY . 'org::allbinary::logic::visual::transform::info::TransformInfoData'->getInstance()->{PARTIAL}, $pageName);
        my $replace = 'org::allbinary::logic::string::regex::replace::Replace'->new($hashMap);
        my $newObjectConfigDocument = 'org::allbinary::data::tree::dom::document::DomDocumentHelper'->create($replace->all($docString));
        if ($views::business::context::modules::storefront::customizer::template::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::business::context::modules::storefront::customizer::template::objectConfig::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{VIEW})) {
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
use org::allbinary::logic::string::regex::replace::Replace;
use org::allbinary::logic::visual::transform::info::TransformInfoData;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfig;
use org::allbinary::logic::visual::transform::info::objectConfig::TransformInfoObjectConfigData;
use org::allbinary::logic::visual::transform::template::util::TransformTemplateCustomizerUtil;
use org::w3c::dom::Document;

1;

