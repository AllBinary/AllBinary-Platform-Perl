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

package views::admin::customizers::CustomizersView;
use strict;
use warnings;
use feature 'try';
no warnings 'experimental::try';
use parent -norequire,'views::business::context::modules::storefront::HttpStoreComponentView','org::allbinary::data::tree::dom::DomNodeInterface';


sub _init_fields {
    my ($self) = @_;
    $self->{logUtil} = 'org::allbinary::logic::communication::log::LogUtil'->getInstance();
    $self->{commonStrings} = 'org::allbinary::string::CommonStrings'->getInstance();
    $self->{customizersVector} = undef;
}


sub new {
    my ($class, $transformInfoInterface) = @_;
    my $self = $class->SUPER::new($transformInfoInterface);
    $self->_init_fields();
        # super(...) made $self above
        $self->{customizersVector} = 'org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder'->getInstance()->getNames($self->getWeblisketSession()->getStoreName());
    return $self;
}


sub toXmlNode {
    my ($self, $document) = @_;
        try {
            my $node = $document->createElement($org::allbinary::logic::visual::transform::template::customizer::TransformTemplateCustomizersData::NAME);
            my $unsortedCustomizerViewVector = 'org::allbinary::util::BasicArrayListD'->new();
            my $size = $self->{customizersVector}->size();
            for (my $index = 0; $index < $size; $index++) {
                my $viewName = $self->{customizersVector}->get($index);
                if (index($viewName, $org::allbinary::logic::visual::transform::info::CustomizerTransformInfoData::NAME) > 0 && index($viewName, $org::allbinary::globals::GLOBALS2::EDIT) > 0 && index($viewName, 'org::allbinary::logic::visual::transform::template::customizer::bodies::BodyData'->getInstance()->{VIEWNAMEKEY}) > 0 && index($viewName, 'org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData'->getInstance()->{VIEWNAMEKEY}) > 0) {
                    $unsortedCustomizerViewVector->add($viewName);
                }
            }
            my $objectArray = $unsortedCustomizerViewVector->toArray();
            'java::util::Arrays'->sort($objectArray, 'org::allbinary::logic::control::sort::StringComparator'->new());
            for (my $index = 0; $index < scalar(@{$objectArray}); $index++) {
                my $viewName = $objectArray->[$index];
                my $viewNameNode = 'org::allbinary::data::tree::dom::ModDomHelper'->createNameValueNodes($document, $org::allbinary::logic::visual::transform::template::customizer::TransformTemplateCustomizerData::NAME, $viewName, 'org::allbinary::logic::visual::transform::template::util::TransformTemplateCustomizerUtil'->getInstance()->getPageNameHack($viewName, $self->getWeblisketSession()->getStoreName()));
                $node->appendChild($viewNameNode);
            }
            return $node;
        } catch ($e) {
            if ($views::admin::customizers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::customizers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{XSLLOGGINGERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{FAILURE}, $self, "toXmlNode", $e);
            }
            return undef;
        }
}


sub addDomNodeInterfaces {
    my ($self) = @_;
        $self->addDomNodeInterface($self);
}


# throws Exception
sub view {
    my ($self) = @_;
        try {
            $self->addDomNodeInterfaces();
            return $self->SUPER::view();
        } catch ($e) {
            if ($views::admin::customizers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypes}->{LOGGING}->contains($views::admin::customizers::org::allbinary->{logic}->{communication}->{log}->{config}->{type}->{LogConfigTypeFactory}->getInstance()->{TAGHELPERERROR})) {
                $self->{logUtil}->put($self->{commonStrings}->{EXCEPTION}, $self, "view()", $e);
            }
            die $e;
        }
}

# use java::util::Arrays;
use org::allbinary::util::BasicArrayList;
use org::allbinary::util::BasicArrayListD;
use org::allbinary::data::tables::transform::info::TransformInfoEntityBuilder;
use org::allbinary::data::tree::dom::DomNodeInterface;
use org::allbinary::data::tree::dom::ModDomHelper;
use org::allbinary::globals::GLOBALS2;
use org::allbinary::logic::StdUtil;
use org::allbinary::logic::communication::log::LogUtil;
use org::allbinary::logic::control::sort::StringComparator;
use org::allbinary::logic::visual::transform::info::CustomizerTransformInfoData;
use org::allbinary::logic::visual::transform::info::TransformInfoInterface;
use org::allbinary::logic::visual::transform::template::customizer::TransformTemplateCustomizerData;
use org::allbinary::logic::visual::transform::template::customizer::TransformTemplateCustomizersData;
use org::allbinary::logic::visual::transform::template::customizer::bodies::BodyData;
use org::allbinary::logic::visual::transform::template::customizer::widgets::title::TitleData;
use org::allbinary::logic::visual::transform::template::util::TransformTemplateCustomizerUtil;
use org::allbinary::string::CommonStrings;
use org::w3c::dom::Document;
use org::w3c::dom::Node;
use views::business::context::modules::storefront::HttpStoreComponentView;

1;

